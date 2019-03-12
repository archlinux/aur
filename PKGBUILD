# Maintainer: Bailey Fox <bfox200012@gmail.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=meanalyzer-git
pkgver=1.82.3.r154.r0.d8d9dfd
pkgrel=1
pkgdesc='Intel Management Engine firmware analysis tool'
arch=('any')
url='https://github.com/platomav/MEAnalyzer'
license=('GPL3')
depends=('python-colorama' 'python-prettytable' 'python-huffman11-git')
makedepends=('dos2unix' 'git')
source=("${pkgname}::git+${url}#branch=master"
        'db-location.patch'
	'https://github.com/platomav/PTable/archive/boxchar.zip')
sha256sums=('SKIP'
            'd6c820300071011041654d4d076c0a3594ca1443e7c93894ae512535a0f38de7'
            'd8783384fa8e2d84bbd641cf01438f40b29fecf88d79340551789b435333e8b4')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p0 --binary < ../db-location.patch
  dos2unix MEA.py
}

package() {
  cd "${srcdir}/PTable-boxchar"
  python setup.py install --root="$pkgdir/" --optimize=1
  
  cd "${srcdir}/${pkgname}"
  install -Dm644 MEA.dat "${pkgdir}"/usr/lib/meanalyzer/MEA.dat
  install -Dm755 MEA.py "${pkgdir}"/usr/bin/meanalyzer
}
