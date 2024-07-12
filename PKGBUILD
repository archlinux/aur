# Maintainer: Christian Pfeiffer <cpfeiffer@live.de> 

pkgname=ergochat-ldap
_upstream_pkgname=ergo-ldap
pkgver=0.0.1
pkgrel=2
pkgdesc="LDAP plugin for the IRC server Ergo"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/ergochat/ergo-ldap"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha256sums=('437928ad1b74432672442e1fe187d9d2987f93124150d663aafda2cab57963ab')
backup=("etc/ergochat/ldap-config.yaml")

build() {
    GOPATH=$(pwd)/..
    export GOPATH
    cd "${srcdir}/$_upstream_pkgname" || exit

    GIT_COMMIT="$(git rev-parse HEAD)" # 2>/dev/null)"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=vendor \
        -modcacherw \
        -ldflags "-X main.commit=${GIT_COMMIT} -compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" \
        -v \
        .
}

package() {
    cd "$srcdir/$_upstream_pkgname" || exit
    install -Dm755 $_upstream_pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 example.yaml "$pkgdir/etc/ergochat/ldap-config.yaml"
}
