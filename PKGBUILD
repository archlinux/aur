# Maintainer: Can Celasun <can[at]dcc[dot]im>

pkgname=basemark
pkgver=1.0.2
pkgrel=1
pkgdesc="Basemark GPU - Graphics performance evaluation tool"
arch=('x86_64')
url="https://www.basemark.com/products/basemark-gpu/"
license=('custom')
depends=("libxinerama" "libxi" "xdg-utils" "hicolor-icon-theme" "freetype2" "libgl" "libxrandr" "libxcursor")
optdepends=("vulkan-icd-loader")
source=(http://downloads.basemark.com/BasemarkGPUFree_${pkgver}.deb)
sha256sums=('06e30c8083b5d16f5c2038cf530a87cd246bb85b156868cfca9f07bc1dff3a91')

package() {
  cd "${srcdir}"
  tar -xzf data.tar.gz -C "${pkgdir}"

  # Name cleanup
  mv "${pkgdir}"/opt/{BasemarkGPU,${pkgname}}
  mv "${pkgdir}"/usr/share/applications/{BasemarkGPU,${pkgname}}.desktop
  sed -i 's|/BasemarkGPU/|/basemark/|' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i 's|/basemarkgpu/|/basemark/|' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  find "${pkgdir}" -type d -exec chmod 0755 {} \;
  find "${pkgdir}" -type f -exec chmod 0644 {} \;
  find "${pkgdir}/usr/share/icons" -name "basemarkgpu.png" -exec mv {} basemark.png \;

  chmod +x "${pkgdir}/opt/${pkgname}/BasemarkGPULauncher"
  install -m644 -D "${pkgdir}/opt/${pkgname}/EULA.txt/EULA_Free.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/BasemarkGPULauncher "${pkgdir}/usr/bin/${pkgname}"
}
