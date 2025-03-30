# Maintainer: ju6ge judge@felixrichter.tech
#
# This package uses the date of the latest commit to set package version. This is because
# `alexandrie` has no version or tags that could be used. The package should be hostable on a
# private pkg repo and therefore an increasing version number is required.`
_pkgname=alexandrie
pkgname=$_pkgname-pg
pkgver=0.1.0_20231113
pkgrel=2
pkgdesc='Rust private crates registry - with postgres backend'
arch=(x86_64)
url='https://github.com/Hirevo/alexandrie'
license=('mit')
_source_revision='4f94ae968ac130c735f6d3ad917b9d99757d7fcc'
source=("git+https://github.com/Hirevo/alexandrie.git#commit=$_source_revision")
sha256sums=('SKIP')
provides=('alexandrie')
options=(!lto)
makedepends=('cargo' 'base-devel' 'pkgconf' 'rustup')
depends=('postgresql-libs' 'git' 'openssl' 'oniguruma' 'diesel-cli')

build() {
    cd "$srcdir/$_pkgname"
    cargo build --locked --release -F postgres -F frontend --no-default-features
}

package() {
    install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" -t "$pkgdir/usr/bin"

    pushd "$srcdir/$_pkgname/syntect"
    find . -type d -exec install -dm755 "${pkgdir}/usr/share/alexandrie/syntect/{}" \;
    find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/alexandrie/syntect/{}" \;
    popd

    pushd "$srcdir/$_pkgname/assets"
    find . -type d -exec install -dm755 "${pkgdir}/usr/share/alexandrie/frontend/assets/{}" \;
    find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/alexandrie/frontend/assets/{}" \;
    popd

    pushd "$srcdir/$_pkgname/templates"
    find . -type d -exec install -dm755 "${pkgdir}/usr/share/alexandrie/frontend/templates/{}" \;
    find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/alexandrie/frontend/templates/{}" \;
    popd
}
