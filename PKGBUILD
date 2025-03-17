#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance
pkgver=0.7.7
pkgrel=1
pkgdesc="A self-hosted dashboard that puts all your feeds in one place"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64' 'ppc64' 'ppc64le' 'mips' 'mips64' 'mips64el' 'mipsel')
url="https://github.com/glanceapp/glance"
license=('AGPL-3.0-only')
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/glanceapp/glance/archive/refs/tags/v$pkgver.tar.gz"
        "glance.service"
        "sysusers.conf"
        "tmpfiles.conf"
)
backup=('etc/glance.yml')
b2sums=('04c8c4c00f5c2e1f886c646048530957aeb03212ea96f852a1d3cfa6568b5f337fc1fb85b1989f77e1b69af6935f8aa5c3ca144e0ff80b26726f6b7bb3bc6b5e'
        '6c9f854855cf366eb47847f90c8ed38c531a71ef329575863cd570c5dc46849e5f34ae6549ec214652c1413debdf512646775fd163e149b5c89e99511644edf2'
        '4fc636320adf8b7810bd3b4786a6d30f848f6e183a1e351dc3780ea4d66c72ebb96f4fc6e9ed13277a385cbfdd3c07d5e1ec05dc0b12afc3b69270a3c5b7e971'
        'c77dfe04cf5b2f59e919e6dfc5fd85709d5c4bf0f1d83185c15efad2072b6a1389514df5a4ff80920b73690588d373b49e59a36fef2f51fba5bdc06e177dd46e')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go -C "${srcdir}/$pkgname-$pkgver" build -o glance
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/glance" "$pkgdir/usr/bin/glance"
    install -Dm644 glance.service "$pkgdir/usr/lib/systemd/system/glance.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/glance.conf"
    install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/glance.conf"
    install -Dm644 "$srcdir/$pkgname-$pkgver/docs/glance.yml" "$pkgdir/etc/glance.yml"
}
