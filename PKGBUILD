# Contributor: NexAdn <git@nexadn.de>
# Maintainer: javsanpar <javsanpar@riseup.net>
pkgname=abaddon-git
_pkgname=abaddon
pkgver=0.1.9.r32.gc5af6ed
pkgrel=1
pkgdesc='An alternative Discord client made with C++/gtkmm'
url='https://github.com/uowuo/abaddon'
source=("git+https://github.com/uowuo/abaddon"
        $_pkgname.desktop)
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'cmake' 'nlohmann-json')
depends=('gtkmm3' 'libhandy')
conflicts=('abaddon')
provides=('abaddon')
sha256sums=('SKIP'
            '7840732362b8f2202cf79b7d7c2eb0e2cbd5a83dc45c5fca4609ec15b8bea6df')

prepare () {
  cd "$_pkgname"

  git submodule update --init subprojects/ixwebsocket/
  git submodule update --init subprojects/keychain/
  git submodule update --init subprojects/miniaudio/
}

build () {
  cmake -B build -S "$_pkgname"
  make -C build
}

package() {
  install -Dm755 build/abaddon "$pkgdir"/usr/bin/abaddon

  install -Dm644 "$_pkgname"/res/css/* -t "$pkgdir"/usr/share/abaddon/css
  install -Dm644 "$_pkgname"/res/res/* -t "$pkgdir"/usr/share/abaddon/res

  install -Dm755 abaddon.desktop \
    "$pkgdir"/usr/share/applications/abaddon.desktop
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
