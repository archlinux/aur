# Maintainer: Jerome M. Berger <jeberger@free.fr>
 
pkgname=audacious-imms-git
pkgver=3.1.16.4227360
pkgrel=1
pkgdesc="An intelligent playlist plug-in for XMMS that tracks your listening patterns and dynamically adapts to your taste."
arch=(i686 x86_64)
license=("GPL")
url="https://sites.google.com/a/luminal.org/imms/"
depends=('audacious' 'pcre' 'sqlite3' 'taglib' 'glib2' 'sox' 'torch')
replaces=('imms')
conflicts=('audacious-imms')
source=(git+https://github.com/martingkelly/imms.git)
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/imms"
  ( set -o pipefail
    LATEST_TAG=$(git tag | grep -Exe 'imms-[0-9]+(\.[0-9]+)?' | sort -rn | head -1)
    COMMITS_SINCE=$(git rev-list ${LATEST_TAG}..HEAD --count)
    LATEST_VERSION=${LATEST_TAG#imms-}
    if [ $COMMITS_SINCE == 0 ]; then
        echo $LATEST_VERSION
    else
        echo ${LATEST_VERSION}.${COMMITS_SINCE}.$(git rev-parse --short HEAD)
    fi
  )
}

prepare() {
    cd $srcdir/imms/imms

    echo "m4_define([GIT_VERSION], [$pkgver])" > gitversion.m4
}

build() {
   cd $srcdir/imms/imms

   autoheader
   aclocal
   autoconf
   ./configure --prefix=/usr --disable-immsremote

   make
}

package() {
   cd $srcdir/imms/imms
   mkdir -p "$pkgdir/usr/bin"
   make prefix="$pkgdir/usr" DESTDIR="$pkgdir/usr/lib/xmms" \
        BMPDESTDIR="$pkgdir/usr/lib/bmp" \
        AUDACIOUSDESTDIR="$pkgdir/usr/lib/audacious" install
}
