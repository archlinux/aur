# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Lubosz Sarnecki < lubosz at gmail dot com >

pkgname=compressonator-git
pkgdesc='Tool suite for Texture and 3D Model Compression, Optimization and Analysis'
pkgver=4.5.52.r21.gf4b53d79
pkgrel=1
url='https://github.com/GPUOpen-Tools/Compressonator'
arch=(x86_64)
license=('MIT')
makedepends=(
  'cmake'
  'git'
  'glm'
  'opencv'
  'python-sphinx'
)
depends=(
  'glibc'
  'openexr'
  'libstdc++'
  'libgcc'
)
provides=('compressonator')
conflicts=('compressonator')
_rapidxml_commit=2ae4b2888165a393dfb6382168825fddf00c27b9
source=("git+${url}.git"
        'compressonator-cmake-build-type.patch'
        'compressonator-gcc-16-fix.patch'
        'compressonator-imath-half-conflict.patch'
        'compressonator-skip-externals.patch'
        "rapidxml.tar.gz::https://github.com/discord/rapidxml/archive/${_rapidxml_commit}.tar.gz")
b2sums=('SKIP'
        '090558b7e5eb691f94b46980ca28af752eb72213643800d548e71630e5515a0fef36964a444cc99f89c63094e8d7cc392ae6cb1639281d5f24adf33aebeca8fa'
        '29858a71b07730919d90299b134ae6a20e8f0de7b5bc5dfce4b329e97a433ef57c4086b6342c1b9bd32f278aa56dd5d54a2ece8cf63f428113b2d5c1581cf93d'
        '4113114bcb94365d5028bd1cb5bf4b974a16ac195f22a2c8431f0ea05509470c2a2c05bb7758fc37327142cfb9955ab8b8dddf3fca9d16288996182ed335c40a'
        '0a6231476b3566b3cf04a6d9eadab674f2ce595051680a2699403189d4872c1e779d527b20dfcd212743f6b1a9c4795e6f3c8252bc6a78b55a695aecdd6a0400'
        'e65a411abf594ca0c198dd8c329cdedfdfa79349e2149251d5c318249e4f21af1e402cf8831415714ed801c24dcf09d654f072038488097805173e37cc722f36')

pkgver() {
  cd Compressonator
  # shellcheck disable=SC2312 # will render pkgver invalid on fail
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p common/lib/ext
  ln -v -sr "rapidxml-${_rapidxml_commit}" -T common/lib/ext/rapidxml

  cd Compressonator
  patch -t -Np1 -i ../compressonator-cmake-build-type.patch
  patch -t -Np1 -i ../compressonator-gcc-16-fix.patch
  patch -t -Np1 -i ../compressonator-imath-half-conflict.patch
  patch -t -Np1 -i ../compressonator-skip-externals.patch
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_INSTALL_SBINDIR=bin
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_BUILD_TYPE=None
    -D BUILD_SHARED_LIBS=ON
    -D OPTION_ENABLE_ALL_APPS=OFF
    -D OPTION_BUILD_APPS_CMP_CLI=ON
    # Qt5 WebEngine dropped from extra. I'll
    # re-add the GUI if upstream moves to Qt6.
    -D OPTION_BUILD_APPS_CMP_GUI=OFF
  )
  cmake -B build -S Compressonator "${cmake_options[@]}"
  cmake --build build

  python -m sphinx -M html Compressonator/docs/source docs
}

package() {
  install -vD -m644 build/bin/compressonatorcli-bin \
    -T "${pkgdir}/usr/bin/compressonatorcli"

  install -vd "${pkgdir}/usr/share/doc"
  cp -v -ar docs/html -T "${pkgdir}/usr/share/doc/compressonator"

  install -vD -t "${pkgdir}/usr/share/compressonator/images/" \
    -m644 Compressonator/runtime/images/*

  install -vD -m644 Compressonator/license/clilicense.txt \
    -T "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
