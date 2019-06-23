# Maintainer: Bailey Fox <bfox200012@gmail.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=meanalyzer-git
pkgver=1.86.0.r166.r0.g36d1698
pkgrel=2
pkgdesc='Intel Management Engine firmware analysis tool'
arch=('any')
url='https://github.com/platomav/MEAnalyzer'
_branch='master'
license=('GPL3')
depends=('python-colorama' 'python-crccheck')
makedepends=('dos2unix' 'git')
source=("${pkgname}::git+${url}#branch=${_branch}"
        'db-location.patch'
        'change-mea_dir.patch'
        'https://github.com/platomav/PTable/archive/boxchar.zip')
sha256sums=('SKIP'
            '5cadc65438f96ddd3be6e9ef8e5e61904cce093331c2e140a7f1ad635e259481'
            'da169c2384682e5c0b4634ed8d8d1a589ae099d73aa97e95f1c8a63fe2c7c1c9'
            'd8783384fa8e2d84bbd641cf01438f40b29fecf88d79340551789b435333e8b4')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p0 --binary < ../db-location.patch
  patch -p0 --binary < ../change-mea_dir.patch
  dos2unix MEA.py
}

package() {
  cd "${srcdir}/PTable-boxchar"
  python setup.py install --root="$pkgdir/" --optimize=1

  cd "${srcdir}/${pkgname}"
  install -Dm644 MEA.dat "${pkgdir}"/usr/lib/meanalyzer/MEA.dat
  install -Dm644 Huffman.dat "${pkgdir}"/usr/lib/meanalyzer/Huffman.dat
  install -Dm755 MEA.py "${pkgdir}"/usr/bin/meanalyzer
}
