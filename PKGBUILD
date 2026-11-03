# Maintainer: Tobias Frisch <thejackimonster@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-git
pkgver=0.1.5.r6.gd702a3e
pkgrel=2
pkgdesc="Install and Update Proton-GE"
arch=('any')
url="https://github.com/AUNaseef/protonup"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-requests'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AUNaseef/protonup.git'
        'installdir.patch')
sha256sums=('SKIP'
            'c731bb3b20732a68f6c5909460f0cf2ec7919729fa1aa52e0310ba91342d2c84')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git clean -dfx

  # Fix installation directory
  patch -Np1 -i ../installdir.patch
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
