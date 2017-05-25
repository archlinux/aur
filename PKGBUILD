# Maintainer: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=spacemacs
_pkgmaintainer=syl20bnr
_pkgdestdirname=spacemacs-funcs
_versionprefix=v
pkgver=0.200.9
pkgrel=2
pkgdesc="Useful functions from the Spacemacs project"
pkgname=emacs-${_pkgdestdirname}
arch=(any)
url="https://github.com/${_pkgmaintainer}/${_pkgsrcname}"
license=('GPL3')
depends=('emacs')
source=("spacemacs-funcs.el"
	"$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
sha256sums=('eb0382f22b73e3be609ac585dd24ef3a5ecb317067d13f7f06d85ec7887779a2'
            '81e8fc56421e00405cba2d78f8b5e14b1d9e8e23803dcf43eb8e89b72273ea1b')
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
