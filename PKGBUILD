# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: sudopluto
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=miracle-wm
pkgver=0.11.1
pkgrel=1
pkgdesc="Wayland tiling window manager built on Mir"
arch=(x86_64)
url="https://github.com/miracle-wm-org/miracle-wm"
license=(GPL-3.0-only)
depends=(
    cairo
    glib2
    glibc
    gtk4
    gtk4-layer-shell
    json-c
    libgcc
    libglvnd
    libnotify
    libstdc++
    libxkbcommon
    mir
    pcre2
    python
    sh
    wasmedge
    wayland
    yaml-cpp
    )
makedepends=(
    boost
    cmake
    git
    glm
    nlohmann-json
    )
source=("git+https://github.com/miracle-wm-org/miracle-wm.git#tag=v${pkgver}"
        #0001-bugfix-only-install-libmirrenderer-dev-if-it-is-avai.patch
        #0002-task-remove-version-checks-in-order-to-assume-latest.patch
    )
sha256sums=('7a09cbf7c426c9e0b41ce29eef6775509ee8a926658c77fdc2e39dcc5fc67aa0')

prepare() {
  cd miracle-wm
  #patch -Np1 -i ../0001-bugfix-only-install-libmirrenderer-dev-if-it-is-avai.patch
  #patch -Np1 -i ../0002-task-remove-version-checks-in-order-to-assume-latest.patch
}

build() {
  local _flags=(
    -DSYSTEMD_INTEGRATION=ON
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/miracle-wm/
  )

  cmake -B build -S "miracle-wm" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
