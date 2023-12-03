# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=ropgadget-git
pkgver=7.4.542.0fd62cc
pkgrel=1
pkgdesc="Search gadgets in binaries to facilitate ROP exploitation for several file formats and architectures"
url="http://www.shell-storm.org/project/ROPgadget"
arch=('any')
license=('BSD')
depends=('python' 'python-capstone')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('ropgadget')
conflicts=('ropgadget')
source=(${pkgname}::git+https://github.com/JonathanSalwan/ROPgadget)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname}
  ./ROPgadget.py --binary ./test-suite-binaries/elf-Linux-x86 --string "main"
}

package() {
  cd ${pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE_BSD.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
