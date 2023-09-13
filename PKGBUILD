# This is a PKGBUILD file that builds keepalived from source and deploys it as an
# openrc service - nothing fancy, nothing special.

# Maintainer: drad <sa@adercon.com>
# Contributor: krad <krad@adercon.com>
# Contributor: arad <arad@adercon.com>
# Contributor: nrad <nrad@adercon.com>

pkgname=keepalived
pkgver="2.2.8"
pkgrel="1"
pkgdesc="keepalived bundled as an openrc based service"
arch=("x86_64")
#~ url='https://www.keepalived.org/software/keepalived-2.2.8.tar.gz'
url='https://www.keepalived.org'
license=('GPL3')
#~ depends=()
makedepends=('gcc' 'openssl' 'libnl' 'net-snmp')
#~ optdepends=()
#~ conflicts=()

install=keepalived.install

#changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/software/$pkgname-$pkgver.tar.gz")
md5sums=('8c26f75a8767e5341d82696e1e717115')

#~ prepare() {}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr/local/$pkgname-$pkgver
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    sed -i -- 's|command="/sbin/$SVCNAME"|command="/usr/local/sbin/$SVCNAME"|g' "$pkgname/etc/openrc/$pkgname"
    sed -i -- 's|command_args="$KEEPALIVED_OPTS"|command_args="-f /etc/keepalived/keepalived.conf"|g' "$pkgname/etc/openrc/$pkgname"

    # remove the .service as its not needed on openrc systems
    rm -rf "$pkgdir/no"

    # the man pages
    rm -rf "$pkgdir/usr/local/$pkgname-$pkgver/share/man/man1/"
    mkdir -p "$pkgdir/usr/share/man/"
    cp -R "$pkgdir/usr/local/$pkgname-$pkgver/share/man/" "$pkgdir/usr/share/"

    # the sample config file
    install -Dm644 "$pkgname/etc/$pkgname/keepalived.conf.sample" -t "$pkgdir/etc/$pkgname/"
    rm -rf "$pkgdir/etc/$pkgname/samples"

    # the daemon
    install -Dm755 "$pkgdir/usr/local/$pkgname-$pkgver/sbin/$pkgname" -t "$pkgdir/usr/local/sbin/"

    # the openrc script
    install -Dm755 "$pkgname/etc/openrc/$pkgname" -t "$pkgdir/etc/init.d/"

    # remove the extemporaneous stuff
    rm -rf "$pkgdir/usr/local/$pkgname-$pkgver/"
}

#~ post_install() {
    #~ # deploy the open-rc init script
    #~ cp "$pkgdir/$pkgname-$pkgver/$pkgname/etc/openrc/$pkgname /etc/init.d/$pkgname"
    #~ sed -i -- 's|command="/sbin/$SVCNAME"|command="/usr/local/sbin/$SVCNAME"|g' "/etc/init.d/$pkgname"
    #~ sed -i -- 's|command_args="$KEEPALIVED_OPTS"|command_args="-f /etc/keepalived/keepalived.conf"|g' "/etc/init.d/$pkgname"
#~ }
