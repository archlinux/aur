# Maintainer: mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: AwesomeHaircut <jesusbalbastro at gmail com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

_pkgname=v4l2loopback-dc
pkgname=${_pkgname}-dkms
pkgver=1.2
epoch=1
pkgrel=2
pkgdesc='A kernel module for droidcam'
arch=('x86_64')
url="https://github.com/aramg/droidcam"
license=('GPL')
depends=('dkms')
optdepends=('v4l-utils: Userspace tools and conversion library for Video 4 Linux')
backup=("etc/modprobe.d/${_pkgname}.conf")
source=("dkms.conf"
        "${pkgname}-${pkgver}.zip::${url}/archive/${pkgver}.zip"
)

sha512sums=('27848dc6825c965c0aaac8e86220c3916ba20df6d941f5f05caecbf9c329ee744ee883bd2638ba58fe0dc3f40a8ae804dafbfbbe2efc23237e2b5450606cb78d'
            '8aba2c9371bb8ad793ad3495c00f5331be7a3f45b0edc7f49067716df9666d585331a289ad2920fb8a024bc4d4738fcf2dff1f9e121c5f8ef825a4c53420d623')

prepare() {
  # Generate the module loading configuration files
  echo "options v4l2loopback_dc width=640 height=480" >| "${_pkgname}.modprobe.conf"
}

package() {
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Copy dkms.conf
  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" -e "s/@PKGVER@/${pkgver}/" -i "${install_dir}/dkms.conf"

  # Install module loading configuration
  install -Dm644 "${_pkgname}.modprobe.conf" "$pkgdir/etc/modprobe.d/${_pkgname}.conf"

  # Install module source
  cd droidcam-${pkgver}/linux/v4l2loopback

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f ! -name '.gitignore'); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
