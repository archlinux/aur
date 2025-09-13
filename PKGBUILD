# Maintainer: taotieren <admin@taotieren.com>
# Contributor: b00rt00s <b00rt00s.aur@gmail.com>
# Contributor: Markus Theil <aur@thillux.de>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>
# Contributor: Jason Taylor <jftaylor21@gmail.com>
# Contributor: Christophe Gueret <tolgam@homegnu.net>

pkgname=blt-git
pkgver=r1906.bcbf356
pkgrel=1
pkgdesc="Adds new commands and widgets to the Tcl interpreter."
url="http://blt.sourceforge.net"
license=("LicenseRef-custom")
depends=('glibc' 'expat' 'tcl' 'tk' 'libnsl' 'libx11' 'libxau' 'libxcomposite' 'libxcursor' 'libxdmcp' 'libxext' 'libxft' 'libxpm' 'libxrandr' 'libxrender' 'libtiff' 'libjpeg-turbo' 'libpng' 'libssh2' 'freetype2' 'fontconfig' 'sqlite' 'zlib')
# 'postgresql-libs'
# 'libmariadbclient'
makedepends=('git' 'pkgconf')
provides=(${pkgname%-git})
conflicts=('blt_tcl85' ${pkgname%-git})
arch=($CARCH)
source=("${pkgname}::git+git://git.code.sf.net/p/blt/src"
  "fix-build.patch")
sha256sums=('SKIP'
            '4c274da7a995c31fbbc99bca2804b9fda58c8ce02470eaf853cff836a7d48ae4')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  # configure
  cd ${srcdir}/${pkgname}
  patch configure <${srcdir}/fix-build.patch
  sed -i '46s/#define __USE_GNU/\/\/ #define __USE_GNU/' src/bltString.h
  find src/ -type f -name "*.c" -exec sed -i -e 's/\<int bool\>/int boolVar/g' \
       -e 's/\<bool = /boolVar = /g' \
       -e 's/!bool\b/!boolVar/g' \
       -e 's/(bool\b)/(boolVar)/g' \
       -e 's/, bool\b/, boolVar/g' \
       -e 's/; bool\b/; boolVar/g' \
       -e 's/\<bool\b/boolVar/g' {} +

  CFLAGS+=" -D_GNU_SOURCE"
  #   autoreconf -i
  ./configure \
    --prefix=/usr \
    --with-tcl=/usr/lib \
    --with-tk=/usr/lib \
    --with-x --x-includes=/usr/include \
    --x-libraries=/usr/lib \
    --mandir=/usr/share/man

  # Compile
  make CFLAGS="$CFLAGS" CXXFLAGS="$XXCFLAGS"
}

package() {
  # Fix for the man directory
  mkdir -p ${pkgdir}/usr/share/man

  # Add license
  #   mkdir -p ${pkgdir}/usr/share/licenses/blt
  #   cp ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/blt

  cd ${srcdir}/${pkgname}

  #some Makefile's are broken, fixing

  sed -i 's/bltConfig.sh \$(libdir)/bltConfig.sh \$(DESTDIR)\$(libdir)/' Makefile

  for file in library/dd_protocols/Makefile library/palettes/Makefile; do
    sed -i 's/\$\$i \$(destdir)/\$\$i \$(DESTDIR)\$(destdir)/' "${file}"
  done

  #installing
  make DESTDIR=${pkgdir} install

  # Delete man file, it is still owned by extra/tk
 #  rm ${pkgdir}/usr/share/man/mann/bitmap.n
 #  rm ${pkgdir}/usr/share/man/mann/busy.n
}
