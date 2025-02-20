# Based of openglide-git by Jamie Christian <itschristian at gmail dot com>
# Courtesy of kharovtobi <https://github.com/kharovtobi>

_pkgname=openglide
pkgname=$_pkgname-3dfx
pkgver=r117.a1c3605
pkgrel=1
pkgdesc="Host OpenGlide wrapper for QEMU-3dfx"
arch=(x86_64)
url="https://github.com/kjliew/qemu-xtra"
license=('GPL2' 'LGPL-2.1')
options=(!libtool)
depends=('mesa' 'sdl' 'glu' 'libsm')
makedepends=('git')
provides=('openglide-git')
conflicts=('openglide-git')
source=(
  "$_pkgname::git+https://github.com/kjliew/qemu-xtra.git"
  "q3dlog"
)
md5sums=(
  'SKIP'
  '1552636e7a4ed58118ecda5a90e178d3'
)

pkgver() {
    cd "$srcdir"/"$_pkgname"
    echo r$(git rev-list --count HEAD).$(git rev-parse --short=7 HEAD)
}

build() {
  cd "$srcdir/$_pkgname/openglide"
  bash ./bootstrap
  rm -rf ../build && mkdir ../build && cd ../build
  ../openglide/configure --disable-sdl --prefix=/usr
  make
  libtool --finish /usr/lib

}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install
  libtool --finish "$pkgdir"/usr/lib
  install -Dm755 "$srcdir"/q3dlog "$pkgdir"/usr/bin/q3dlog
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
