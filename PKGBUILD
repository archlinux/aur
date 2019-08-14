# Contributor: skydrome <skydrome at- protonmail dotcom>
# Maintainer:  skydrome <skydrome at- protonmail dotcom>

pkgname=coredns-git
pkgver=1.6.1.r19.ga64ff8cc0
pkgrel=1
pkgdesc="CoreDNS is a DNS server that chains plugins"
url="https://coredns.io"
arch=('i686' 'x86_64')
license=('Apache')
conflicts=('coredns-bin' 'coredns')
provides=('coredns')
makedepends=('go>=1.12' 'git')

source=("git+https://github.com/coredns/coredns.git"
        'corefile.example'
        'coredns.service' 'coredns-sysusers.conf' 'coredns-tmpfiles.conf')

sha256sums=('SKIP'
            '66689ad9160de3ba17431bbd38d2a438bc4f75151eff93f9ffb7bd2e48c298cc'
            '8a5689eeba6c48945fec84dd0163fdf3d7118aa98ad511992501637f411b1a5c'
            'f4fd89dcb36f52466ebb1a2ae435dc960cdc828a071f3aaae1d83a39696bff30'
            '20052dded9a02e05013a602e597002ee2a003ecfab3309d30969c28207fc5b72')

pkgver() {
    cd coredns
    git describe --long --tags |sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd coredns
    export GOPATH="$srcdir/build"
    make CHECKS= all
}

package() {
    install -Dm755 coredns/coredns  "$pkgdir/usr/bin/coredns"
    install -Dm644 coredns/LICENSE  "$pkgdir/usr/share/licenses/coredns/LICENSE"
    install -Dm644 corefile.example "$pkgdir/etc/coredns/corefile.example"

    install -dm644 "$pkgdir/usr/share/man/man"{1,5,7}
    install -Dm644 coredns/man/*.1 "$pkgdir/usr/share/man/man1"
    install -Dm644 coredns/man/*.5 "$pkgdir/usr/share/man/man5"
    install -Dm644 coredns/man/*.7 "$pkgdir/usr/share/man/man7"

    install -Dm644 coredns.service       "$pkgdir/usr/lib/systemd/system/coredns.service"
    install -Dm644 coredns-sysusers.conf "$pkgdir/usr/lib/sysusers.d/coredns.conf"
    install -Dm644 coredns-tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/coredns.conf"
}
