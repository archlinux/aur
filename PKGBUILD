# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_reponame=bubblewrap
pkgname=${_reponame}-overlayfs
pkgver=0.10.0.r0.gdc63ec6
pkgrel=1
pkgdesc='Unprivileged sandboxing tool (with overlay enabled)'
url='https://github.com/containers/bubblewrap'
arch=(x86_64)
license=(LGPL-2.0-or-later)
depends=(
  gcc-libs
  glibc
  libcap
)
makedepends=(
  bash-completion
  docbook-xsl
  git
  libxslt
  meson
)
_commit=dc63ec667e6546f34e0b6c088cdf8ae7c7dea0f3  # tags/v0.10.0^0
source=(
  "git+$url#commit=$_commit"
  "$pkgname-overlayfs.patch::$url/pull/547.patch"
)

sha256sums=('96245c818e9533927863ba1cec173fdbd3dd9759e86861aaee843bb90c4fd0d7'
            '508ca9db98d61be50904e126a30550ae1527ee6801767ba204390f88127b2f8c')

pkgver() {
	cd "$_reponame"
	( set -o pipefail
		git describe --tag --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
  cd $_reponame
  patch -p1 -i "$srcdir/$pkgname-overlayfs.patch"
}

build() {
  arch-meson $_reponame build -D selinux=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  provides=("bubblewrap=$pkgver-$pkgrel")
  conflicts=(bubblewrap)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
