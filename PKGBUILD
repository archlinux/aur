# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-usfm2osis-cw-git
_pypiname=usfm2osis
pkgver=r139.a861a53
pkgrel=1
_branch=module-tools-sync
pkgdesc="Tools for converting Bibles from USFM to OSIS XML (CrossWire Development Fork)"
arch=('any')
url="https://github.com/JohnAustinDev/Module-tools/"
license=('GPLv3')
makedepends=('git' 'python-setuptools')
depends=('python')
options=(!emptydirs)
provides=("${pkgname%-cw-git}")
conflicts=("${pkgname%-cw-git}")
source=("git://github.com/alerque/$_pypiname.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pypiname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pypiname"
  mv usfm2osis/scripts/*py usfm2osis/
  sed -i -e 's/usfm2osis.scripts/usfm2osis/g' setup.py
  sed -i -e '/__main__/s/^.*$/def main(args=None):/g' usfm2osis/usfm2osis.py
  sed -i -e '/^scriptVersion/a DEBUG = False' usfm2osis/usfm2osis.py
  python setup.py build
}

package() {
  cd "$srcdir/$_pypiname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et: 
