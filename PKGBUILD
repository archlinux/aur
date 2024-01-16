# Maintainer: Emma Tebibyte <emma@tebibyte.media>

_repo=coreutils
_pkgname=bonsai-$_repo
pkgname=$_pkgname-git
pkgver=r82.0cbfb5c
pkgrel=3
pkgdesc="New core utilities for a new era."
arch=('any')
url="https://git.tebibyte.media/bonsai/coreutils"
license=('AGPL')
depends=('rust')
makedepends=('rust-bindgen')
provides=('bonsai-coreutils')
source=("git+https://git.tebibyte.media/bonsai/coreutils.git")
md5sums=(SKIP)

pkgver() {
  cd "$_repo"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
	cd "$_repo"
	./configure gcc
}

# for when testing works
#
# check() {
# 	cd "$_pkgname"
# 	make test
# }

package() {
	cd "$_repo"
	
	make install PREFIX=$pkgdir/usr

	for file in $pkgdir/usr/bin/*; do
		case "$file" in
			*true) rm "$file" ;;
			*false) rm "$file" ;;
			*) ;;
		esac
	done

	for file in $pkgdir/usr/share/man/man1/*; do
		case "$file" in
			*true.1) rm "$file";;
			*false.1) rm "$file";;
			*) ;;
		esac
	done
}
