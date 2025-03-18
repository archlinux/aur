# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=web-archives
_app_id=com.github.birros.WebArchives
pkgver=0.5.0
pkgrel=1
_dr_ver=0.0.1
pkgdesc="A web archives reader"
arch=('x86_64')
url="https://github.com/birros/web-archives"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libhandy'
  'libisocodes'
  'libsoup3'
  'libzim-glib'
  'sqlite'
  'tinysparql'
  'webkit2gtk-4.1'
)
makedepends=(
  'meson'
  'vala'
)
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/birros/web-archives-darkreader/releases/download/v${_dr_ver}/web-archives-darkreader_v${_dr_ver}.js"
        'fix-appstream-validation-errors.patch')
sha256sums=('10bdaf25633d9b23385c31000a5dce02146da5d2daf73b13a03881b1ecaf77f5'
            '8ee840aacd9e09864a7ab2e75f736f696dcd4b4b8e86a07ba727ff3d10ef32a1'
            'bb4bbec3852b373939ed21c26c14b98b015a8038597c5bd95c47078648f9d88c')

prepare() {
  cd "$pkgname-$pkgver"

  # Copy darkreader script to build-aux directory
  cp -f "$srcdir/web-archives-darkreader_v${_dr_ver}.js" build-aux/darkreader

  # Don't download darkreader script
  sed -i '/curl -L/d' build-aux/darkreader/Makefile

  # Fixed upstream
  patch -Np1 -i "$srcdir/fix-appstream-validation-errors.patch"
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  appstreamcli validate --no-net "build/data/appdata/${_app_id}.appdata.xml"
  desktop-file-validate "build/data/desktop/${_app_id}.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
