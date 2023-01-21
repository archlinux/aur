pkgname=netdiscover
pkgver=0.10
pkgrel=0
pkgdesc="ARP Scanner"
arch=('i686' 'x86_64')
url="https://github.com/netdiscover-scanner/netdiscover/"
license=('GPL')
depends=('libnet' 'libpcap')
makedepends=('gcc' 'make' 'wget')
provides=('netdiscover')
conflicts=('netdiscover-debian' 'netdiscover-svn')
source=("https://github.com/netdiscover-scanner/netdiscover/archive/${pkgver}.tar.gz"
        "http://standards-oui.ieee.org/oui/oui.txt")

sha256sums=('dc331da2052ef1b0e8de50b8550c63f1e10720101df8f075efe6adeb2dad4afd'
            'SKIP')

prepare(){
        cd "$srcdir/$pkgname-$pkgver"
        cat << EOT > src/oui.h
struct oui {
        char *prefix;   /* 24 bit global prefix */
        char *vendor;   /* Vendor id string     */
};
        
struct oui oui_table[] = {
EOT
        cat ../oui.txt | sed 's/\r//' | grep "base 16" | tr '\t' ' ' | tr -s " " | sed 's/(base 16) //' | grep '[0-9A-F]' |  sort | sed 's/ /", "/' | sed 's/^/ { "/' | sed -z 's/\n/" },#/g' | tr '#' '\n' >> src/oui.h
        cat << EOT >> src/oui.h
    { NULL, NULL }
};
EOT
}

build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./autogen.sh
        ./configure --sbindir=/usr/bin --prefix=/usr --sysconfdir=/etc/
        make 
}
        
package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install || return 1
}
