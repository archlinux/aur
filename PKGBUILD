# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appmanager
_app_id=com.github.AppManager
pkgver=3.5.1
pkgrel=1
pkgdesc="MacOS style AppImage installer and management application"
arch=('x86_64')
url="https://github.com/kem-a/AppManager"
license=('GPL-3.0-or-later')
depends=(
  'fuse2'
  'dwarfs'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libgee'
  'libsoup3'
  'squashfs-tools'
  'zsync2'
)
makedepends=(
  'meson'
  'vala'
)
optdepends=('appimage-thumbnailer: generate thumbnails for AppImages')
source=("AppManager-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('627a823abf98023b331080aa2691a605db8bc2b4e95431d6b1e2beb5f092096e')

build() {
  arch-meson "AppManager-$pkgver" build \
    -Dbundle_dwarfs=false \
    -Dbundle_zsync=false \
    -Dbundle_unsquashfs=false
  meson compile -C build
}

check() {
  appstreamcli validate --no-net "AppManager-$pkgver/data/${_app_id}.metainfo.xml" || :
  desktop-file-validate "build/data/${_app_id}.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # Remove compiled schemas
  rm -v "$pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled"
}
