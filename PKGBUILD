# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=puddletag-git
pkgver=2.3.0.r1.g6fe83ef
pkgrel=1
pkgdesc="An audio tag editor for GNU/Linux, git version"
url="https://github.com/${pkgname%%-*}/${pkgname%%-*}"
license=('GPL-3.0-or-later')
arch=('any')
depends=('python-configobj'
         'python-distro'
         'python-mutagen'
         'python-pyparsing'
         'python-pyqt5'
         'python-unidecode'
         'qt5-svg')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
optdepends=('chromaprint: AcoustID support'
            'python-levenshtein: faster duplicate matching'
            'python-lxml: additional tag sources' 
            'quodlibet: QuodLibet library support')
provides=("${pkgname%%-*}")
conflicts=("${pkgname%%-*}")
replaces=("${pkgname%%-*}-qt5-git")
source=("${pkgname}::git+${url}"
        "pyparsing-pep-8.patch::${url}/pull/880.patch")
sha512sums=('SKIP'
            '2dfa1e6dac1262a8f9386c55df35e8b96c3cbe306f126a25df8adfc05a030dd313cf7083c01edd7ccfd7ffca7e7f896c3646c2966c949cc210d6a84a907710ea')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"

  # Apply pyparsing PEP-8 usage patch
  # Source: https://github.com/puddletag/puddletag/pull/880
  patch -Np1 -i ../pyparsing-pep-8.patch
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
