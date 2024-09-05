# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Peter Jung <admin@ptr1337.dev>

pkgname=virtme-ng
_virtme_ng_init_commit=6e2b515c5c178ba2ae3206933024ad24f658f368
pkgver=1.28
pkgrel=2
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('x86_64')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
depends=(
  busybox
  coreutils
  gcc-libs
  glibc
  python
  python-requests
  qemu
  virtiofsd
  python-argparse-manpage
)
makedepends=(
  cargo
  git
  python-argcomplete
  python-setuptools
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/arighi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
       "virtme-init-ng-${_virtme_ng_init_commit}.zip::https://github.com/arighi/virtme-ng-init/archive/${_virtme_ng_init_commit}.zip")
b2sums=('ead3881418135f0aece994193efa30529863329a50acc2414c0672450da38d84b010528b88167a53d26a2113822795a4e01757730647d063174fac9af639009f'
        '6ca1d1288a07286bf8a240ec9e0ae955b5126936d51d902276050735df474e3be01d8f5238d08cfa3822a1c9310dcccc84bd69837c8bde1ac49d249f8c6e1d61')
conflicts=('virtme')

prepare() {
    cd "${srcdir}"

    # When rebuilding this dir is not empty, so rmdir(1) fails
    rm -rf "${pkgname}-${pkgver}/virtme_ng_init"

    cp -r "virtme-ng-init-${_virtme_ng_init_commit}" "${pkgname}-${pkgver}/virtme_ng_init"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    BUILD_VIRTME_NG_INIT=1 python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
