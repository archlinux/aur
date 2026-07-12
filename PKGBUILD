# Maintainer: FrankGeary contributors
#
# Source AUR package for FrankGeary. This project currently builds an older
# Geary-derived codebase and still depends on legacy libraries such as
# WebKitGTK 2.4 / webkitgtk-3.0 and GMime 2.6. Those dependencies may be absent
# or unsafe on modern Arch systems; keep this package best-effort until the
# native feature lane rebases the application onto maintained dependencies.
#
# Prefer binary compatibility providers when they exist. At the time this was
# written, no AUR `-bin` providers were available for webkitgtk3, gmime-2.6, or
# enchant-1; the dependency names below are virtual/compatibility targets so a
# future `*-bin` package can satisfy them through `provides=...`.

pkgname=frank-geary
pkgver=0.11.2_frank.1
pkgrel=1
pkgdesc='FrankGeary email client, a Geary fork with focused fixes'
arch=('x86_64')
url='https://github.com/akitaonrails/FrankGeary'
license=('LGPL2.1')
depends=(
  'desktop-file-utils'
  # Compatibility package must provide pkg-config module enchant>=1.6.
  'enchant-1'
  'gcr'
  'gobject-introspection-runtime'
  'gtk3'
  'libcanberra'
  'libgee'
  'libnotify'
  'libsecret'
  'libxml2'
  'libsoup'
  'sqlite'
  # Legacy compatibility providers. The existing AUR `webkitgtk` source package
  # provides webkitgtk3; use webkitgtk3 here so a future webkitgtk-bin provider
  # can satisfy the dependency without editing FrankGeary.
  'gmime-2.6'
  'webkitgtk3'
)
makedepends=(
  'cmake'
  'gobject-introspection'
  'intltool'
  'vala'
)
optdepends=(
  'libmessaging-menu: legacy Unity messaging menu integration, if available'
  'libunity: legacy Unity launcher integration, if available'
)
provides=('geary')
conflicts=('geary')
_tag='v0.11.2-frank.1'
_srcdir='FrankGeary-0.11.2-frank.1'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('0299c2dc950dfc5e0b6769fc820b75e4888f4c13c0f854a8d2d48ecbd62f5c0f')

build() {
  cd "${_srcdir}"
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DNO_FATAL_WARNINGS=ON \
    -DGSETTINGS_COMPILE=OFF \
    -DGSETTINGS_COMPILE_IN_PLACE=OFF \
    -DDESKTOP_UPDATE=OFF \
    -DICON_UPDATE=OFF \
    -DTRANSLATE_HELP=OFF \
    -DDISABLE_CONTRACT=ON
  cmake --build build
}

package() {
  cd "${_srcdir}"
  DESTDIR="${pkgdir}" cmake --install build
}
