# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: sudopluto
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=miracle-wm
pkgver=0.10.1
pkgrel=1
pkgdesc="Wayland tiling window manager built on Mir"
arch=(x86_64)
url="https://github.com/miracle-wm-org/miracle-wm"
license=(GPL-3.0-only)
depends=(
    mir
    libnotify
    wasmedge
    gtk4
    gtk4-layer-shell
    )
makedepends=(
    git
    cmake
    nlohmann-json
    glm
    boost
    )
source=("git+https://github.com/miracle-wm-org/miracle-wm.git#tag=v${pkgver}"
        #0001-bugfix-only-install-libmirrenderer-dev-if-it-is-avai.patch
        #0002-task-remove-version-checks-in-order-to-assume-latest.patch
    )
sha256sums=('1f58059772a037adc1ce98b4c3c42a0eb1dd018bf8736d9c529fb9c57c352777')

prepare() {
  cd miracle-wm
  #patch -Np1 -i ../0001-bugfix-only-install-libmirrenderer-dev-if-it-is-avai.patch
  #patch -Np1 -i ../0002-task-remove-version-checks-in-order-to-assume-latest.patch
}

build() {
  local _flags=(
    -DSYSTEMD_INTEGRATION=ON
  )

  cmake -B build -S "miracle-wm" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
