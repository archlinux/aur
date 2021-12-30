# Maintainer: Jason Papakostas <vithos@gmail.com>
# Contributor: Sean Enck <enckse@gmail.com>

pkgname=ergochat
_upstream_pkgname=ergo
pkgver=2.8.0
pkgrel=1
pkgdesc="A modern IRC server written in Go"
arch=('x86_64')
url="https://github.com/ergochat/ergo"
license=('MIT')
install=install
depends=('glibc')
makedepends=('go' 'git' 'ruby')
source=("git+$url#tag=v$pkgver"
        "PKGNAME.service.erb"
        "PKGNAME.sysusers.erb"
        "path.patch.erb"
        "PKGNAME.tmpfiles.erb"
        "compile-templates")
sha256sums=('SKIP'
            '5df46fc5cb324fa362f30baf550d06e3b9d80056c047e9fe7b3db698eddb7c24'
            'db0d2e965a2afb352afdc6062db83b657ee61c30f90df37aaf1982426e985d08'
            'ffd050bdecfd0b010d5b8e9cfc27f775eff3a672451e0d938f1fdea507b74fa1'
            '7e490cb211b013449041ac345175c7e540108c8149c196462f1c4bcf965d138a'
            '8cc173f3c9693edb3575fdf648bd671bbf13f7611ed8b11addaff50145051677')
backup=("etc/oragono.conf" "etc/$pkgname.conf")
replaces=("oragono")
conflicts=("oragono")
provides=("oragono")

prepare() {
    cd "${srcdir}" || exit
    ./compile-templates --pkgname="$pkgname" --pkgdesc="$pkgdesc" ../install.erb PKGNAME.service.erb PKGNAME.sysusers.erb PKGNAME.tmpfiles.erb path.patch.erb
    cd "${srcdir}/$_upstream_pkgname" || exit
    patch < ../path.patch
}

build() {
    export GOPATH=$(pwd)/..
    cd "${srcdir}/$_upstream_pkgname" || exit

    GIT_COMMIT="$(git rev-parse HEAD 2> /dev/null)"

    # flags from https://wiki.archlinux.org/index.php/Go_package_guidelines
    # to address issues namcap warns about:
    #   ergo W: ELF file ('usr/bin/ergo') lacks FULL RELRO, check LDFLAGS.
    #   ergo W: ELF file ('usr/bin/ergo') lacks PIE.
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
    cd "${srcdir}/$_upstream_pkgname" || exit

    go test ./...
}

package() {
    install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$srcdir/$pkgname.tmpfiles" "${pkgdir}"/usr/lib/tmpfiles.d/$pkgname.conf

    cd "${srcdir}/$_upstream_pkgname" || exit
    install -Dm755 -d "$pkgdir/usr/share/$pkgname/i18n"
    cp languages/* "$pkgdir/usr/share/$pkgname/i18n/"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 $_upstream_pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 default.yaml "$pkgdir/etc/$pkgname.conf"
    install -Dm644 $_upstream_pkgname.motd "$pkgdir/usr/share/$pkgname/default.motd"
}
