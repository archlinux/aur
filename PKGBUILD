# Maintainer: screwy <screwygit@proton.me>
# Maintainer: Seppia <$(base64 -d <<< 'YXJjaGxpbnV4QHNlcHBpYS5uZXQK')>
# shellcheck shell=bash disable=SC2034

_reponame="Rufin"
pkgname=rufin
pkgver=0.17.0
pkgrel=1
pkgdesc='Native music player for Jellyfin, Navidrome/OpenSubsonic, Plex, and Emby servers;  local folders,  WebDAV including a direct Nextcloud browser login path, Samba and NAS shares.'
arch=('x86_64' 'aarch64')
url='https://github.com/screwys/Rufin'
license=('GPL-3.0-or-later')
depends=(
  'libgcc_s.so'
  'glib2'
  'glibc'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
)
makedepends=(
  'cargo'
  'cmake'
  'gettext'
  'git'
  'ninja'
  'pkgconf'
)
provides=('rufin')
options=('!lto')
source=("https://github.com/screwys/${_reponame}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4326f8555cdd0109f47400be2825dfe5a7d5fd9c75be70e7b551bac80c67a5d0')

prepare() {
  cd ${_reponame}-${pkgver}

  export CARGO_TARGET_DIR=target
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd ${_reponame}-${pkgver}

  export CARGO_TARGET_DIR=target
  cmake \
    -S . \
    -B build-cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRUFIN_BUILD_IDENTITY=stable \
    -DRUFIN_CARGO_FROZEN=ON
  cmake --build build-cmake --target rufin
}

package() {
  cd ${_reponame}-${pkgver}

  DESTDIR="$pkgdir" cmake --install build-cmake
}
