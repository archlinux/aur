# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgname=man-pages
pkgname=man-pages-posix-hyphens-fixed
pkgver=5.08
_posixver=2013-a
pkgrel=1
pkgdesc="Linux man pages"
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
arch=('any')
license=('GPL' 'custom')
url="https://www.kernel.org/doc/man-pages/"
source=(https://www.kernel.org/pub/linux/docs/man-pages/$_pkgname-$pkgver.tar.{xz,sign}
        https://www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/$_pkgname-posix-${_posixver}.tar.{xz,sign})
# https://www.kernel.org/pub/linux/docs/man-pages/sha256sums.asc
sha256sums=('cea7cd31f8080ed8ec6725419e58bbe04ab0dd4fa0071526bd7cf0cd8d1bf7f7'
            'SKIP'
            '19633a5c75ff7deab35b1d2c3d5b7748e7bd4ef4ab598b647bb7e7f60b90a808'
            'SKIP')
validpgpkeys=('E522595B52EDA4E6BFCCCB5E856199113A35CE5E') # Michael Kerrisk (Linux man-pages maintainer) <mtk.manpages@gmail.com>

prepare() {
    cd "${srcdir}"/$_pkgname-posix-$_posixver
    sed -i 's/\\(mi/\-/g' man?p/*
}

build() {
  cd "${srcdir}"/$_pkgname-$pkgver

  # move the posix pages
  mkdir -p "${srcdir}"/$_pkgname-$pkgver/man0
  for sect in 0 1 3; do
    sed -i "/^\.so /s/man${sect}p/man$sect/" "${srcdir}/$_pkgname-posix-${_posixver}/man${sect}p"/*
    mv -iv "${srcdir}/$_pkgname-posix-${_posixver}/man${sect}p"/* "${srcdir}/$_pkgname-$pkgver/man$sect/"
  done
}

package() {
  cd "${srcdir}"/$_pkgname-$pkgver

  make prefix="${pkgdir}"/usr install

  # posix pages have a custom license
  install -m755 -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 "${srcdir}"/$_pkgname-posix-${_posixver}/POSIX-COPYRIGHT "${pkgdir}/usr/share/licenses/${_pkgname}/POSIX-COPYRIGHT"

  cd "${pkgdir}"/usr/share/man
  # included in shadow
  rm man5/passwd.5
  rm man3/getspnam.3
  # included in tzdata
  rm man5/tzfile.5 man8/{tzselect,zdump,zic}.8
  # included in bpf
  rm man7/bpf-helpers.7
  # included in libxcrypt
  rm man3/crypt*.3
}
