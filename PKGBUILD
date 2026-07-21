# Maintainer: tuanlyphong
pkgname=anime_tui
pkgver=0
pkgrel=1
pkgdesc='Terminal anime browser and player'
arch=('any')
url='https://github.com/tuanlyphong/anime_tui'
license=('custom:project')
depends=('nodejs' 'fzf' 'mpv' 'java-runtime' 'chromium')
makedepends=('git' 'npm')
provides=('anime-tui')
conflicts=('anime-tui')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/anime_tui"
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/anime_tui"
  npm ci --omit=dev --ignore-scripts
}

package() {
  cd "$srcdir/anime_tui"
  install -dm755 "$pkgdir/usr/share/anime-tui"
  cp -a anime.js lib package.json package-lock.json node_modules abyss-dl.jar \
    "$pkgdir/usr/share/anime-tui/"
  install -Dm755 tui_anime.sh "$pkgdir/usr/share/anime-tui/tui_anime.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/anime-tui" <<'EOF'
#!/bin/sh
export ABYSS_DL_JAR="${ABYSS_DL_JAR:-/usr/share/anime-tui/abyss-dl.jar}"
exec /usr/share/anime-tui/tui_anime.sh "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/anime-tui"
}
