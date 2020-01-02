# Maintainer: Michael Picht <mipi@fsfe.org>

_pkgorg=gitlab.com/mipimipi
pkgname=crema-git
_pkgname=crema
pkgver=2.0
pkgrel=1
pkgdesc="Manage custom (remote) repositories"
arch=(any)
url="https://$_pkgorg/$_pkgname"
license=(GPL3)
source=("git+https://$_pkgorg/$_pkgname.git")
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
md5sums=(SKIP)
depends=(
    binutils
    devtools
    rsync
)
makedepends=(
    git
    make
    pandoc
)
optdepends=(gnupg)
provides=(crema)
conflicts=(crema)

# aurutils
conflicts+=(
    aurutils
    aurutils-git
)
depends+=(
    jq
    pacutils
    parallel
    wget
)
optdepends+=(
    "bash-completion: bash completion"
    "devtools: aur-chroot"
    "vifm: build file interaction"
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    make

    # aurutils
    cd aurutils
    make DESTDIR="$pkgdir"
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="$pkgdir" install

    # aurutils
    cd aurutils
    make DESTDIR="$pkgdir" install
}
