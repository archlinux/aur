# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

_pkgname=ninja
pkgname=$_pkgname-jobserver
provides=(ninja)
conflicts=(ninja)
pkgver=1.13.1
pkgrel=1
epoch=1
pkgdesc='Small build system with a focus on speed (with job server client patch)'
arch=(x86_64)
url='https://ninja-build.org/'
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(cmake python re2c git)
checkdepends=(gtest)
source=("$pkgname-$pkgver.zip::https://github.com/ninja-build/ninja/archive/v$pkgver.zip")
sha256sums=('5bfe6e147f39347f53777fce2fff324811297f12f4199623a9e3d5a9dc431d69')

_srcdir="${_pkgname}-${pkgver}"

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
