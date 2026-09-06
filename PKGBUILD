# Maintainer: Sergius <sergius AT sarbs DOT xyz>

_gitname=surf
pkgname=sarbs-surf-git
pkgver=2026.09.06.r10.g67169d9
pkgrel=1
pkgdesc="Sergi's Build von surf, dem Suckless-Browser (Teil von SARBS)"
arch=('x86_64')
url="https://github.com/Sergi-us/surf"
license=('MIT')
# glibc: nur aufgenommen, um die namcap-Warnung „implicitly satisfied"
# ruhigzustellen (libc ist ohnehin Teil des Basissystems).
depends=('glibc' 'webkit2gtk-4.1' 'gcr' 'gtk3' 'libx11' 'glib2')
makedepends=('git' 'pkgconf')
provides=('surf')
conflicts=('surf')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "%s.r%s.g%s" "$(git log -1 --format=%cd --date=format:'%Y.%m.%d')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  # Support CFLAGS, LDFLAGS, etc.
  sed -i 's/^CPPFLAGS =/CPPFLAGS +=/' config.mk
  # Arch liefert nur noch webkit2gtk-4.1; die API ist für surf kompatibel
  sed -i 's/webkit2gtk-4\.0/webkit2gtk-4.1/g
          s/webkit2gtk-web-extension-4\.0/webkit2gtk-web-extension-4.1/g' config.mk
}

build() {
  cd "$_gitname"
  make PREFIX=/usr
}

package() {
  cd "$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
