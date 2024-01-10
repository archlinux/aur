# Maintainer: CodeXYZ <jesusbalbastro@gmail.com>
# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <me@levitati.ng>
# Past Contributor: James An <james@jamesan.ca>

pkgbase=droidcam
pkgname=('droidcam' 'v4l2loopback-dc-dkms')
pkgver=2.1.2
pkgrel=1
epoch=1
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64')
url="https://github.com/dev47apps/${pkgbase}"
license=('GPL')
makedepends=('libappindicator-gtk3' 'gtk3' 'ffmpeg' 'libusbmuxd')

source=("${pkgbase}.desktop"
        "dkms.conf"
        "${pkgbase}.conf"
        "${pkgbase}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
)

sha256sums=('90dd73cf146fae0de0c11b46e97412d2aaca50ec879e1be2d793261e853dd0d3'
            '1e91f58ae83d433d32b483b14f1bb39cc245d2ace711b12c894de27dd2ea3413'
            '1d4b3ff98b4af9de77a24d1b6fad6e004deadf1f157eb800aa878ba1e7693dac'
            'c669ccac95a91b5a673eef6dfceb785658f337e69c2fe0f7b1d34c82ad00e04b')

prepare() {
  # Generate the module loading configuration files
  echo "options v4l2loopback_dc width=640 height=480" >| "${pkgbase}.modprobe.conf"
}

build() {
  cd ${pkgbase}-${pkgver}

  # All JPEG* parameters are needed to use shared version of libturbojpeg instead of
  # static one.
  #
  # Also libusbmuxd requires an override while linking.
  make JPEG_DIR="/usr/lib" JPEG_INCLUDE="/usr/include" JPEG_LIB="-lturbojpeg" USBMUXD=-lusbmuxd-2.0
}

package_droidcam() {
  depends=('alsa-lib' 'libjpeg-turbo' 'ffmpeg' 'v4l2loopback-dc-dkms' 'libusbmuxd')
  optdepends=('gtk3: use GUI version in addition to CLI interface' 'libappindicator-gtk3: use GUI version in addition to CLI interface')

  pushd ${pkgbase}-${pkgver}

  # Install droidcam program files
  install -Dm755 "${pkgbase}" "$pkgdir/usr/bin/${pkgbase}"
  install -Dm755 "${pkgbase}-cli" "$pkgdir/usr/bin/${pkgbase}-cli"
  install -Dm644 icon2.png "${pkgdir}/usr/share/pixmaps/${pkgbase}.png"
  install -Dm644 icon2.png "${pkgdir}/opt/droidcam-icon.png"
  install -Dm644 "${srcdir}/${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"
  install -Dm644 "${srcdir}/${pkgbase}.conf" "${pkgdir}/etc/modules-load.d/${pkgbase}.conf"
  install -Dm644 README.md "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

package_v4l2loopback-dc-dkms() {
  depends=('dkms')
  backup=("etc/modprobe.d/${pkgbase}.conf")

  _pkgname=v4l2loopback-dc
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" -e "s/@PKGVER@/${pkgver}/" -i "${install_dir}/dkms.conf"

  # Install module loading configuration
  install -Dm644 "${pkgbase}.modprobe.conf" "${pkgdir}/etc/modprobe.d/${pkgbase}.conf"

  # Install module source
  cd ${pkgbase}-${pkgver}/v4l2loopback

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/${d}"
  done

  for f in $(find . -type f ! -name '.gitignore'); do
    install -m644 "${f}" "${install_dir}/${f}"
  done
}
