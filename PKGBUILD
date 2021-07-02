
pkgname=python2-automat
pkgver=20.2.0
pkgrel=7
arch=('any')
license=('MIT')
pkgdesc="Self-service finite-state machines for the programmer on the go."
url="https://github.com/glyph/automat"
depends=('python2-attrs')
makedepends=('python2' 'python2-setuptools-scm' 'python2-m2r' 'python2-six')
checkdepends=('python2-pytest' 'python2-graphviz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/glyph/automat/archive/refs/tags/v$pkgver.tar.gz" backport_Fix_test_visualize.py_twisted_import_errors.patch)
sha512sums=('ccba3e82f589fedb1f83dfb37a6a42b51a78d8c3e6fea22c9518135ff194f5f70e2f9c5f0eab50b6e116dae92c94754aac8dbf0e670a59015c916991736b4076'
            'af1a9474784f12571fddaf89d5e1d227a31722d76a70852dd6086080ed4e583084124d22dd9373b9673686d0c90c5f657bdd1caf92e89f79858a997e039578a3')

prepare() {
  # This patch is part of upstream/master but 20.2.0 is still broken. Remove at the next update.
  cd automat-$pkgver
  patch --forward --strip=1 --input="${srcdir}/backport_Fix_test_visualize.py_twisted_import_errors.patch"
}

build() {
  # Set version for setuptools_scm
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  cd automat-$pkgver
  python2 setup.py build
}

check() {
  # Some tests need python2-twisted, but python2-twisted depends on this
  # package. Minor dependency cycle...
  # Luckily they get skipped automatically of python2-twisted isn't installed.
  # Thus, simply don't put python2-twisted in checkdepends.
  cd automat-$pkgver
  python2 -m pytest --deselect benchmark
}

package() {
  cd automat-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  mv "$pkgdir"/usr/bin/automat-visualize{,2}
}
