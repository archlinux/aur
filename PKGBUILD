# Maintainer: gabrielsimoes <simoes.sgabriel@gmail.com>

_pkgname="pass-manager"
pkgname="firefox-${_pkgname}"
pkgver=latest
pkgrel=2
pkgdesc="Replace the default Firefox and Thunderbird password manager with zx2c4's pass"
url="https://github.com/gekmihesg/pass-manager"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('firefox')
makedeps=('make automake zip unzip')
source=("${_pkgname}::git+https://github.com/gekmihesg/pass-manager.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}
            

build() {
	cd "${srcdir}"/"${_pkgname}/src"
	make xpi TARGET=extension.xpi
}

package(){
  cd $srcdir/${_pkgname}/src
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm -f $dstdir/extension.xpi
  chmod -R 755 $dstdir

  cd $srcdir/${_pkgname}
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${_pkgname}"/LICENSE
}
