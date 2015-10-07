# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Guillem Rieu <guillemr@gmx.net>
pkgname=gccxml-git
pkgver=3afa8ba
pkgrel=1
pkgdesc="GCC-XML generates an XML description of a C++ program from GCC's internal representation"
arch=(i686 x86_64)
url="http://www.gccxml.org/"
license=('custom')
depends=()
makedepends=('git' 'cmake')
provides=('gccxml')
conflicts=('gccxml' 'gccxml-cvs')
source=("$pkgname::git+https://github.com/gccxml/gccxml.git"
        'Copyright.txt')
sha512sums=('SKIP'
            'd73327835acd2980108e3ddb4d30ed6734e098737d05567d62bf70efefbdeacf226bda8548203bc2ccbc762b052bfc774b3371aea7b14032a0d7128a76d027b1')

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${pkgname}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

prepare() {
    cd "$srcdir/$pkgname"
    msg "Configuring..."
    CFLAGS=' -fgnu89-inline' cmake "../$pkgname" -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

build() {
  cd  "$srcdir/$pkgname"
  make
}

package() {
  cd  "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install

  install -D -m644 "$srcdir/Copyright.txt" "$pkgdir/usr/share/licenses/$pkgname/Copyright.txt"
}

# vim:set ts=2 sw=2 et:
