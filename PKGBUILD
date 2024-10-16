# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

_pkgname=bubblewrap
pkgname=${_pkgname}-overlayfs
pkgver=0.10.0.r24.gff33964
pkgrel=1
epoch=2
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
_commit=ff33964f3379d2a777235e9a1e4758466fb4b3e4
source=("git+$url#commit=$_commit")
sha256sums=('05cebaae5e4477df6b962a8aca886f18a443ca54f969bfc4760b7d4bd2258aff')

pkgver() {
	cd "${_pkgname}"
	( set -o pipefail
		git describe --tag --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
  arch-meson ${_pkgname} build -D selinux=disabled
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
