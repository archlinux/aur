# Maintainer: Adam Cihelka <haziness_droop794@slmail.me>
# Contributor: Kowabunga
# Contributor: yochananmarqos
# Contributor: bpierre
# Contributor: PedroHLC
# Contributor: rodrigo21

pkgname='vkpost'
pkgver=0.4.6
pkgrel=2
pkgdesc='A Vulkan Post Processing Layer For Linux. A maintained fork of vkBasalt.'
arch=('x86_64')
url='https://github.com/KowabungaOfficial/vkPost'
license=('Zlib')
depends=('glibc' 'gcc-libs' 'libx11' 'wayland' 'libxkbcommon')
makedepends=('glslang' 'meson' 'ninja' 'spirv-headers' 'vulkan-headers')
optdepends=('reshade-shaders-git: collection of shaders to use with vkPost')
source=("${url}/releases/download/v${pkgver}/vkPost-${pkgver}.tar.gz")
sha256sums=('827964fa67bcad0973f5245f1e2453aea0cbb104608e1fabbbb3b1cd55fffd14')

prepare() {
  cd "${srcdir}/vkPost-${pkgver}"
  sed -i 's|/path/to/reshade-shaders/Textures|/opt/reshade/textures|g' \
    "config/vkPost.conf"
  sed -i 's|/path/to/reshade-shaders/Shaders|/opt/reshade/shaders|g' \
    "config/vkPost.conf"
}

build() {
  cd "${srcdir}/vkPost-${pkgver}"

  arch-meson \
    --buildtype=release \
    build
  ninja -C build
}

package() {
  cd "${srcdir}/vkPost-${pkgver}"

  DESTDIR="${pkgdir}" ninja -C build install
  mv "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkPost.json" "${pkgdir}/usr/share/vulkan/implicit_layer.d/vkPost.x86_64.json"
  install -Dm 644 config/vkPost.conf "${pkgdir}/usr/share/vkPost/vkPost.conf.example"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

	echo
	echo "#####################################################################################"
	echo "#                                                                                   #"
  echo "#     A sample config is included at /usr/share/vkPost/vkPost.conf.example          #"
  echo "#     Please copy it over to ~/.config/vkPost/vkPost.conf to have vkPost use it     #"
	echo "#                                                                                   #"
	echo "#####################################################################################"
	echo
}
