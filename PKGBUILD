# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=hyperion
_gitrev=e93bd2fb303be6b91e0c241efb30dc0a1bf04b2f
pkgver=r666.e93bd2f
pkgrel=1
pkgdesc="Opensource 'AmbiLight' implementation"
url="http://code.google.com/p/boblight/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('libusbx' 'python' 'qt4')
makedepends=('cmake' 'doxygen' 'git')
source=("git://github.com/tvdzwan/hyperion.git#commit=$_gitrev"
        "${pkgname}d.service")
md5sums=('SKIP'
         '3c81238f5018ae1ed5a19d2058ccbe7f')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  cd "$pkgname"
  git submodule init
  git submodule update
}

build() {
  cd build
  cmake -DENABLE_DISPMANX=OFF \
        -DENABLE_X11=ON \
        ../$pkgname

  make
}

package() {
  cd build

  mkdir -p "$pkgdir/usr/bin"
  cp bin/$pkgname* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r "$srcdir/$pkgname/effects" "$pkgdir/usr/lib/$pkgname"

  mkdir -p "$pkgdir/etc"
  cp "$srcdir/$pkgname/config/${pkgname}_x86.config.json" "$pkgdir/etc/$pkgname.config.json"
  sed -i "s/home\/dincs\/projects/usr\/lib/g" "$pkgdir/etc/$pkgname.config.json"

  install -Dm644 "$srcdir/${pkgname}d.service" "$pkgdir/usr/lib/systemd/system/${pkgname}d.service"
}
