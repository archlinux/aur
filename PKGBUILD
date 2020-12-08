# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=3proxy
pkgver=0.9.3
pkgrel=1
pkgdesc="A tiny crossplatform proxy server"
arch=('any')
url="http://www.3proxy.ru/"
license=('BSD')
depends=('glibc')
makedepends=('gcc' 'make')
backup=('etc/3proxy/3proxy.cfg')
source=("https://github.com/z3APA3A/3proxy/archive/$pkgver.tar.gz"
        "3proxy.service"
        "sysusers"
        "tmpfiles"
)
md5sums=('3ab30a34c01ea555d31da8a0fb564062'
         '99fbf305116df79fde910402c1132295'
         "6cafc741aa7ca8aab877f24a132c8bd1"
         "127ddc9c57a7b30ed8c70782f94e69b1"
)
_prefix=/usr
_etcdir=/etc/3proxy
_initdir=/etc/init.d
_runbase=/run
_logbase=/var/log
prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    echo -e "  \e[1;34m->\033[0m \e[1;37mPatching Makefile for Linux...\033[0m"
    # O2 and march should be dound in makepkg.conf, so let's remove them. Install should not really perform anything but calling another targets
    sed --follow-symlinks -i.bak -e 's| -O2||g;s|CFLAGS = -g|CFLAGS =|;s|CC = gcc|CC ?= gcc|;s|LN = gcc|LN ?= gcc|' Makefile.Linux
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make prefix="$_prefix" DESTDIR="$pkgdir" ETCDIR="$_etcdir" INITDIR=$_initdir BINDIR="/usr/bin" -f Makefile.Linux
}

package() {
    cd "$srcdir/3proxy-$pkgver"
    make prefix="$_prefix" install DESTDIR="$pkgdir" ETCDIR="$pkgdir$_etcdir" INITDIR="$pkgdir$_initdir" RUNBASE="$pkgdir$_runbase" LOGBASE="$pkgdir$_logbase" -f Makefile.Linux
    #mkdir "$pkgdir/usr/lib"
    mv "$pkgdir"/usr/local/3proxy/libexec/*.so "$pkgdir"/usr/lib/
    rm -rf "$pkgdir/usr/local"
    ( cd ${pkgdir}${_prefix}/bin && mv proxy 3proxy-proxy ) || return 1
    rm -f ${pkgdir}${_etcdir}/counters ${pkgdir}${_etcdir}/passwd ${pkgdir}${_etcdir}/bandlimiters "$pkgdir$_etcdir/3proxy.cfg"
    rm -rf "$pkgdir$_etcdir/conf"
    #touch "$pkgdir$_runbase/3proxy/3proxy.pid"
    install -D -m644 copying "${pkgdir}${_prefix}/share/licenses/$pkgname/copying"
    install -D -m644 cfg/3proxy.cfg.sample ${pkgdir}${_etcdir}/3proxy.cfg.sample
    install -D -m644 cfg/counters.sample ${pkgdir}${_etcdir}/counters.sample
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 "$srcdir/"sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
    install -Dm644 "$srcdir/"tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
    install -D -m644 "$srcdir/3proxy.service" "$pkgdir/usr/lib/systemd/system/"
}

# vim: ts=4 sw=4 et:

