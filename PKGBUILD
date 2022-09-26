# Maintainer: gilcu3 <gilcu3 [at] gmail [dot] com>
# Contributor: kaptoxic@yahoo.com

_pkgname=proofgeneral
pkgname="$_pkgname-git"
pkgver=4.5.r9313.c304d73e
pkgrel=1
pkgdesc="Generic interface for proof assistants"
arch=($CARCH)
license=('GPLv3+')
depends=('emacs>=25.2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
url="https://github.com/ProofGeneral/PG"
source=("${_pkgname}::git+$url.git" "squirrel.patch")
sha512sums=('SKIP'
            'd7dff3453a1262747b99faa6dabda2f08c3928f089f24b42111753779bf2c705a5f897271a30b8557d4673aaac61b64a1b7f4bfb7a22790b6e1d37bef0c7ac10')

prepare(){
  cd "$srcdir/${_pkgname}"
  patch --strip=2 --input=../squirrel.patch
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

build() {
  cd "$srcdir/${_pkgname}"

  make
}

package() {
  cd "$srcdir/${_pkgname}"
  
  for file in $(find . -type f -name '*.el')
  do
      install -Dm644 "${file}" "${pkgdir}/usr/share/emacs/site-lisp/${_pkgname}/${file}"
  done
}
