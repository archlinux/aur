# Maintainer: lod <aur@cyber-anlage.de> 
pkgname=vulkan-amdgpu-pro
pkgver=19.10_785425
pkgver_=${pkgver//_/-}-ubuntu-18.04
pkgrel=1
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
provides=('vulkan-driver')
depends=('vulkan-icd-loader')
conflicts=('amdvlk-git' 'amdvlk-deb' 'amdvlk' 'amdgpu-pro-vulkan')
makedepends=('wget')

DLAGENTS='https::/usr/bin/wget --referer https://support.amd.com/en-us/kb-articles/Pages/AMDGPU-PRO-Install.aspx -N %u'

source=(https://drivers.amd.com/drivers/linux/amdgpu-pro-${pkgver_}.tar.xz)
sha256sums=('a0bd71417d0c0ddd404be8c86653135c4e0190a54bb8dc62eef231d5275f37bd')

build() {
  cd $srcdir
  ar -x ${startdir}/src/amdgpu-pro-${pkgver_}/vulkan-amdgpu-pro_${pkgver//_/-}_amd64.deb
  tar -xJf ${startdir}/src/data.tar.xz
}

package() {
  install -m755 -d "${pkgdir}"/usr/lib
  install -m755 -d "${pkgdir}"/usr/share/vulkan/icd.d
  install -m755 -d "${pkgdir}"/usr/share/licenses/vulkan-amdgpu-pro

  install opt/amdgpu-pro/lib/x86_64-linux-gnu/amdvlk64.so "${pkgdir}"/usr/lib/
  install opt/amdgpu-pro/etc/vulkan/icd.d/amd_icd64.json "${pkgdir}"/usr/share/vulkan/icd.d/
  install usr/share/doc/vulkan-amdgpu-pro/copyright "${pkgdir}"/usr/share/licenses/vulkan-amdgpu-pro/

  sed -i "s/\/opt\/amdgpu-pro\/lib\/x86_64-linux-gnu/\/usr\/lib/g" "${pkgdir}"/usr/share/vulkan/icd.d/amd_icd64.json
}
