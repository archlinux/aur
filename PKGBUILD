# Contributor: Markus Theil <aur@thillux.de>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Christophe Gueret <tolgam@homegnu.net>
pkgname=blt25
_dirname=blt2.5
pkgver=2.5.3
pkgrel=1
pkgdesc="Adds new commands and widgets to the Tcl interpreter."
url="https://sourceforge.net/projects/wize/"
license=("custom")
depends=('tk')
conflicts=('blt' 'tkblt')
arch=('i686' 'x86_64')
source=(
'https://sourceforge.net/projects/wize/files/blt-src-2.5.3.zip'
'patch-interp-errorLine.patch'
'patch-TkCopyAndGlobalEval.patch'
'patch-scriptdir.patch'
)
sha256sums=('6ec778f58f60f17e241156d00e7e6ca79938ff40fd61df7d23cdedfe7ec49943'
            'fe9490fa58ec12416abfbce9d1fca8bf847434cf0f4d051d848f1b9ab410b1a0'
            'dfa1cde985511eb172c71df9540c69a40e450721004649038b659a6339f2e193'
            'f613fe7c61655d81b3f9ce5de6fc9e89aac4f5999f6e5f1a59c51ab61419422e')

build() {
  # configure
  cd ${srcdir}/${_dirname}

  patch --forward --strip=1 --input="${srcdir}/patch-interp-errorLine.patch"
  patch --forward --strip=1 --input="${srcdir}/patch-TkCopyAndGlobalEval.patch"
  patch --forward --strip=1 --input="${srcdir}/patch-scriptdir.patch"

  env CFLAGS="$CFLAGS -DUSE_INTERP_RESULT" \
  ./configure \
    --prefix=/usr \
    --with-tcl=/usr/lib \
    --with-x --x-includes=/usr/include \
    --x-libraries=/usr/lib \
    --mandir=/usr/share/man

  # Compile
  make -j 1
}

package() {
  # Fix for the man directory
  mkdir -p ${pkgdir}/usr/share/man

  # Add license
  #mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  #cp ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}

  cd ${srcdir}/${_dirname}
  make -j 1 INSTALL_ROOT=${pkgdir} INSTALL_DIR=${pkgdir} install

  # Delete man file, it is still owned by extra/tk
  rm ${pkgdir}/usr/share/man/mann/bitmap.n
  rm ${pkgdir}/usr/share/man/mann/busy.n
}
