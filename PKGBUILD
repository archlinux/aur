# Maintainer: Expo <snorted at cocaine dot ninja>
# Pkgbuild based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=pixelnuke-git

# Configuration
_reposerver=codeberg.org
_repoauthor=Expo
_reponame=joml
_repo=https://$_reposerver/$_repoauthor/$_reponame
_pkgname=joml
_pkgbranch=senpai
_pkgsubdir=.
_setprovides=true # if we should set the provides variable to the pkgname; for -git variant
_sourcedir="src_${_repoauthor}_${_reponame}_${_pkgbranch}"

# Package Build Info
pkgname="$_pkgname-git"
pkgver=r4.58cd474
pkgrel=2
epoch=
pkgdesc="JSON to TOML conversion utility, for use with jq"
arch=('x86_64')
url="$_repo"
license=('Unlicense')
depends=(
  glibc
  gcc-libs
)
makedepends=(
  base-devel
  cargo
  rust
  make
  git
)
provides=()
conflicts=()
if $_setprovides; then
  provides+=("$_pkgname")
  conflicts+=($_pkgname)
fi
source=(
  "$_sourcedir::git+$_repo#branch=$_pkgbranch"
)
sha512sums=('SKIP')

# Package Lifecycle Functions
pkgver() {
  cd "$srcdir/$_sourcedir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_sourcedir/$_pkgsubdir"
	make
}

package() {
	cd "$srcdir/$_sourcedir/$_pkgsubdir"
	install -Dm755 target/release/joml "$pkgdir/usr/bin/joml"
}
