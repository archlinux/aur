# Maintainer: Rolv Apneseth <rolv.apneseth at gmail dot com>

_reponame=frankfurte-rs
_repo=https://github.com/Rolv-Apneseth/$_reponame
pkgname=frs
pkgver=v0.0.5.r0.gc8816be
pkgrel=1
pkgdesc='CLI wrapper around the Frankfurter API, used for getting the latest and historical currency exchange rates'
arch=('i686' 'x86_64')
url=${_repo}
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('cargo' 'git')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("git+$_repo.git")
md5sums=('SKIP')
options=(!debug)

pkgver()
{
    cd "$_reponame"
    git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    cd "$_reponame"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$_reponame"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package()
{
    cd "$_reponame"
    install -Dm755 "target/release/$pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICEN?E \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
