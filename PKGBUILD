# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>
# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

pkgbase=droidcam
pkgname=('droidcam' 'v4l2loopback-dc-dkms')
pkgver=1.7.1
pkgrel=1
epoch=1
pkgdesc='A tool for using your android device as a wireless/usb webcam'
arch=('x86_64')
url="https://github.com/aramg/${pkgbase}"
license=('GPL')
backup=("etc/modprobe.d/${pkgbase}.conf")
makedepends=('gtk3' 'ffmpeg' 'libusbmuxd')

source=("${pkgbase}.desktop"
        "dkms.conf"
        "${pkgbase}.conf"
        "${pkgbase}-${pkgver}.zip::${url}/archive/v${pkgver}.zip"
)

sha512sums=('72d21aa2d7eecc9bb070aaf7059a671246feb22f9c39b934a5463a4839f9347050de00754e5031dbc44f78eb2731f58f0cd2fcf781bc241f6fbd1abb4308b7ee'
            '27848dc6825c965c0aaac8e86220c3916ba20df6d941f5f05caecbf9c329ee744ee883bd2638ba58fe0dc3f40a8ae804dafbfbbe2efc23237e2b5450606cb78d'
            '74415b349bf8b2d1bb8181906f4254416d6223c5c42951185051bf3dd3e2f780db3441078ebff4a670eb0ffc76cc08f3b36851e0824c55a7f70136ce4d0240bc'
            '5ed727de03c875e7f0c9f24eab603c32f3b99be906c46108dd66be4d38dc3e7029c02a4f7ee82e1fd1c5cfc1f60cf351a9bac25ba3d5150a28c632f25cf5f70a')

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
  make JPEG_DIR="" JPEG_INCLUDE="" JPEG_LIB="" JPEG=$(pkg-config --libs --cflags libturbojpeg) USBMUXD=-lusbmuxd-2.0
}

package_droidcam() {
  depends=('alsa-lib' 'libjpeg-turbo' 'ffmpeg' 'v4l2loopback-dc-dkms' 'libusbmuxd')
  optdepends=('gtk3: use GUI version in addition to CLI interface')

  pushd ${pkgbase}-${pkgver}

  # Install droidcam program files
  install -Dm755 "${pkgbase}" "$pkgdir/usr/bin/${pkgbase}"
  install -Dm755 "${pkgbase}-cli" "$pkgdir/usr/bin/${pkgbase}-cli"
  install -Dm644 icon2.png "$pkgdir/usr/share/pixmaps/${pkgbase}.png"
  install -Dm644 icon2.png "${pkgdir}/opt/droidcam-icon.png"
  install -Dm644 "../../${pkgbase}.desktop" "$pkgdir/usr/share/applications/${pkgbase}.desktop"
  install -Dm644 "../../${pkgbase}.conf" "${pkgdir}/etc/modules-load.d/${pkgbase}.conf"
  install -Dm644 README.md "$pkgdir/usr/share/licenses/${pkgbase}/LICENSE"
}

package_v4l2loopback-dc-dkms() {
  depends=('dkms')
  _pkgname=v4l2loopback-dc
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" -e "s/@PKGVER@/${pkgver}/" -i "${install_dir}/dkms.conf"

  # Install module loading configuration
  install -Dm644 "${pkgbase}.modprobe.conf" "$pkgdir/etc/modprobe.d/${pkgbase}.conf"

  # Install module source
  cd ${pkgbase}-${pkgver}/v4l2loopback

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f ! -name '.gitignore'); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
