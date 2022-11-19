# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

_name=docutils
pkgname=python38-docutils
pkgver=0.19
pkgrel=2
epoch=1
pkgdesc='Set of tools for processing plaintext docs into formats such as HTML, XML, or LaTeX'
arch=('any')
url='http://docutils.sourceforge.net'
license=('custom')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
source=("https://downloads.sourceforge.net/$_name/$_name-$pkgver.tar.gz")
sha512sums=('fb904a899f2b6f3c07c5079577bd7c52a3182cb85f6a4149391e523498df15bfa317f0c04095b890beeb3f89c2b444875a2a609d880ac4d7fbc3125e46b37ea5')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name-$pkgver
  # we need utf locale to valid utf8 tests
  export LANG=en_US.UTF-8
  PYTHONPATH="$PWD/build/python/" python3.8 test/alltests.py
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  # symlink without .py
  for f in "$pkgdir"/usr/bin/*.py; do
      ln -s "$(basename "$f")" "$pkgdir/usr/bin/$(basename "$f" .py)"
  done

  # symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/docutils-$pkgver.dist-info/COPYING.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}

# vim:set ts=2 sw=2 et:
