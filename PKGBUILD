# Maintainer: Tobias Frisch <thejackimonster@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-git
pkgver=0.1.5.r4.g4ff9d54
pkgrel=3
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
        'https://github.com/AUNaseef/protonup/pull/47.patch')
sha256sums=('SKIP'
            'f3f9ce4f188267639cb9b286e0c0c30cc7e79c95e20f10d3be04098167654da9')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Handle arch-specific assets
  patch -Np1 -i ../47.patch

  git clean -dfx
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
