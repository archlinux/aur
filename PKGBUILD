# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=check-manifest
pkgver=0.47
pkgrel=2
pkgdesc='Check MANIFEST.in in a Python package for completeness'
arch=(any)
url='https://github.com/mgedmin/check-manifest'
license=(MIT)
depends=(python-build python-pep517 python-setuptools python-toml)
makedepends=(python-installer python-wheel)
checkdepends=(git python-mock python-pytest subversion)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'check-manifest-tests-git-submodule.patch')
sha256sums=('56dadd260a9c7d550b159796d2894b6d0bcc176a94cbc426d9bb93e5e48d12ce'
            '2a405b121ff7b6d9a27d09cf74ea9331f08e78d700cd22e46bcb2c3987cfe066')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -N -r - -i "$srcdir"/check-manifest-tests-git-submodule.patch
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  python -m pytest tests.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.rst -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
