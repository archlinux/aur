# Maintainer: Rustmilian

pkgname=glew-wayland-git
pkgver=2.2.0.r41.g5a2307f
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="https://github.com/nigels-com/glew"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
makedepends=('git' 'python' 'perl')
provides=('glew' 'libGLEW.so')
conflicts=('glew')
source=("git+${url}.git"
        "glew-install.patch")
sha256sums=('SKIP'
            '30c77b49ff64f5b936368426f957a217b6d8a3f8d0c83a7eaa69222ed45cd811')

pkgver() {
  cd ${pkgname%-wayland-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g; s/glew.//'
}

prepare() {
  cd ${pkgname%-wayland-git}
  patch -Np1 -i ../glew-install.patch
  sed -i 's|lib64|lib|' config/Makefile.linux
  sed -i '/^.PHONY: .*\.pc$/d' Makefile
  cd auto
  make
  cd glfixes
  ./sync.sh
}

build() {
  make extensions STRIP= SYSTEM=linux-egl -C glew
}

package() {
  cd ${pkgname%-wayland-git}
  make GLEW_DEST="$pkgdir/usr" SYSTEM=linux-egl install.all
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

