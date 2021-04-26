# Maintainer: Jason Papakostas <vithos@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>

pkgname=oragono
pkgver=2.6.1
pkgrel=1
pkgdesc="A modern IRC server written in Go."
arch=('x86_64')
url="https://github.com/oragono/oragono"
license=('MIT')
install=install
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver"
        "oragono.service"
        "oragono.sysusers"
        "path.patch"
        "oragono.tmpfiles")
sha256sums=('SKIP'
            'd35dd5205e3b607ee105a1252677d0607d0c35636ee3e6057275b5f13e555858'
            '7e214caa8bee053adac26a00a17ed732970e86665cbe31553b1d3d609f0a49b4'
            'ce58277f778809df5f6bdaa5d6997f5d55157e367c0d4a0b6cae0a61fd293e51'
            '8f6baaa89e9723ac3344a2af201a93f348975537bc748024c0a48b0773f42b1f')
backup=('etc/oragono.conf')

prepare() {
    cd "${srcdir}/$pkgname"
    patch < ../path.patch
}

build() {
    export GOPATH=$(pwd)/..
    cd "${srcdir}/$pkgname"

    GIT_COMMIT="$(git rev-parse HEAD 2> /dev/null)"

    # flags from https://wiki.archlinux.org/index.php/Go_package_guidelines
    # to address issues namcap warns about:
    #   oragono W: ELF file ('usr/bin/oragono') lacks FULL RELRO, check LDFLAGS.
    #   oragono W: ELF file ('usr/bin/oragono') lacks PIE.
    # related: https://bugs.archlinux.org/task/60928
    go build \
        -trimpath \
        -buildmode=pie \
        -ldflags "-X main.commit=${GIT_COMMIT} -linkmode external -extldflags \"${LDFLAGS}\"" \
        -v \
        .

    rm languages/README.md
    rm -rf languages/example
}

check() {
    export GOPATH=$(pwd)/..
    cd "${srcdir}/$pkgname"

    go test ./...
}

package() {
    install -Dm644 oragono.service "$pkgdir/usr/lib/systemd/system/oragono.service"
    install -Dm644 "$srcdir/oragono.sysusers" "$pkgdir/usr/lib/sysusers.d/oragono.conf"
    install -Dm644 "$srcdir/oragono.tmpfiles" "${pkgdir}"/usr/lib/tmpfiles.d/oragono.conf

    cd "${srcdir}/$pkgname"
    install -Dm755 -d "$pkgdir/usr/share/$pkgname/i18n"
    cp languages/* "$pkgdir/usr/share/$pkgname/i18n/"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 oragono "$pkgdir/usr/bin/oragono"
    install -Dm644 default.yaml "$pkgdir/etc/oragono.conf"
    install -Dm644 oragono.motd "$pkgdir/usr/share/$pkgname/default.motd"
}
