#Maintainer: Alessandro Bernardello <aleberna at erine dot eu>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=glance-git
pkgver=0.7.3.r8.g774b0c1
pkgrel=1
pkgdesc="A self-hosted dashboard that puts all your feeds in one place"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv64' 'ppc64' 'ppc64le' 'mips' 'mips64' 'mips64el' 'mipsel')
url="https://github.com/glanceapp/glance"
license=('AGPL-3.0-only')
depends=("glibc")
makedepends=("go" "git")
conflicts=('glance')
provides=("glance=${pkgver}")
source=("git+https://github.com/glanceapp/glance.git"
        "glance.service"
        "sysusers.conf"
        "tmpfiles.conf"
)
b2sums=('SKIP'
        '6c9f854855cf366eb47847f90c8ed38c531a71ef329575863cd570c5dc46849e5f34ae6549ec214652c1413debdf512646775fd163e149b5c89e99511644edf2'
        '4fc636320adf8b7810bd3b4786a6d30f848f6e183a1e351dc3780ea4d66c72ebb96f4fc6e9ed13277a385cbfdd3c07d5e1ec05dc0b12afc3b69270a3c5b7e971'
        'c77dfe04cf5b2f59e919e6dfc5fd85709d5c4bf0f1d83185c15efad2072b6a1389514df5a4ff80920b73690588d373b49e59a36fef2f51fba5bdc06e177dd46e')
backup=('etc/glance.yml')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go -C "${srcdir}/glance" build -o glance
}

pkgver() {
  cd glance || exit 1
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "$srcdir/glance/glance" "$pkgdir/usr/bin/glance"
    install -Dm644 glance.service "$pkgdir/usr/lib/systemd/system/glance.service"
    install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/glance.conf"
    install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/glance.conf"
    install -Dm644 "$srcdir/glance/docs/glance.yml" "$pkgdir/etc/glance.yml"
}
