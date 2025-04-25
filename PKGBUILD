# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

_pkgname=ninja
pkgname=$_pkgname-jobserver
provides=(ninja)
conflicts=(ninja)
pkgver=r3239.d4a4f36
pkgrel=1
pkgdesc='Small build system with a focus on speed (with job server client patch)'
arch=(x86_64)
url='https://ninja-build.org/'
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(cmake python re2c git)
checkdepends=(gtest)
_srcdir='ninja-digit-google'
_commit='d4a4f3694c983306584b26c8e45bf3efcd53d108'
source=("${_srcdir}::git+https://github.com/digit-google/ninja.git#commit=$_commit")
sha256sums=('29f1c50569ca217ed80992f7daf23f349b25d9f714987c9e60d16f356a5f17c7')

pkgver() {
	cd "${_srcdir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
  cd "${_srcdir}"

  cmake -Bbuild-cmake
  cmake --build build-cmake
}

check() {
  cd "${_srcdir}"
  ./build-cmake/ninja_test
}

package() {
  cd "${_srcdir}"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  install -m755 -D build-cmake/ninja "$pkgdir/usr/bin/ninja"
  install -m644 -D doc/manual.asciidoc "$pkgdir/usr/share/doc/ninja/manual.asciidoc"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  install -m644 -D misc/ninja.vim "$pkgdir/usr/share/vim/vimfiles/syntax/ninja.vim"
  install -m644 -D misc/ninja_syntax.py "$pkgdir/$site_packages/ninja_syntax.py"

  install -m644 -D misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
  install -m644 -D misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
