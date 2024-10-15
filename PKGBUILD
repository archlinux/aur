# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=bubblewrap-overlayfs
pkgver=r644.94f8aa9
pkgrel=1
epoch=1
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
_giturl='https://github.com/rhendric/bubblewrap'
_commit=94f8aa9886cadfa224ebfef04d58f6f4c2528627
source=("$pkgname::git+$_giturl#commit=$_commit")
sha256sums=('cd3acf627c2c1a83984a25e5b6fddecff62b84b96c9852f72e9e896be34b0a88')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --tag --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
  arch-meson $pkgname build -D selinux=disabled
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
