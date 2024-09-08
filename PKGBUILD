# Maintainer: Cherry <arch@sparklet.org>
# shellcheck disable=SC2034,SC2154
_pkgname=windot
pkgname=$_pkgname-git
pkgver=0.2.1.r93
pkgrel=1
arch=(x86_64)
url="https://github.com/Lamby777/windot"
source=("$_pkgname::git+https://github.com/Lamby777/windot.git")
pkgdesc="A simple emoji picker."
md5sums=('SKIP')

depends=('gtk4' 'libadwaita')
makedepends=('cargo' 'git' 'pkgconf')
conflicts=('windot')
provides=("windot=${pkgver}")

# Fetch the current version using the latest commit hash
pkgver() {
    cd "$srcdir/$_pkgname"

    # get the crate version using grep and sed
    cargo_ver=$(grep '^version =' Cargo.toml | sed -E 's/version = "(.*)"/\1/')
    
    # use the latest commit's rev#
    git_rev=$(git rev-list --count HEAD)
    
    # requires the rev first for version sorting purposes
    echo "$cargo_ver.r$git_rev"
}

prepare() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname"
    make 
}

package() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable

    make install DESTDIR="$pkgdir/" prefix="/usr"
}
