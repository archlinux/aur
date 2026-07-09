# Maintainer: Sterophonick
pkgname=rexglue-sdk-git
pkgver=0.8.0.r4.ge8ce24f
pkgrel=1
pkgdesc='Static recompilation runtime SDK for Xbox 360'
url='https://github.com/rexglue/rexglue-sdk'
arch=(any)
source=(git+https://github.com/rexglue/rexglue-sdk 10-rexglue-env.conf)
depends=(clang cmake ninja vcpkg)
md5sums=('SKIP' '6b7864764e3002a8c8cde3e56b1a09dd')
license=('Custom')
options=(!strip)

pkgver() {
  cd "$srcdir/rexglue-sdk"
  git describe --tags --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/rexglue-sdk"
  git pull --recurse-submodules
  git submodule update --init --recursive
  
  cmake --preset linux-amd64
  cmake --build out/build/linux-amd64 --target install
}

package() {
  install -Dm644 "$srcdir/10-rexglue-env.conf" "$pkgdir/etc/environment.d/10-rexglue-env.conf"
  
  mkdir -p $pkgdir/opt/rexglue-sdk
  cp -r $srcdir/rexglue-sdk/out/install/linux-amd64/* $pkgdir/opt/rexglue-sdk
  
  # RexGlue literally doesn't work unless the SDK is user-readable. Whoops
  chmod -R 777 $pkgdir/opt/rexglue-sdk
}
