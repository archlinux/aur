# Maintainer: prezdev

pkgname=ferrum-git
pkgver=1.0.0.r11.gf843552
pkgrel=1
pkgdesc="Electron frontend + Spring Boot backend for browsing Metal Archives"
arch=('x86_64')
url="https://github.com/prezdev88/ferrum"
license=('custom')
provides=('ferrum')
conflicts=('ferrum')
depends=(
  'electron'
  'jre21-openjdk'
)
optdepends=(
  'firefox: browser runtime for Playwright (if not using bundled download)'
)
makedepends=(
  'git'
  'maven'
)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	local d
	d="$(git describe --tags --long --always 2>/dev/null)" || return 1
	d="${d#v}"

	if [[ "$d" =~ ^([0-9]+(\.[0-9]+){2})-0-g([0-9a-f]+)$ ]]; then
		printf '%s\n' "${BASH_REMATCH[1]}"
	elif [[ "$d" =~ ^([0-9]+(\.[0-9]+){2})-([0-9]+)-g([0-9a-f]+)$ ]]; then
		printf '%s.r%s.g%s\n' "${BASH_REMATCH[1]}" "${BASH_REMATCH[3]}" "${BASH_REMATCH[4]}"
	else
		printf '%s\n' "$d" | sed 's/-/./g'
	fi
}

build() {
  cd "$srcdir/${pkgname%-git}/back"
  mvn -Dmaven.repo.local="$srcdir/.m2" -DskipTests package
}

package() {
  local repo_root="$srcdir/${pkgname%-git}"
  local app_root="$pkgdir/usr/lib/ferrum"
  local electron_root="$app_root/front-electron"
  install -d "$electron_root"

  local jar_path
  jar_path="$(find "$repo_root/back/target" -maxdepth 1 -type f -name 'ferrum-*.jar' ! -name '*.original' | head -n 1)"
  [[ -n "$jar_path" ]]
  install -Dm644 "$jar_path" "$app_root/ferrum-backend.jar"

  install -Dm644 "$repo_root/front-electron/package.json" "$electron_root/package.json"
  install -Dm644 "$repo_root/front-electron/index.html" "$electron_root/index.html"
  install -Dm644 "$repo_root/front-electron/main.js" "$electron_root/main.js"
  install -Dm644 "$repo_root/front-electron/preload.js" "$electron_root/preload.js"
  install -Dm644 "$repo_root/front-electron/renderer.js" "$electron_root/renderer.js"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/ferrum" <<'LAUNCHER'
#!/usr/bin/env bash
set -euo pipefail

APP_ROOT="/usr/lib/ferrum"
FRONT_ROOT="$APP_ROOT/front-electron"

export FERRUM_BACKEND_JAR="${FERRUM_BACKEND_JAR:-$APP_ROOT/ferrum-backend.jar}"
exec electron "$FRONT_ROOT"
LAUNCHER
}
