# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>

_pkgname=ninja
pkgname=$_pkgname-jobserver
provides=(ninja)
conflicts=(ninja)
pkgver=r3190.ffac509
pkgrel=1
pkgdesc='Small build system with a focus on speed (with job server and client patch)'
arch=(x86_64)
url='https://ninja-build.org/'
license=(Apache-2.0)
depends=(gcc-libs)
makedepends=(cmake python re2c git)
checkdepends=(gtest)
_srcdir='ninja-digit-google'
_commit='ffac509486cfb655f5518e4efc251f31f45eedce'
source=(
  "${_srcdir}::git+https://github.com/digit-google/ninja.git#commit=$_commit"
  "${_srcdir}-jobserver-1-d22cac15a5f1a9bfc683f357d7e645a0e23e372d.patch::https://github.com/digit-google/ninja/commit/d22cac15a5f1a9bfc683f357d7e645a0e23e372d.patch"
  "${_srcdir}-jobserver-2-fe9362968ef2cfc2adb76e0f359c4d3682fcdc9d.patch::https://github.com/digit-google/ninja/commit/fe9362968ef2cfc2adb76e0f359c4d3682fcdc9d.patch"
  "${_srcdir}-jobserver-3-24a02624d482ecd5712cbe267fc9ffcbf44f2508.patch::https://github.com/digit-google/ninja/commit/24a02624d482ecd5712cbe267fc9ffcbf44f2508.patch")
sha256sums=('b06bb5b994389f5477855b03b412fd9d0b98c30c234a70e153645420221fa0a5'
            'd7cdc1cbf0e8026f4a7bb1e9429d969dee5b0355b7cf5e7dfd16f3a484d3deaf'
            'a22a5338a945357714336d26431a2d32b5d48c5c2ef19cc3adb15c0e55c51a4c'
            'b84676411d4de45f520806cb73730560fecd215497f38cd29e8e1f57c5df6a22')

prepare() {
  cd "${_srcdir}"

  for patch in "${srcdir}/"*.patch; do
    patch -p1 -i "$patch"
  done
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
