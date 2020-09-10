# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: ptrv <mail@petervasil.net>

_name=sc3-plugins
pkgname=sc3-plugins-git
pkgver=3.11.0.r2.g03b233b
pkgrel=1
pkgdesc="Extension plugins for the SuperCollider3 audio synthesis server."
arch=('i686' 'x86_64')
url="https://github.com/supercollider/sc3-plugins"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'supercollider')
makedepends=('cmake' 'fftw' 'git' 'stk')
conflicts=('sc3-plugins')
provides=('sc3-plugins')
source=("${_name}::git+https://github.com/supercollider/sc3-plugins"
        "git+https://github.com/timblechmann/nova-simd.git"
        "git+https://github.com/thestk/stk.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/Version.//g'
}

prepare() {
  cd "$_name"
  git submodule init
  git config submodule.external_libraries/nova-simd.url "${srcdir}/nova-simd"
  git config submodule.external_libraries/stk.url "${srcdir}/stk"
  git submodule update
}

build() {
  cd "$_name"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -DSC_PATH=/usr/include/SuperCollider/ \
        -DSYSTEM_STK=ON \
        -DSUPERNOVA=1\
        -W no-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libfftw3f.so' 'libstk-4.6.1.so')
  cd "$_name"
  make DESTDIR="$pkgdir/" install -C build
  install -vDm 644 {{DEVELOPING,README}.md,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
