# Maintainer: Victor Golovanenko <drygdryg2014 at yandex dot com>
# Contributor: Nonie <read_only@gmx.us>
# Contributor: Alley_Cat <read_only@gmx.us>
_pkgname="opera-proxy"
pkgname="opera-proxy-git"
pkgver=1.12.0.r0.g6ddb8d2
pkgrel=1
pkgdesc="Standalone Opera VPN client as http-proxy backend only"
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Snawoot/opera-proxy"
license=('MIT')
depends=('proxychains-ng')
makedepends=('git' 'go')
backup=('etc/default/opera-proxy')
source=("git+https://github.com/Snawoot/opera-proxy.git"
        topera
        proxychains.opera-proxy.conf
        opera-proxy.service
        opera-proxy-env)
sha512sums=('SKIP'
            'a1a3f35210fac1d6e80084a8877800e83e8e70e98a54ae509cd60a9018556ee360ed2b90ad60dc7f8c10aff67746afbe31bf3d3ce6549f1bb1c540607fe283df'
            '719562c938d287656e09bc026dc366c7c3bc41801e729b3496251da86debfa28bb9b6ae0512a5db650ef3dbbc56dedd618874bce3f18ca112a08785ec357a1e2'
            'eb00fee03a3f716e6ee6a6b82b3d2ab669c454c3c235b73bee2816dc75c94040026ced30ac18a7cbe2b62fd4a6a39999d46b63daf558ccfef71b266d0c8d9b37'
            'ab09ce1313b1ae896d85a12f36f8eeef9b359dd5d520cde5999da2182de834e03a2ef5923b331c624fc61946715064d2bef93194281960d9cb15aa3cc7b9172a')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    if [[ "$CARCH" == "i686" ]]; then
        export GO386=softfloat
    fi
    make
}

package() {
    cd "$_pkgname"
    install -Dm755 "$srcdir"/$_pkgname/bin/opera-proxy -t "$pkgdir"/usr/bin/
    install -Dm755 "$srcdir/topera" "$pkgdir/usr/bin/redsocks"
    install -Dm644 "$srcdir/proxychains.opera-proxy.conf" "$pkgdir/etc/proxychains.opera-proxy.conf"
    install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/opera-proxy/README"
    install -Dm644 ../opera-proxy.service -t "$pkgdir"/usr/lib/systemd/system/
    install -Dm644 ../opera-proxy-env "$pkgdir"/etc/default/opera-proxy
}

# vim:set ts=4 sw=2 ft=sh et:
