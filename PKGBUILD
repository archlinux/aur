# Maintainer: Rintim <rintim@foxmail.com>
# Contributor: Filipe Nascimento <flipee at tuta dot io>

pkgname=vfox
pkgver=0.6.7
pkgrel=1
pkgdesc="A cross-platform and extendable version manager with support for Java, Node.js, Flutter, .Net & more"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://vfox.dev"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/version-fox/vfox/archive/v$pkgver.tar.gz")
sha256sums=('19755743d88d4ab6d01d431c2c1dcdc7fea005abda9fc8ef067389ae50a30346')

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
