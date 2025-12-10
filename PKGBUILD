# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>
# Contributor: Chip Collier <photex@gmail.com>
# Upstream: PreSonus Audio Electronics, Inc.

# Based on PKGBUILD for https://aur.archlinux.org/packages/bitwig-studio

pkgname='studio-one-7'
pkgver='7.2.3.108761'
pkgrel='4'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.presonus.com/'
license=('custom')
depends=('alsa-lib' 'wayland' 'sdbus-cpp1' 'gcc-libs' 'nss' 'glibc' 'glib2'
         'qt5-base' 'qt5-wayland' 'fontconfig' 'util-linux-libs' 'libunistring'
         'libsecret' 'libglvnd' 'libxkbcommon')
optdepends=('jack' 'vulkan-icd-loader' 'vulkan-driver' 'ffmpeg6.1' 'avahi' 'kwallet5')
provides=('clap-host' 'vst3-host')
options=(!strip)
DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download \"studioone7-x86_64.deb\" manually from https://my.presonus.com')
source=('manual://studioone7-x86_64.deb')
sha256sums=('c9cac512e5a75a584c4ac2a303510d964767f4ad310bac0ff863668bff538052')

package() {
  # Unpack package contents
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"

  # Fix permissions
  chmod -R g-w "${pkgdir}/opt"
  chmod -R g-w "${pkgdir}/usr"

  # Create our shared extensions location (based on deb pkg postinst script)
  mkdir -p "${pkgdir}/var/opt/PreSonus/Extensions"
  chmod 777 "${pkgdir}/var/opt/PreSonus"
  chmod 777 "${pkgdir}/var/opt/PreSonus/Extensions"

  # Install MIME type icons
  for icon in "${pkgdir}"/usr/share/icons/hicolor/scalable/mimetypes/studioone7/*; do
    iconname=$(basename "${icon}")
    ln -s -f "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/studioone7/${iconname}" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/${iconname}"
  done

  # Copy licenses to standard location
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/opt/PreSonus/Studio One 7/license/CCL 3rd Party Licenses.txt"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}"/opt/PreSonus/"Studio One 7"/license/EULA{,-de,-es,-fr,-it,-ja,-pt,-zh}.txt
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/opt/PreSonus/Studio One 7/license/PreSonus 3rd Party Licenses.txt"
}
