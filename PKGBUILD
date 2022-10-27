# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: Jan Dolinar <dolik.rce@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>
pkgname=dput
pkgver=1.1.2
pkgrel=4
pkgdesc="Debian package upload tool"
arch=('any')
url="http://packages.qa.debian.org/dput"
license=('GPL')
makedepends=('python-setuptools')
depends=('python' 'python-debian' 'python-gpgme' 'python-pyxdg')
source=(
  http://http.debian.net/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz
  pyxdg-compatibility.patch
)
sha256sums=('cfdf60ab70806095b90dd6b266c9e397b30b2a8ac69e3660e4cb70db18636432'
            '2e19cb96d405f25b42ff2e4b1ac4651e4c6a6f96693d200170a8f69f55b33117')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i "$srcdir/pyxdg-compatibility.patch"
}

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  mv ${pkgdir}/usr/bin/{execute-,}dput
  mv ${pkgdir}/usr/bin/{execute-,}dcut

  install -d "${pkgdir}/etc/"
  install -m644 dput.cf "${pkgdir}/etc/"

  # completion
  install -d "${pkgdir}/usr/share/bash-completion/completions/"
  for bc in dput dcut; do
    install -m644 bash-completion/${bc}.bash "${pkgdir}/usr/share/bash-completion/completions/$bc"
  done

  # docs
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README TODO doc/FAQ doc/THANKS "${pkgdir}/usr/share/doc/${pkgname}"

  # man pages
  cd doc/man
  for file in $(find . -name '*.1' -print); do
    install -Dm644 $file "${pkgdir}"/usr/share/man/man1/$file
  done
  for file in $(find . -name '*.5' -print); do
    install -Dm644 $file "${pkgdir}"/usr/share/man/man5/$file
  done
}
