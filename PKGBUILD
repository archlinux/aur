# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=spacemacs
_pkgmaintainer=syl20bnr
_pkgdestdirname=spacemacs-funcs
_versionprefix=v
pkgver=0.200.14
pkgrel=1
pkgdesc="Useful functions from the Spacemacs project"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("spacemacs-funcs.el"
	"$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('1cb471431cbc7b1654a16f9dbe8c56dac044010d7f1eaa998b31a966dedc5198'
            '69f98dbd6b719b9fcb153711a77eafb14721f49ae696eaca3c379ed14e7e72d7')
install=${pkgname}.install

build() {
  emacs -q --no-splash -batch -L . -f batch-byte-compile spacemacs-funcs.el

  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  shopt -s globstar
  shopt -s extglob
  emacs -q --no-splash -batch -L . -f batch-byte-compile {core,layers}/**/*funcs*.el
}

package() {
  export dest="${pkgdir}/usr/share/emacs/site-lisp/${_pkgdestdirname}/"

  mkdir -p $dest

  install -m644 spacemacs-funcs.el{c,} $dest

  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  shopt -s globstar
  shopt -s extglob
  find {core,layers}/ -name *funcs.el* -exec bash -c 'file=${1#./}; install -m644 "$file" "$dest${file//\//_}"' _ '{}' \;
}
