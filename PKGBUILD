# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_repo=coreutils
_pkgname=bonsai-$_repo
pkgname=$_pkgname-git
pkgver=r173.c97201f
pkgrel=6
pkgdesc="New core utilities for a new era."
arch=('any')
url="https://git.tebibyte.media/bonsai/coreutils"
license=('AGPL')
depends=()
makedepends=('rust' 'rust-bindgen')
provides=('bonsai-coreutils')
source=("git+https://git.tebibyte.media/bonsai/coreutils.git" "bonsai.sh")
md5sums=(
	SKIP
	da0c6fdb4cf0bcf99387518a83978b4e
)

pkgver() {
  cd "$_repo"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

# for when testing works
#
# check() {
# 	cd "$_pkgname"
# 	make test
# }

package() {
	profile_d="$pkgdir/etc/profile.d"
	mkdir -p "$profile_d"
	mv bonsai.sh "$profile_d"

	cd "$_repo"
	make install PREFIX="$pkgdir/opt/bonsai"
}
