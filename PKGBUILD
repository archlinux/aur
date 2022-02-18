# Maintainer: Elijah Gregg <lovetocode999 at tilde dot team>
pkgname=heb12-cli-git
pkgver=0.1.2.r64.ge7bc8d9
pkgrel=1
pkgdesc="Bible command line interface reader."
arch=("x86_64")
url="https://heb12.com/"
license=("GPL2")
makedepends=("wget")
provides=("heb12")
conflicts=("heb12")
source=("git+https://code.heb12.com/heb12/cli.git" "https://api.heb12.com/translations/biblec/web.i" "https://api.heb12.com/translations/biblec/web.t")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/cli"

    _tag=$(git tag --sort=v:refname | tail -n1)
    printf '%s.r%s.g%s' "${_tag#v}" "$(git rev-list "$_tag"..HEAD --count)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/cli"

    git submodule --quiet update --init --recursive
}

build() {
    cd "$srcdir/cli"

    make CC=gcc
}

package() {
    cd "$srcdir/cli"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/heb12/bibles"
    cp heb12 "$pkgdir/usr/bin"
    cp ../web.i "$pkgdir/usr/share/heb12/bibles"
    cp ../web.t "$pkgdir/usr/share/heb12/bibles"
}
