# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

_pkgname=ninja
pkgname=$_pkgname-jobserver
provides=(ninja)
conflicts=(ninja)
pkgver=r3172.d18af81
pkgrel=1
pkgdesc='Small build system with a focus on speed (with job server and client patch)'
arch=(x86_64)
url='https://ninja-build.org/'
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(cmake python re2c git)
checkdepends=(gtest)
_srcdir='ninja-digit-google'
_commit='d18af81202edfa993ba069fd5a971db8438f45c0'
source=(
  "${_srcdir}::git+https://github.com/digit-google/ninja.git#commit=$_commit"
  "${_srcdir}-jobserver-1.patch::https://github.com/digit-google/ninja/commit/99e2383ba33002f515f51aa5c7ee545fa843de6d.patch"
  "${_srcdir}-jobserver-2.patch::https://github.com/digit-google/ninja/commit/15d54e25ee3f9c89af0a54cad11644d7f38b296e.patch")
sha256sums=('7b733d722e85ca05fb42993c94992f8586af10b2538dec173c9e24ed4d86a557'
            '49e61486bfd9a23079136723caceecabe7dc321e8d66805abbee6e8879eac233'
            'ad5257bff7b48d747b10a848c01a65da3fd7638b1504bed6dd020fc37394fb11')

prepare() {
  cd "${_srcdir}"

  patch -p1 -i "${srcdir}/${_srcdir}-jobserver-1.patch"
  patch -p1 -i "${srcdir}/${_srcdir}-jobserver-2.patch"
}

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
