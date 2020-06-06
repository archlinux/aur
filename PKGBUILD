# Maintainer: mateusz Gozdek <mgozdekof@gmail.com>
# Contributor: AwesomeHaircut <jesusbalbastro at gmail com>
# Contributor: Rein Fernhout <public@reinfernhout.xyz>
# Past Contributor: James An <james@jamesan.ca>

_pkgname=v4l2loopback-dc
pkgname=${_pkgname}-dkms
pkgver=1.3
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
        "${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip"
)

sha512sums=('27848dc6825c965c0aaac8e86220c3916ba20df6d941f5f05caecbf9c329ee744ee883bd2638ba58fe0dc3f40a8ae804dafbfbbe2efc23237e2b5450606cb78d'
            'c783b62c530c521aa7f047073efe74b57f28fbadbd097dca595fb582820566aedd03c6e92d2f24d9ff84dceed8ab51955ad77e80481ebfb6e30423425f8f2953')

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
