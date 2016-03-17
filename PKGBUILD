# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=icmptunnel-git
pkgver=r58.7a1a5a8
pkgrel=4
pkgdesc="Transparently tunnel your IP traffic through ICMP echo and reply packets."
arch=('i686' 'x86_64')
url="https://github.com/DhavalKapil/icmptunnel"
license=('MIT')
depends=('net-tools')
makedepends=('git')
provides=('icmptunnel')
conflicts=('icmptunnel')
source=('git://github.com/DhavalKapil/icmptunnel.git'
        'http://dhaval.mit-license.org/license.txt')
sha256sums=('SKIP'
            'e9d8fd95de3a96aa5b015e0f3afd75e7d24450f6702e0971a0f02062fd5891d4')

pkgver() {
    cd "$srcdir/icmptunnel"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/icmptunnel"
    sed -i '/SERVER_SCRIPT/s/server.sh/\/usr\/bin\/icmptunnel-server/' tunnel.h
    sed -i '/CLIENT_SCRIPT/s/client.sh/\/usr\/bin\/icmptunnel-client/' tunnel.h
}

build(){
    cd "$srcdir/icmptunnel"
    make
}

package(){
    cd "$srcdir/icmptunnel"
    install -Dm0755 icmptunnel "$pkgdir"/usr/bin/icmptunnel

    install -Dm0755 client.sh "$pkgdir"/usr/bin/icmptunnel-client
    install -Dm0755 server.sh "$pkgdir"/usr/bin/icmptunnel-server

    install -Dm0644 "$srcdir/license.txt" \
        "$pkgdir/usr/share/licenses/icmptunnel/license.txt"
}
