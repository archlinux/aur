# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgname=man-pages
pkgname=man-pages-posix-hyphens-fixed
pkgver=5.03
_posixver=2013-a
pkgrel=1
pkgdesc="Linux man pages"
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
arch=('any')
license=('GPL' 'custom')
url="http://man7.org/linux/man-pages/index.html"
source=(https://www.kernel.org/pub/linux/docs/man-pages/$_pkgname-$pkgver.tar.{xz,sign}
        https://www.kernel.org/pub/linux/docs/man-pages/man-pages-posix/$_pkgname-posix-${_posixver}.tar.{xz,sign})
# https://www.kernel.org/pub/linux/docs/man-pages/sha256sums.asc
sha256sums=('7fe13aeaf9081f4c134c711270a66e264dce24dae3df7e9fec3dd18c8a485120'
            'SKIP'
            '19633a5c75ff7deab35b1d2c3d5b7748e7bd4ef4ab598b647bb7e7f60b90a808'
            'SKIP')
validpgpkeys=('E522595B52EDA4E6BFCCCB5E856199113A35CE5E') #Michael Kerrisk (Linux man-pages maintainer) <mtk.manpages@gmail.com>

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
  # included in coreutils
  rm -f man1/{chgrp,chmod,chown,cp,dir,dd}.1
  rm -f man1/{df,dircolors,du,install,ln,ls}.1
  rm -f man1/{mkdir,mkfifo,mknod,mv,rm,rmdir}.1
  rm -f man1/{touch,vdir}.1
  # included in shadow
  rm -f man5/passwd.5
  rm -f man3/getspnam.3
  # included in diffutils
  rm -f man1/diff.1
  # included in xf86-input-mouse
  rm -f man4/mouse.4
  # included in attr
  rm -f man5/attr.5
  # included in lirc
  rm -f man4/lirc.4
  # included in keyutils
  rm -f man7/{keyrings.7,persistent-keyring.7,process-keyring.7,session-keyring.7,thread-keyring.7,user-keyring.7,user-session-keyring.7}
  # included in tzdata
  rm -f man5/tzfile.5 man8/{tzselect,zdump,zic}.8
}
