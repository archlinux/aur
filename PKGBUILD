#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance
pkgver=0.8.4
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
b2sums=('8ec067ffd8b024477e42de958bdb24e9f56644cf20472e56b38d23e63745ecef81c66c5c075a4abb7ab0a9ec78cf5e0e1b568c3f8c731ae1cb9e15480edbaf65'
        '813fc617ce94ace9f4b5e716072a481de01c0c579f4658bf0e52ad09a18a2347c2417ce605a4d09121db78692c127e41686d50d2bd46b8df888717f4ae64b022'
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
