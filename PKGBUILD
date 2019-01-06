# Maintainer: Oliver Harley <oliver.r.harley+aur <at > gmail.com>

_pkgbase=psi-exact-inference
pkgname=psi-exact-inference-git
pkgver=r1246.db0227c
pkgrel=1
arch=('any')
url="https://psisolver.org/"
pkgdesc="Exact inference for probabilistic programs"
license=('Boost-1.0')
# depends=('d-compiler')
makedepends=('git' 'd-compiler')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
optdepends=(gnuplot)
source=("$_pkgbase::git+https://github.com/eth-sri/psi.git")
sha256sums=('SKIP')

# choose your preferred compiler, 'ldmd, ldmd2, dmd, gdc', else it will until finding one
DCOMP='ldmd2'

pkgver() {
  cd "$_pkgbase"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$_pkgbase"
}

d_compiler() {
    if  [ -x "$(command -v $DCOMP)" ]; then
        DCOMP=$DCOMP
    else
        # search in no particular order
        if [ -x "$(command -v gdc)" ]; then
            DCOMP="gdc"
        elif [ -x "$(command -v ldmd2)" ]; then
            DCOMP="ldmd2"
        elif [ -x "$(command -v dmd2)" ]; then
            DCOMP="dmd2"
        elif [ -x "$(command -v ldmd)" ]; then
            DCOMP="ldmd"
        elif [ -x "$(command -v dmd)" ]; then
            DCOMP="dmd"
        fi
    fi
    echo "Using d compiler: $DCOMP"
}


build() {
	cd "$_pkgbase"
    d_compiler
    $DCOMP -O -release -inline -boundscheck=off -J. -Jlibrary *.d -ofpsi -v
}

check() {
	cd "$_pkgbase"
    d_compiler
    echo "Building tests"
    $DCOMP test/runtests.d -oftest/runtests -v
    echo "Running tests"
    ./test/runtests
}

package() {
	cd "$_pkgbase"
    install -Dm755 psi $pkgdir/usr/bin/psi
    install -D LICENSE $pkgdir/usr/share/sicenses/psi-git/LICENSE
}
