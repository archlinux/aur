# Maintainer: Emerold <emerald-foe-manor at duck dot com>
# Contributor: Muhammad <tjmnkrajyej at gmail dot com>

pkgname=odinls-git
_pkgname_no_git="${pkgname%-*}"
pkgver=dev_2026_05.r14.g85cbf58
pkgrel=1
pkgdesc='Language server and source code formatter for Odin'
arch=('x86_64')
url='https://github.com/DanielGavin/ols'
license=('MIT')
depends=('odin')
makedepends=('git')
provides=("$_pkgname_no_git=$pkgver" "ols=$pkgver" "odinfmt=$pkgver")
conflicts=("$_pkgname_no_git" 'ols' 'odinfmt')
options=(!lto)
source=("$_pkgname_no_git::git+$url.git")
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname_no_git/"
    git describe --long --abbrev=7 | sed 's/-\([^-]*\)-g/.r\1.g/;s/-/_/g'
}

build() {
    cd "$_pkgname_no_git/"
    ./build.sh
    ./odinfmt.sh
}

package() {
    cd "$_pkgname_no_git/"
    install -Dm755 ols "$pkgdir/usr/lib/$_pkgname_no_git/ols"
    install -Dm755 odinfmt "$pkgdir/usr/lib/$_pkgname_no_git/odinfmt"
    install -Dm644 -t "$pkgdir/usr/lib/$_pkgname_no_git/builtin/" builtin/*
    # symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin/"
    ln -s "/usr/lib/$_pkgname_no_git/ols" "$pkgdir/usr/bin/$_pkgname_no_git"
    ln -s "/usr/lib/$_pkgname_no_git/odinfmt" "$pkgdir/usr/bin/odinfmt"
    # distribute license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname_no_git/LICENSE"
}
