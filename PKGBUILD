# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

_pkgname=ninja
pkgname=$_pkgname-jobserver
provides=(ninja)
conflicts=(ninja)
pkgver=r2936.c9e21db
pkgrel=1
pkgdesc='Small build system with a focus on speed (with job server and client patch)'
arch=(x86_64)
url='https://ninja-build.org/'
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(cmake python re2c emacs-nox git)
checkdepends=(gtest)
_srcdir='ninja-jobserver-fifo'
_commit='c9e21dbbc4c746ba397c0f9bec5f65c99f783c08'
source=("${_srcdir}::git+https://github.com/stefanb2/ninja.git#commit=$_commit")
sha256sums=('a7be977b9c915b1289329395d44ca9eac0df87950a366e00f0875d9ab7712dff')

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
  emacs -Q --batch -f batch-byte-compile misc/ninja-mode.el
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

  install -m644 -D misc/ninja-mode.el "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.el"
  install -m644 -D misc/ninja-mode.elc "$pkgdir/usr/share/emacs/site-lisp/ninja-mode.elc"
  install -m644 -D misc/ninja.vim "$pkgdir/usr/share/vim/vimfiles/syntax/ninja.vim"
  install -m644 -D misc/ninja_syntax.py "$pkgdir/$site_packages/ninja_syntax.py"

  install -m644 -D misc/bash-completion "$pkgdir/usr/share/bash-completion/completions/ninja"
  install -m644 -D misc/zsh-completion "$pkgdir/usr/share/zsh/site-functions/_ninja"
}
