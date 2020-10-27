# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=3proxy
pkgver=0.9.0
pkgrel=3
pkgdesc="A tiny crossplatform proxy server"
arch=('any')
url="http://www.3proxy.ru/"
license=('BSD')
depends=('glibc')
makedepends=('gcc' 'make')
backup=('etc/3proxy/3proxy.cfg')
source=("https://github.com/z3APA3A/3proxy/archive/$pkgver.tar.gz"
        "3proxy.service"
)
md5sums=('d47099e82914d854daac4688740d625c'
         '99fbf305116df79fde910402c1132295'
)
_prefix=/usr
_etcdir=/etc/3proxy
_initdir=/etc/init.d
_runbase=/var/run
_logbase=/var/log
package() {
    cd "$srcdir/3proxy-$pkgver"
    sed -i '137,$d' Makefile.Linux
    make='make -f Makefile.Linux INSTALL=/usr/bin/install'
    $make prefix="$_prefix" ETCDIR="$_etcdir" INITDIR=$_initdir RUNBASE=$_runbase LOGBASE=$_logbase
    $make prefix="$_prefix" install DESTDIR="$pkgdir" ETCDIR="$pkgdir$_etcdir" INITDIR="$pkgdir$_initdir" RUNBASE="$pkgdir$_runbase" LOGBASE="$pkgdir$_logbase"
    ( cd ${pkgdir}${_prefix}/bin && mv proxy 3proxy-proxy ) || return 1
    rm -f ${pkgdir}${_etcdir}/counters ${pkgdir}${_etcdir}/passwd ${pkgdir}${_etcdir}/bandlimiters
    install -D -m644 copying ${pkgdir}${_prefix}/share/licenses/$pkgname/copying
    install -D -m644 cfg/3proxy.cfg.sample ${pkgdir}${_etcdir}/3proxy.cfg.sample
    install -D -m644 cfg/counters.sample ${pkgdir}${_etcdir}/counters.sample
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    echo 'u     threeproxy    -              "3proxy user"' | install -Dm644 /dev/stdin "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
    install -D -m644 "$srcdir/3proxy.service" "$pkgdir/usr/lib/systemd/system/"
}

# vim: ts=4 sw=4 et:

