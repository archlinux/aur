# Maintainer: Yegor Pomortsev <yegor@pomortsev.com>
# Contributor: Chip Collier <photex@gmail.com>
# Upstream: Fender Musical Instruments Corporation

pkgname='fender-studio-pro-8'
pkgver='8.1.0.112630'
pkgrel='1'
pkgdesc='Digital audio workstation (DAW), used to create, record, mix and master music'
arch=('x86_64')
url='https://www.fender.com/redirects/studiopro_product_page'
license=('custom')
depends=('alsa-lib' 'wayland' 'sdbus-cpp1' 'gcc-libs' 'nss' 'glibc' 'glib2'
         'qt5-base' 'qt5-wayland' 'fontconfig' 'util-linux-libs' 'libunistring'
         'libsecret' 'libglvnd' 'libxkbcommon')
optdepends=('jack' 'vulkan-icd-loader' 'vulkan-driver' 'ffmpeg6.1' 'avahi' 'kwallet5')
provides=('clap-host' 'vst3-host')
conflicts=('studio-one-7')
options=(!strip)
# Note: Please download "Installer for Linux (deb)" (studiopro8-x86_64.deb) manually from https://my.fender.com/products/detail/1781
source=("studiopro8-x86_64.deb::local://studiopro8-x86_64.deb")
sha256sums=('35c23cdb20150bc21bc1637a051935fb72f0faeb0ca003baa50691bd490df697')

package() {
  # Unpack package contents
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"

  # Fix permissions
  chmod -R g-w "${pkgdir}/opt"
  chmod -R g-w "${pkgdir}/usr"

  # Create our shared extensions location (based on deb pkg postinst script)
  mkdir -p "${pkgdir}/var/opt/Fender/Extensions"
  chmod 777 "${pkgdir}/var/opt/Fender"
  chmod 777 "${pkgdir}/var/opt/Fender/Extensions"

  # Install MIME type icons
  for icon in "${pkgdir}"/usr/share/icons/hicolor/scalable/mimetypes/studioapp8/*; do
    iconname=$(basename "${icon}")
    ln -s -f "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/studioapp8/${iconname}" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/${iconname}"
  done

  # Copy licenses to standard location
  install -d -m755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/opt/Fender/Studio Pro 8/license/CCL 3rd Party Licenses.txt"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}"/opt/Fender/"Studio Pro 8"/license/EULA{,-de,-es,-fr,-it,-ja,-pt,-zh}.txt
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgdir}/opt/Fender/Studio Pro 8/license/FMIC 3rd Party Licenses.txt"
}
