# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>
# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

pkgname=droidcam
pkgver=1.3
pkgrel=1
epoch=1
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64')
url="https://github.com/aramg/${pkgname}"
license=('GPL')
depends=('v4l2loopback-dc-dkms' 'alsa-lib' 'libjpeg-turbo' 'ffmpeg')
makedepends=('gtk3')
optdepends=('gtk3: use GUI version in addition to CLI interface' )

source=("${pkgname}.desktop"
        "${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip"
        "${pkgname}.conf"
)

sha512sums=('72d21aa2d7eecc9bb070aaf7059a671246feb22f9c39b934a5463a4839f9347050de00754e5031dbc44f78eb2731f58f0cd2fcf781bc241f6fbd1abb4308b7ee'
            'c783b62c530c521aa7f047073efe74b57f28fbadbd097dca595fb582820566aedd03c6e92d2f24d9ff84dceed8ab51955ad77e80481ebfb6e30423425f8f2953'
            'ea457b46a2fc9f1a3ea8e99f2cd0771a587cff89f42335fdaf55988dda0376a1fea73b660174c9f1906a304bace68bffec30b70b20dafc05ebae8854d9aadb13')

build() {
  cd ${pkgname}-${pkgver}/linux

  # All JPEG* parameters are needed to use shared version of libturbojpeg instead of
  # static one.
  make JPEG_DIR="" JPEG_INCLUDE="" JPEG_LIB="" JPEG=$(pkg-config --libs --cflags libturbojpeg)
}

package() {
  pushd ${pkgname}-${pkgver}/linux

  # Install droidcam program files
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}-cli" "${pkgdir}/usr/bin/${pkgname}-cli"
  install -Dm644 icon2.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "../../${pkgname}.conf" "${pkgdir}/etc/modules-load.d/droidcam.conf"
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
