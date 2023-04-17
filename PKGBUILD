# Maintainer: syfds <github.com/syfds>
# Contributor: MvBonin <github.com/MvBonin>

_pkgname=soundy
pkgname=$_pkgname-git
pkgver=r223.6f7aca3
pkgrel=1
pkgdesc="Simple GTK client to control your Bose SoundTouch speaker - Development version"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/syfds/soundy"
license=('GPL-3.0')
depends=('gtk3' 'granite' 'glib2' 'libsoup' 'libxml2' 'avahi')
makedepends=('git' 'meson')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git+https://github.com/syfds/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
cd ${srcdir}/${_pkgname}
echo "r$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  rm -rf build
  meson --prefix=/usr \
    . build

  ninja -C build
}

package(){
  cd "$_pkgname"

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t"$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
