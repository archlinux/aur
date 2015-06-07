# Maintainer: Slithery <aur at slithery dot uk>

pkgname=longview
pkgver=1.1.4
pkgrel=1
pkgdesc="A system monitoring agent for Linode customers."
arch=('any')
url="https://github.com/linode/$pkgname"
license=('GPL2')
depends=('perl-libwww' 'perl-crypt-ssleay' 'perl-io-socket-inet6'
         'perl-linux-distribution' 'perl-json-pp' 'perl-json'
         'perl-log-loglite' 'perl-try-tiny' 'perl-dbi')
optdepends=('perl-dbd-mysql: MySQL support')
backup=('etc/linode/longview.key'
        'etc/linode/longview.d/Apache.conf'
        'etc/linode/longview.d/MySQL.conf'
        'etc/linode/longview.d/Nginx.conf')
install=longview.install
source=($url/archive/v$pkgver.tar.gz)
sha256sums=('735811fd9118af91f03a4659d7aaa1b9ccb1c29043ebc97dfeb4b08994a18638')

build() {
    h2ph -d "$srcdir/$pkgname-$pkgver" /usr/include/syscall.h
    h2ph -d "$srcdir/$pkgname-$pkgver" /usr/include/sys/syscall.h
    h2ph -d "$srcdir/$pkgname-$pkgver" /usr/include/asm/unistd.h
    h2ph -d "$srcdir/$pkgname-$pkgver" /usr/include/asm/unistd_32.h
    h2ph -d "$srcdir/$pkgname-$pkgver" /usr/include/asm/unistd_64.h
    h2ph -d "$srcdir/$pkgname-$pkgver" /usr/include/bits/wordsize.h
    h2ph -d "$srcdir/$pkgname-$pkgver" /usr/include/bits/syscall.h
}

package() {
    cd "$pkgdir"
    install -d -m755 "opt/linode" "etc/linode/longview.d" "usr/lib/systemd/system"
    cp -dpr --no-preserve=ownership "$srcdir/$pkgname-$pkgver" "opt/linode/$pkgname"
    install -m600 -t "etc/linode/longview.d"  "opt/linode/$pkgname/Extras/conf/Apache.conf" \
                                              "opt/linode/$pkgname/Extras/conf/MySQL.conf"  \
                                              "opt/linode/$pkgname/Extras/conf/Nginx.conf"
    install -m644 -t "usr/lib/systemd/system" "opt/linode/$pkgname/Extras/init/longview.service"
    touch "etc/linode/longview.key"
    chmod 600 "etc/linode/longview.key"
    rm -rf "opt/linode/$pkgname/debian"      \
           "opt/linode/$pkgname/Extras/conf" \
           "opt/linode/$pkgname/Extras/init" \
           "opt/linode/$pkgname/Extras/install-dependencies.sh"
}
