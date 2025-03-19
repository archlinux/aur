# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_repo=harakit
_pkgname=$_repo
pkgname=$_pkgname-git
pkgver=r682.0e9127d
pkgrel=3
pkgdesc="New utilities for a new era."
arch=('any')
url="https://git.tebibyte.media/bonsai/$_repo"
license=('AGPL')
depends=()
makedepends=('rust' 'rust-bindgen')
replaces=('bonsai-coreutils-git')
source=("git+https://git.tebibyte.media/bonsai/$_repo.git" "bonsai.sh")
md5sums=(
	SKIP
	ae17ace590d882d9c9701ba4cecbeefe
)

pkgver() {
  cd "$_repo"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	cd "$_repo"
	make all
}

check() {
	cd "$_pkgname"
	make test
}

package() {
	profile_d="$pkgdir/etc/profile.d"
	mkdir -p "$profile_d" "$pkgdir/opt/bonsai"
	cp bonsai.sh "$profile_d"

	cd "$_repo"
	make PREFIX="$pkgdir/opt/bonsai" install
}
