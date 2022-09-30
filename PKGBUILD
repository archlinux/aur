# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: Jan Dolinar <dolik.rce@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>
pkgname=dput
pkgver=1.1.2
pkgrel=2
pkgdesc="Debian package upload tool"
arch=('any')
url="http://packages.qa.debian.org/dput"
license=('GPL')
makedepends=('python-setuptools')
depends=('python' 'python-debian' 'python-gpgme' 'python-pyxdg')
source=(http://http.debian.net/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz)
md5sums=('21d77e7607cce37a42f7be38e5df8335')

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
