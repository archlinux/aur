# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=lib32-gsm
_pkgbase=gsm
pkgver=1.0.14
pkgrel=1
pkgdesc="Shared libraries for GSM 06.10 lossy speech compression"
arch=('x86_64')
url="http://www.quut.com/gsm/"
license=('custom')
makedepends=('gcc-multilib')
depends=('glibc' 'gsm')
source=("http://www.quut.com/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz"
        'gsm.patch')
sha256sums=('5814a16a30b3c026871b3739812dc4a2a84299331182c987da1c212c93e9352c'
            'f2883e05bfe7faa6298c61bd68fbf99fed6b5e1024267547667ca859d33b74a1')

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver%.*}-pl${pkgver##*.}/"

  patch -Np0 -i "${srcdir}/${_pkgbase}.patch"

  # flags for shared lib
  CFLAGS="${CFLAGS} -fPIC"
  make -j1 \
    CC="gcc -m32" \
    CCFLAGS="-c ${CFLAGS}" \
    INSTALL_ROOT="${pkgdir}/usr" \
    GSM_INSTALL_LIB="${pkgdir}/usr/lib32" \
    GSM_INSTALL_INC="${pkgdir}/usr/include/gsm" \
    GSM_INSTALL_MAN="${pkgdir}/usr/share/man/man3" \
    TOAST_INSTALL_MAN="${pkgdir}/usr/share/man/man1"
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver%.*}-pl${pkgver##*.}/"

  # Prepare directories
  install -m755 -d "${pkgdir}"/usr/{bin,lib,lib32,include/gsm,share/{licenses/${_pkgbase},man/man{1,3}}}

  make -j1 \
    CC="gcc -m32" \
    CCFLAGS="-c ${CFLAGS}" \
    INSTALL_ROOT="${pkgdir}/usr" \
    GSM_INSTALL_LIB="${pkgdir}/usr/lib32" \
    GSM_INSTALL_INC="${pkgdir}/usr/include/gsm" \
    GSM_INSTALL_MAN="${pkgdir}/usr/share/man/man3" \
    TOAST_INSTALL_MAN="${pkgdir}/usr/share/man/man1" \
    install

  # clean directories provided by 64-bit package
  rm -Rf "${pkgdir}"/usr/{bin,include,lib,share}
}
