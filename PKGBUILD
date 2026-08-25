# Maintainer: xpufx <github@xpufx.com>
#
# ToobAmp only ships .deb packages; this PKGBUILD repacks the upstream
# amd64 deb into an Arch package. Pure file drop: the deb has no
# maintainer scripts, and the package runs nothing at install time.
# See README.md (maintainer notes).

pkgname=toobamp-bin
pkgver=1.2.77
pkgrel=1
pkgdesc="TooB LV2 guitar effects plugins: amp/cab models and effects (binary repack)"
arch=('x86_64')
url="https://github.com/rerdavies/ToobAmp"
license=('MIT' 'MPL-2.0')
depends=(
  'cairo'
  'gcc-libs'
  'glib2'
  'glibc'
  'libx11'
  'libxrandr'
  'pango'
  'librsvg'
)
makedepends=('binutils')
source=("https://github.com/rerdavies/ToobAmp/releases/download/v${pkgver}/toobamp_${pkgver}_amd64.deb")
sha256sums=('0c63281de6cf8dd4c5bd11a3634a54f4ba7d1be4573c6f68ede8822edc24f469')

package() {
  cd "${srcdir}"

  # Unpack the deb's data payload. `ar` (binutils) splits the deb into
  # debian-binary, control.tar.gz and data.tar.gz; the data payload maps
  # onto the Arch FHS (usr/).
  ar x "toobamp_${pkgver}_amd64.deb"
  tar -xf data.tar.gz -C "${pkgdir}"

  # Drop the stray empty usr/local directory the deb ships.
  rmdir "${pkgdir}"/usr/local 2>/dev/null || true

  # Normalize directory permissions: the deb ships dirs at 775, Arch
  # convention is 755.
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # Licenses: main code is MIT, the ToobML part is MPL-2.0, and the
  # impulse responses are CC-BY-4.0 (their license texts travel inside
  # the bundle). The deb's copyright file documents all components.
  install -Dm644 "${pkgdir}/usr/share/doc/toobamp/copyright" \
    "${pkgdir}/usr/share/licenses/toobamp-bin/LICENSE"
  install -Dm644 "${pkgdir}/usr/lib/lv2/ToobAmp.lv2/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/toobamp-bin/LICENSE.md"
  install -Dm644 "${pkgdir}/usr/lib/lv2/ToobAmp.lv2/MPL-2.0.md" \
    "${pkgdir}/usr/share/licenses/toobamp-bin/MPL-2.0.md"
}
