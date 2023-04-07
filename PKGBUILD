# Maintainer:
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python-nose
pkgver=1.3.7
pkgrel=15
pkgdesc="A discovery-based unittest extension"
arch=('any')
url='https://readthedocs.org/docs/nose/'
license=('LGPL2.1')
depends=(
  python
  python-setuptools
)
makedepends=(
  dos2unix
  python-build
  python-coverage
  python-installer
  python-wheel
)
source=(
  "https://pypi.python.org/packages/source/n/nose/nose-${pkgver}.tar.gz"{,.asc}
  # thanks Fedora for all the great patches!
  python-nose-coverage4.patch
  python-nose-py35.patch
  python-nose-unicode.patch
  python-nose-readunicode.patch
  python-nose-py36.patch
  python-nose-py38.patch
  python-nose-no-use_2to3.patch
  python-nose-py311.patch
  python-nose-py311-doctest.patch
)
sha512sums=('e65c914f621f8da06b9ab11a0ff2763d6e29b82ce2aaed56da0e3773dc899d9deb1f20015789d44c65a5dad7214520f5b659b3f8d7695fb207ad3f78e5cf1b62'
            'SKIP'
            '10d217ecebc97ee1740c0e057b63e2adcdb64779bbd98d37560304ea9bafff8ab9116311a5842bb58eb6307a3a5f689413ad60522f6fae328250dfec0c08e156'
            'f78d95edd97fdf2e2a692c484ea9e086f2a7221a7555e2c5eec5aa8b7366d7dfe22de9ac98287d6b23207d0e1473c1f6da7bd0f451e1db22f975d4e99b9cd478'
            '46f30b49ab78020502ed0e28bd14f38e67904231f2d0a7549519eef0177462795b4f3ab3c632563e53d4d8a96c7f324dcc3876fa0b0723bced3ed6c80e3ab8c4'
            '6a51e06b03ca11469aff24e823bb6ebf5bf31ecfb48d0a72886b5b60d8785799e3abcf2b5526338015bb4ada0045f2addec1326a351ef54fbcc5a12d21215c45'
            '029dbd6f8b2fe264bb54f3f0c913f7e80fdad468fde09dbdde52c6a4db1776100f41e7afffb4195c25eb0813ac49f38c75378edf26af105690f9452d643dda67'
            '459f99641116d00f822efe1a2e810aacb6c0994cd9f7fb5c2476065f80b5852e4ee9e26857e686b24e54f3168c3fbe276f25595c4d1914b3a0adbf2603712fff'
            '14a2e328b0d29425f176d857b6451a8245a730e74abe59156b4b6e2392388a703283bf1351e8a78a33fe901c5b5323a9d58d6079a53af096f59537dd92f5069c'
            '1f4d776d4de08a2977fe14108d217c7d86ef9c851dd1842c62ac86f0858452bbbeb07403e0853cb28558373157c667b9de404a8b20746c8c03ab3c539ca5f9a9'
            'ab5abb49b8da8f4178788a0d57ea0a35236b769e7715e06ba74d2a8d3639f4b9ff5855f47721835051be4eb06b08ad79fa94c779877a5a21b2943e0d1c820911')
validpgpkeys=('58B277C0D208F7AC460C07C84548B3A8C0D70C12') # John Szakmeister <john@szakmeister.net>

prepare() {
  local src

  cd nose-$pkgver
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  dos2unix examples/attrib_plugin.py
  2to3 --write --nobackups --no-diffs .
  2to3 --write --nobackups --no-diffs -d $(find . -name '*.rst')
}

build() {
  cd nose-$pkgver
  python -m build --wheel --no-isolation
  python setup.py build_tests
}

check() {
  cd nose-$pkgver
  python selftest.py
}

package() {
  cd nose-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  ln -s nosetests "$pkgdir"/usr/bin/nosetests3
}
