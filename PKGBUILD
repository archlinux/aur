# Maintainer: Wilsson Martee <wilssonm@gmail.com>

pkgname=lemonbar-git
_pkgname=lemonbar
pkgver=v1.4.r0.g2e8ac2c
pkgrel=1
pkgdesc="A featherweight, lemon-scented, bar based on xcb."
arch=('i686' 'x86_64')
url="https://github.com/LemonBoy/bar"
license=('MIT')
depends=('libxcb')
makedepends=('git' 'pod2man')
provides=('lemonbar')
conflicts=('lemonbar-xft-git' 'lemonbar-ucs4-git' 'lemonbar-sm-git')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"

	if git_version=$( git describe --long --tags 2>/dev/null ); then
		IFS='-' read last_tag tag_rev commit <<< "$git_version"
		printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
