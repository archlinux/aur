# Maintainer: andykluger
# Contributor: robertfoster
# Contributor: FabioLolix

_parentname=gst-plugins-rs
_pkgname=gst-plugin-spotify

pkgname="${_pkgname}-kingosticks"
pkgver=0.15.0_alpha.1_4
pkgrel=1
pkgdesc="GStreamer Spotify plugin, for use with mopidy-spotify"
arch=("x86_64")
url="https://gstreamer.freedesktop.org/"
license=('MIT' 'Apache-2.0' 'MPL-2.0')
depends=('gstreamer' 'gcc-libs' 'glibc' 'glib2')
provides=("${_parentname}" "${_pkgname}")  # _parentname here just to satisfy mopidy-spotify-git for now
conflicts=("${_parentname}" "${_parentname}-git" "${_pkgname}")
makedepends=('git' 'rust')
options=(!lto)
source=("${_parentname}::git+https://gitlab.freedesktop.org/kingosticks/${_parentname}.git#tag=${_pkgname}_${pkgver//_/-}")
sha256sums=('692d8f9e4610e1f0e35f2ffd17440a92c656723db1a5284212a67560a25a6072')

build() {
  cd "${_parentname}"
  cargo build --package "${_pkgname}" --release
}

package() {
  install -D "${_parentname}/target/release/libgstspotify.so" -t "${pkgdir}/usr/lib/gstreamer-1.0"
  install -D "${_parentname}"/LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  for fname in LICENSE-*; do
    mv "$fname" "${fname#*-}"
  done
}

