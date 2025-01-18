# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Penguin <TGates81.at.gmail.dot.com>

_pkgname=pylzma
pkgname=python-$_pkgname
pkgver=0.5.0
_testing_data_version=210629
pkgrel=5
pkgdesc='Platform independent python bindings for the LZMA compression library'
url='https://www.joachim-bauch.de/projects/pylzma/'
license=("LGPL-2.1-or-later")
arch=(i686 x86_64)
makedepends=('python-setuptools')
source=($_pkgname-$pkgver.tar.gz::https://github.com/fancycode/pylzma/archive/v$pkgver.tar.gz
        # testing data
        ux.stackexchange.com.$_testing_data_version.7z::https://archive.org/download/stackexchange/ux.stackexchange.com.7z)
sha256sums=('baefed4c84d147a507a606206478ff0894e04fa41aa3742381159cde44836fc3'
            'SKIP')
noextract=(ux.stackexchange.com.$_testing_data_version.7z)

prepare() {
  ln -s ../../../ux.stackexchange.com.$_testing_data_version.7z $_pkgname-$pkgver/tests/data/ux.stackexchange.com.7z
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  # Workaround for `-Wint-conversion` error in build.
  #   Reported here: https://aur.archlinux.org/packages/python-pylzma#comment-998803
  #   Fix here: https://github.com/fancycode/pylzma/issues/80
  CFLAGS=-Wno-int-conversion python setup.py build
}

# This package itself needs to be installed for the check to work, so I'm just going to disable it
# check() {
#   cd "$srcdir/$_pkgname-$pkgver"
#   PYTHONPATH="$PWD:$PWD/build/lib.linux-$CARCH-3.10" python tests/__init__.py
# }

package() {
  depends=('python')
  conflicts=('pylzma')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
