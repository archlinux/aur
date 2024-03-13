# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Trevor Bergeron <aur@sec.gd>

_pkgname=cwtch-server
pkgname=$_pkgname
pkgver=1.5.1
pkgrel=2
pkgdesc="Server for Privacy Preserving Infrastructure for Asynchronous, Decentralized and Metadata Resistant Applications"
arch=('x86_64')
url="https://cwtch.im/"
license=('MIT')
makedepends=('go')
conflicts=("$_pkgname-git")
source=(
    "$_pkgname-v$pkgver.tar.gz::https://git.openprivacy.ca/api/v1/repos/cwtch.im/server/archive/v$pkgver.tar.gz"
    "cwtch-server.service"
    "cwtch.sysusers"
    "cwtch.tmpfiles"
)
sha512sums=('50ef4e370fca7a86eb6ce242d000dabd6871724b181cf690d497bd6569ecfabf5caa85a8fc86ea1d79ac86db7e84945b97bc0a11c1964f96ae03edabfeab8bbc'
            'a10966b6db3816d983b8d331cc9c67d995aa3d5bce4818415df8c847bb7d1dfa8c968a9f3b65d44cc6c6ca4d196198737cb140951c8edee8304235a11c5d8644'
            '003fc3a3a3f5261ba72e21b8a093a8d47852c0a15b8712021c9fa4b89732b019218ab0fff80438ad93812ba597188eba5df1920062eee0de57e6dd56bc383f86'
            '7d7ae7fbf04cc22e7bd4bb939dc51f857a146acc4b3b400d79de561d6451ec45e616e70e4d6a152bbc588d5a020a1d5e9186db3fccdf820cb0d5e2b67503269c')

build() {
    cd "$srcdir/server/app"

    export GOPATH="$srcdir/go"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"

    go build
}

package() {
    install -Dm0644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm0644 "$srcdir/cwtch.sysusers" -t "$pkgdir/usr/lib/sysusers.d/"
    install -Dm0644 "$srcdir/cwtch.tmpfiles" -t "$pkgdir/usr/lib/tmpfiles.d/"

    install -Dm0755 "$srcdir/server/app/app" "$pkgdir/usr/bin/cwtch-server"
}
