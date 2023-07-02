# Maintainer: 0xMRTT <0xMRTT@proton.me>

pkgname=bavarder-git
_pkgname=Bavarder
pkgver=0.2.4.r16.gbb25bd1
pkgrel=1
pkgdesc="Chit-Chat with AI"
arch=('any')
url="https://bavarder.codeberg.page"
license=('GPL3')
depends=('libadwaita' 'python-gobject'  'python-lxml'  'python-openai'
         'python-hgchat' 'python-gtts' 'python-baichat-py'
         'python-googlebardpy' 'python-requests')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://codeberg.org/Bavarder/Bavarder.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # fix binary permissions
  chmod 0755 "$pkgdir/usr/bin/${pkgname%-git}"

}
