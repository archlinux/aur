# Maintainer: Mike Javorski <mike dot javorski at gmail dot com>
# Contributor: Jan Dolinar <dolik.rce@gmail.com>
# Contributor: Andre Klitzing <andre () incubo () de>
pkgname=dput
pkgver=1.2.7
pkgrel=1
pkgdesc="Debian package upload tool"
arch=('any')
url="http://packages.qa.debian.org/dput"
license=('GPL')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-debian' 'python-gpgme' 'python-pyxdg')
source=(
  http://http.debian.net/debian/pool/main/d/${pkgname}/${pkgname}_${pkgver}.tar.xz
  pyxdg-compatibility.patch
)
sha256sums=('000137ee683a6b896da56ce3f8616e109610231b7b87a45aa7da222386bb6a01'
            '06dfc762aa3c8b3a956b48db8eadf5e22461321f0d3a4270525875195c6086f4')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i "$srcdir/pyxdg-compatibility.patch"
}

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  mv ${pkgdir}/usr/bin/{execute-,}dput
  mv ${pkgdir}/usr/bin/{execute-,}dcut

  install -d "${pkgdir}/etc/"
  install -m644 dput.cf "${pkgdir}/etc/"

  # completion
  install -d "${pkgdir}/usr/share/bash-completion/completions/"
  for bc in dput dcut; do
    install -m644 bash-completion/${bc}.bash "${pkgdir}/usr/share/bash-completion/completions/$bc"
  done

  # license
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.GPL-3 "${pkgdir}/usr/share/licenses/${pkgname}"

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
