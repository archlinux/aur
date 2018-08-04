# Maintainer: Yunhui Fu <yhfudev@gmail.com>
pkgname=esniper-git
pkgver=r457.d51959b
pkgrel=1
pkgdesc="A simple, lightweight tool for sniping eBay auctions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm')
url="https://git.code.sf.net/p/esniper/git"
license=('BSD')
depends=('curl' 'openssl')
provides=('esniper')
source=(
    "${pkgname}::git+https://git.code.sf.net/p/esniper/git"
  )
md5sums=('SKIP')

pkgver_git() {
    cd "${srcdir}/${pkgname}"
    #local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    #echo ${ver:0:7}
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

pkgver() {
    pkgver_git
}

build() {
    cd "${srcdir}/${pkgname}"
    #./autogen.sh
    autoreconf -if
    ./configure --prefix=/usr
    make
}

package()
{
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -D -m755 frontends/snipe "${pkgdir}/usr/bin/snipe"
}
