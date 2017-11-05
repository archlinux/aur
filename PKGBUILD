# Maintainer: Yunhui Fu <yhfudev@gmail.com>
pkgname=esniper-git
pkgver=r413.7771d53
pkgrel=1
pkgdesc="A simple, lightweight tool for sniping eBay auctions."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm')
url="https://github.com/yhfudev/esniper.git"
license=('BSD')
depends=('curl' 'openssl')
source=(
    "${pkgname}::git+https://github.com/yhfudev/esniper.git"
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
    ./autogen.sh
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
