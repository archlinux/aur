# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=libray
_gitname="libray"
pkgver=0.0.10
pkgrel=2
url="https://notabug.org/necklace/libray"
pkgdesc="LibRay aims to be a Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs."
arch=("any")
license=("GPLv3")
depends=("python" "python-pycryptodome" "python-beautifulsoup4" "python-tqdm" "python-requests" "python-html5lib")
makedepends=("python-setuptools")

source=("https://notabug.org/necklace/${_gitname}/archive/${pkgver}.tar.gz"
        "https://archive.org/download/sony-playstation-3-disc-keys/sony-playstation-3-disc-keys.zip")

sha256sums=('6925cad7444e52fbf210348e70be001ed11c01a0f855f6b45e00fe61abac0c14'
            '281e5586291633f9539962007938a6353cb9ae6c241bd3e3fe0ae434215b6602')

build() {
  cd $srcdir

  mkdir -p $_gitname/$_gitname/data

  rm -rf $_gitname/tools/keys
  mv keys $_gitname/tools/keys
  mv *.csv $_gitname/tools/
  mv *.dat $_gitname/tools/

  cd $_gitname/tools/

  python keys2db.py

  cd $srcdir/$_gitname
  
  python setup.py build  
}


package() {
	cd $srcdir/$_gitname
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

