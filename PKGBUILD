# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ninja-fuchsia-git
pkgver=r3379.44e03391
pkgrel=1
pkgdesc='Small build system with a focus on speed - Fichsia version with JobServer and improved status output'
arch=(x86_64)
url=https://fuchsia.googlesource.com/third_party/github.com/ninja-build/ninja/
provides=(ninja)
conflicts=(ninja)
license=(Apache)
depends=(gcc-libs)
makedepends=(python re2c git)
_commit=44e033912a984d4af38349205b250c71e0c51b58
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=(SKIP)

pkgver () {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "$pkgname"
	CXXFLAGS="$CXXFLAGS -include cstdint -std=gnu++17" \
		python configure.py --bootstrap
}

package () {
	cd "$pkgname"
	install -m755 -D ninja "$pkgdir/usr/bin/ninja"
	install -m644 -D doc/manual.asciidoc "$pkgdir/usr/share/doc/ninja/manual.asciidoc"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/ninja/COPYING"
	install -m644 -D misc/ninja.vim "$pkgdir/usr/share/vim/vimfiles/syntax/ninja.vim"
	install -m644 -D misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
	install -m644 -D misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
