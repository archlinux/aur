# Maintainer: Nichlas Severinsen <ns@nsz.no>
pkgname=libray
_gitname="libray"
pkgver=0.0.7
pkgrel=1
url="https://notabug.org/necklace/libray"
pkgdesc="LibRay aims to be a Libre (FLOSS) Python application for unencrypting, extracting, repackaging, and encrypting PS3 ISOs."
arch=("any")
license=("GPLv3")
depends=("python" "python-pycryptodome" "python-beautifulsoup4" "python-tqdm" "python-requests")
makedepends=("python-setuptools")

source=("https://notabug.org/necklace/${_gitname}/archive/${pkgver}.tar.gz"
        "https://archive.org/download/sony-playstation-3-disc-keys-dat-cuesheets/Sony%20-%20PlayStation%203%20-%20Datfile%20%283590%29%20%282021-06-05%2001-59-33%29.zip"
        "https://archive.org/download/sony-playstation-3-disc-keys-dat-cuesheets/Sony%20-%20PlayStation%203%20-%20Disc%20Keys%20%283388%29%20%282021-06-05%2001-59-33%29.zip")

sha256sums=("608016dfa433b65fa84829dac65e110809e47098a2db29422466f54a5cdd3646"
            "ecf05922689296a9b151d2331cf85692120bc9aebc52c346001a55a3716ef120"
            "aaa5d64440d1294f85f74311efbe2760bac4a68770e1b74d47be03d22cfe7e43")

build() {
  cd $srcdir

  mkdir -p $_gitname/$_gitname/data
  
  mkdir -p $_gitname/tools/keys
  mv *.key $_gitname/tools/keys/
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

