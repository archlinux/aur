# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=qmc-decoder-git
_pkgname=${pkgname%-git}
pkgver=2.5.r17.g26be1f5
pkgrel=1
pkgdesc="Fastest & best convert qmc 2 mp3 | flac tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/Presburger/qmc-decoder"
license=('MIT')
makedepends=('cmake'
             'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_submodule='filesystem'
source=("git+https://github.com/Presburger/${_pkgname}"
        "git+https://github.com/gulrak/${_submodule}.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${_pkgname}

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}

  git submodule init
  git config submodule.${_submodule}.url $srcdir/${_submodule}
  git submodule update
}

build() {
  cmake -B ${_pkgname}/build -S ${_pkgname} \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -Wno-dev
  make -C ${_pkgname}/build
}

package() {
  _binaryname=${_pkgname/qmc-}

  install -Dm755 ${_pkgname}/build/${_binaryname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm644 ${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim: set sw=2 ts=2 et:
