# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on PKGBUILD by:
# Based on dislocker PKGBUILD maintained by: Rafal Malachowicz <k5hv@archlinux.info>
# Based on dislocker PKGBUILD maintained by: mrxx <mrxx at cyberhome dot at>

_pkgname=dislocker
pkgname=dislocker-patched
pkgver=0.7.4.r0.g21ef6e5
pkgrel=1
pkgdesc="FUSE driver to read/write Windows' BitLocker-ed volumes. May include patches from Issues and PRs from official Aorimn/dislocker. Added aarch64."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Aorimn/dislocker"
license=('GPL-2.0-or-later')
depends=('mbedtls3' 'fuse3' 'ruby')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=('ntfs-3g: NTFS file system support')
source=(
  'git+https://github.com/Aorimn/dislocker.git#commit=21ef6e58deb400502121e80fc0dfc7d9974e364f'
)
sha512sums=('68ca0bdcd25e7fbd7d60679ddfaf77967eb816ad4d0ebb29ff204f318e1243eff154ecabd324b916afb92d89271e66d5d251a7a48677f069665b43761fffe432')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd "$srcdir/${_pkgname}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DMbedTLS_DIR=/usr/lib/mbedtls3/cmake/MbedTLS \
        -Dlibdir=/usr/lib \
        -DCRYPTO_BACKEND=mbedtls \
        -DWITH_RUBY=ON \
        -DBUILD_TESTING=ON \
        -DWARN_FLAGS:STRING="-Wall -Wextra" \
        .
  make
}

check() {
  ctest --test-dir "$srcdir/${_pkgname}" --output-on-failure
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
