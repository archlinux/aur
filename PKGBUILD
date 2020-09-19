# Maintainer: AwesomeHaircut <jesusbalbastro at gmail com>
# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

pkgbase=droidcam
pkgname=('droidcam' 'v4l2loopback-dc-dkms')
pkgver=1.4
pkgrel=3
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
        "0001-Makefile-allow-to-modify-how-to-link-to-libusbmuxd.patch"
)

sha512sums=('72d21aa2d7eecc9bb070aaf7059a671246feb22f9c39b934a5463a4839f9347050de00754e5031dbc44f78eb2731f58f0cd2fcf781bc241f6fbd1abb4308b7ee'
            '27848dc6825c965c0aaac8e86220c3916ba20df6d941f5f05caecbf9c329ee744ee883bd2638ba58fe0dc3f40a8ae804dafbfbbe2efc23237e2b5450606cb78d'
            'ea457b46a2fc9f1a3ea8e99f2cd0771a587cff89f42335fdaf55988dda0376a1fea73b660174c9f1906a304bace68bffec30b70b20dafc05ebae8854d9aadb13'
            '3168d76d5d6f8b5a0f66858a40ac2ab6fb3b9e0db3ffdcab405367541569da6f4475b7893bb90b8dbd0478876678bc138afe9d472765c422e3300426215a5456'
            'ee56372bd0f63c4b89ba860c7d6df3d8f7a4de19e72258425b008e405d32e3efc3695c6eca6a8f1b8b4822e0ac8515e8ec504f55f6257a0453b0cb08ba33a582')

prepare() {
  # Generate the module loading configuration files
  echo "options v4l2loopback_dc width=640 height=480" >| "${pkgbase}.modprobe.conf"

  # Apply patches.
  cd "${pkgname}-${pkgver}"
  patch -p0 --input="${srcdir}/0001-Makefile-allow-to-modify-how-to-link-to-libusbmuxd.patch"

  # Ensure that 'install' script from repository does not collide with install binary used for
  # building the package.
  chmod -x ./linux/install
}

build() {
  cd ${pkgbase}-${pkgver}/linux

  # All JPEG* parameters are needed to use shared version of libturbojpeg instead of
  # static one.
  #
  # Also libusbmuxd requires an override while linking.
  make JPEG_DIR="" JPEG_INCLUDE="" JPEG_LIB="" JPEG=$(pkg-config --libs --cflags libturbojpeg) USBMUXD=-lusbmuxd-2.0
}

package_droidcam() {
  depends=('alsa-lib' 'libjpeg-turbo' 'ffmpeg' 'v4l2loopback-dc-dkms' 'libusbmuxd')
  optdepends=('gtk3: use GUI version in addition to CLI interface' )

  pushd ${pkgbase}-${pkgver}/linux

  # Install droidcam program files
  install -Dm755 "${pkgbase}" "$pkgdir/usr/bin/${pkgbase}"
  install -Dm755 "${pkgbase}-cli" "$pkgdir/usr/bin/${pkgbase}-cli"
  install -Dm644 icon2.png "$pkgdir/usr/share/pixmaps/${pkgbase}.png"
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
  cd ${pkgbase}-${pkgver}/linux/v4l2loopback

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f ! -name '.gitignore'); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
