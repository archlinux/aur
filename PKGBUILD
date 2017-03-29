# Maintainer: YOUNG HO CHA <ganadist@gmail.com>
_pkgname=fontdiff
pkgname=${_pkgname}-git
_commit=a3917bb
pkgver=0.2.2.r2.ga3917bb
pkgrel=1
pkgdesc="Utility for testing fonts"
arch=(arm x86_64)
url="https://github.com/googlei18n/fontdiff"
license=('Apache2')
groups=()
depends=()
makedepends=("git")
optdepends=()
provides=("fontdiff")
conflicts=("fontdiff")
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("git+https://github.com/googlei18n/${_pkgname}.git#commit=$_commit")
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update 
}

build() {
  cd "$_pkgname"
  src/third_party/gyp/gyp -f make --depth . --generator-output build src/fontdiff/fontdiff.gyp
  make --directory build
}

dobin() {
  src=$1
  dst=$2
  [ -n "${dst}" ] || dst=$(basename "${src}")
  dst="${pkgdir}"/usr/bin/"${dst}"
  install -D -m755 "${src}" "${dst}"
}

dodoc() {
  src=$1
  dst=$2
  [ -n "${dst}" ] || dst=$(basename "${src}")
  dst="${pkgdir}"/usr/share/doc/${_pkgname}/"${dst}"
  install -D -m644 "${src}" "${dst}"
}

package() {
  cd "$_pkgname"
  install -D -m644 LICENSE.md ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md
  for D in CONTRIBUTING.md README.md doc/fontdiff-1.png
  do
    dodoc "${D}" "${D}"
  done
  dodoc src/fontdiff/specimen.html
  dobin build/out/Default/fontdiff
}
