# Maintainer: prezdev

pkgname=ferrum-git
pkgver=0
pkgrel=2
pkgdesc="Linux-native GTK frontend + Spring Boot backend for browsing Metal Archives"
arch=('x86_64')
url="https://github.com/prezdev88/ferrum"
license=('custom')
provides=('ferrum')
conflicts=('ferrum')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'python-requests'
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
  local app_root="$pkgdir/usr/lib/ferrum"
  install -d "$app_root"

  # Backend JAR
  local jar_path
  jar_path="$(find "$srcdir/${pkgname%-git}/back/target" -maxdepth 1 -type f -name 'ferrum-*.jar' ! -name '*.original' | head -n 1)"
  [[ -n "$jar_path" ]]
  install -Dm644 "$jar_path" "$app_root/ferrum-backend.jar"

  # Frontend Python package + CSS
  install -Dm644 "$srcdir/${pkgname%-git}/front/style.css" "$app_root/style.css"
  install -Dm644 "$srcdir/${pkgname%-git}/front/ferrum_gnome/__init__.py" "$app_root/ferrum_gnome/__init__.py"
  install -Dm644 "$srcdir/${pkgname%-git}/front/ferrum_gnome/app.py" "$app_root/ferrum_gnome/app.py"
  install -Dm644 "$srcdir/${pkgname%-git}/front/ferrum_gnome/backend.py" "$app_root/ferrum_gnome/backend.py"
  install -Dm644 "$srcdir/${pkgname%-git}/front/ferrum_gnome/models.py" "$app_root/ferrum_gnome/models.py"
  install -Dm644 "$srcdir/${pkgname%-git}/front/ferrum_gnome/settings.py" "$app_root/ferrum_gnome/settings.py"

  # Launcher
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/ferrum" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

APP_ROOT="/usr/lib/ferrum"
JAR_PATH="$APP_ROOT/ferrum-backend.jar"

BACKEND_PORT="${FERRUM_BACKEND_PORT:-18080}"
BACKEND_URL="${FERRUM_BACKEND_URL:-http://localhost:${BACKEND_PORT}}"
BACKEND_LOG="${FERRUM_BACKEND_LOG:-/tmp/ferrum-backend.log}"
BACKEND_PID=""

cleanup() {
  if [[ -n "${BACKEND_PID}" ]] && kill -0 "${BACKEND_PID}" 2>/dev/null; then
    kill "${BACKEND_PID}" 2>/dev/null || true
    wait "${BACKEND_PID}" 2>/dev/null || true
  fi
}

trap cleanup EXIT

export PYTHONPATH="$APP_ROOT${PYTHONPATH:+:$PYTHONPATH}"
export FERRUM_BACKEND_URL="$BACKEND_URL"

java -jar "$JAR_PATH" --server.port="$BACKEND_PORT" >"$BACKEND_LOG" 2>&1 &
BACKEND_PID="$!"

python3 -m ferrum_gnome.app
EOF
}
