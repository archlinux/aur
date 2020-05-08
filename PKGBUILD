# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=yafaray-blender-exporter
pkgver=3.4.2
_blenderver=2.79
pkgrel=1
pkgdesc="YafaRay's Blender Exporter"
arch=('any')
url="http://yafaray.org/"
license=('GPL2')
depends=('blender' 'yafaray')
source=("https://github.com/YafaRay/Blender-Exporter/archive/v${pkgver}.tar.gz"
        "paths.patch")
sha512sums=('d4d65cc8e403da1139767cb5c5d5caf551a7d634e1e6798bbf2cfcfaac080a0debabba6c109dd2c9dceeefb50c1c95498a3197ed58654c391413e131c801b88f'
            '76bb781e5b63245c4b8b324fc5f21adba7ebf478358d4d274dd903722789009de7727ad122a208feac8bfafa87208f36e49706ba7b48d14def8f4c4443c2cfd0')

prepare() {
  cd "${srcdir}/Blender-Exporter-${pkgver}"

  patch -Np1 < "${srcdir}/paths.patch"
}

package() {
  cd "${srcdir}/Blender-Exporter-${pkgver}"

  sed -i "s/@YAFARAY_BLENDER_EXPORTER_VERSION@/v${pkgver}/" __init__.py

  install -dm755 "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons"
  cp -a . "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3"
  rm "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3/.gitignore"
  install -dm755 "${pkgdir}/usr/share/yafaray-blender-exporter"
  mv "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3/tests" \
    "${pkgdir}/usr/share/yafaray-blender-exporter"
  install -dm755 "${pkgdir}/usr/share/doc/yafaray-blender-exporter"
  for _file in CHANGELOG INSTALL LICENSES README; do
    mv "${pkgdir}/usr/share/blender/${_blenderver}/scripts/addons/yafaray_v3/${_file}" "${pkgdir}/usr/share/doc/yafaray-blender-exporter/"
  done
}
