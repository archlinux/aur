# This is a PKGBUILD file that builds keepalived from source and deploys it as an
# openrc service - nothing fancy, nothing special.

# Maintainer: drad <sa@adercon.com>
# Contributor: krad <krad@adercon.com>
# Contributor: arad <arad@adercon.com>
# Contributor: nrad <nrad@adercon.com>

pkgname=keepalived-openrc
_pkgname=keepalived
pkgver="2.3.2"
pkgrel="7"
pkgdesc="keepalived bundled as an openrc based service"
arch=("x86_64")
url='https://gitlab.com/drad/keepalived'
license=('GPL3')
depends=(openrc)
makedepends=('gcc' 'openssl' 'libnl' 'net-snmp')

install=keepalived.install
#changelog=CHANGELOG.md
source=("$_pkgname-$pkgver.tar.gz::https://www.keepalived.org/software/$_pkgname-$pkgver.tar.gz")
md5sums=('a5e84e7a7b6d37dc5378c14fcfad1574')

build() {
    cd "$_pkgname-$pkgver"
    ./configure --prefix=/usr/local/$_pkgname-$pkgver
    make
}

check() {
    cd "$_pkgname-$pkgver"
    make -k check
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    sed -i -- 's|command="/bin/$SVCNAME"|command="/usr/bin/$SVCNAME"|g' "$_pkgname/etc/openrc/$_pkgname"
    sed -i -- 's|command_args="$KEEPALIVED_OPTS"|command_args="-f /etc/keepalived/keepalived.conf"|g' "$_pkgname/etc/openrc/$_pkgname"

    # remove the .service as its not needed on openrc systems
    rm -rf "$pkgdir/no"

    # the man pages
    rm -rf "$pkgdir/usr/local/$_pkgname-$pkgver/share/man/man1/"
    mkdir -p "$pkgdir/usr/share/man/"
    cp -R "$pkgdir/usr/local/$_pkgname-$pkgver/share/man/" "$pkgdir/usr/share/"

    # the sample config file
    install -Dm644 "$_pkgname/etc/$_pkgname/keepalived.conf.sample" -t "$pkgdir/etc/$_pkgname/"
    rm -rf "$pkgdir/etc/$_pkgname/samples"

    # the daemon
    install -Dm755 "$pkgdir/usr/local/$_pkgname-$pkgver/sbin/$_pkgname" -t "$pkgdir/usr/bin"

    # the openrc script
    install -Dm755 "$_pkgname/etc/openrc/$_pkgname" -t "$pkgdir/etc/init.d/"

    # remove the extemporaneous stuff
    rm -rf "$pkgdir/usr/local"
}
