# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=vfox
pkgver=0.4.2
pkgrel=1
pkgdesc="A cross-platform and extendable version manager with support for Java, Node.js, Flutter, .Net & more"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://vfox.lhan.me"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/version-fox/vfox/archive/v$pkgver.tar.gz")
sha256sums=('0f4ee7faaaf1d211123f4ac1a8107737da7539d1201d9bdb8390060b7d3887dd')

build() {
    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags="-linkmode=external"
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 $pkgname -t "$pkgdir/usr/bin"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 completions/bash_autocomplete "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/zsh_autocomplete "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
