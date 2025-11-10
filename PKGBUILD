# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sergey A. <murlakatamenka@disroot.org>
pkgname=tuxclocker
pkgver=1.5.1
pkgrel=2
pkgdesc="Qt overclocking tool for GNU/Linux"
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL-3.0-or-later')
depends=(
  'boost-libs'
  'hicolor-icon-theme'
  'qt5-base'
  'qt5-charts'
)
makedepends=(
  'boost'
  'git'
  'libdrm'
  'libxnvctrl'
  'meson'
  'nvidia-utils'
  'python-hwdata'
  'qt5-tools'
)
optdepends=(
  'libdrm: AMD support'
  'libxnvctrl: NVIDIA support'
  'nvidia-utils: NVIDIA support'
  'python-hwdata: Prettier AMD GPU names'
)
source=("git+https://github.com/Lurkki14/tuxclocker.git#tag=$pkgver"
        'git+https://github.com/mpark/patterns.git'
        'git+https://github.com/Dobiasd/FunctionalPlus.git'
        "cstdint.patch"
        'gcc15.patch')
sha256sums=('36ea9d97009bf9890d3168c84a07fdd3262f9fa8c671fd48631ad37c9cd44d01'
            'SKIP'
            'SKIP'
            '9e0f528d7f24e501fa9586101231c7f85cf5fbb1709ff354b2abe8d422977d9f'
            '7f0355adcd3650e6fbec3757512297c08975bf8c12c80ee421a7053d58b75ec5')

prepare() {
  cd "$pkgname"
  git submodule init
  git config submodule.src/include/deps/patterns.url "$srcdir/patterns"
  git config submodule.src/include/deps/FunctionalPlus.url "$srcdir/FunctionalPlus"
  git -c protocol.file.allow=always submodule update

  # Add missing cstdint include
  patch -Np1 -i ../cstdint.patch

  # GCC 15
  # https://github.com/Lurkki14/tuxclocker/issues/106
  # https://github.com/Lurkki14/tuxclocker/pull/107
  patch -Np1 -i ../gcc15.patch
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
