# Maintainer: ralgar (me@ralgar.dev)
pkgname='lib32-vkshade'
pkgver=0.1.0
pkgrel=1
pkgdesc='A ReShade-compatible Vulkan post-processing layer'
arch=('x86_64')
url='https://github.com/ralgar/vkShade'
license=('BSD-2-Clause')
depends=('lib32-libx11' 'lib32-libxcb' 'lib32-libxi' 'lib32-libxkbcommon' 'lib32-wayland')
makedepends=('git' 'meson' 'ninja' 'vulkan-headers' 'lib32-vulkan-utility-libraries')
optdepends=('reshade-shaders-git')
source=("vkshade-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('afbd489aafa4ea432094e0421899ec2ade1257de5de1f19d4594f0487dabeccc')

prepare() {
  cd ${srcdir}/vkShade-${pkgver}
  ASFLAGS=--32 CFLAGS=-m32 CXXFLAGS=-m32 PKG_CONFIG_PATH=/usr/lib32/pkgconfig \
	meson setup --prefix=/usr --buildtype=release --libdir=lib32 \
	--force-fallback-for=inih,spdlog build
}

build() {
  cd ${srcdir}/vkShade-${pkgver}
  ninja -C build
}

package() {
  cd ${srcdir}/vkShade-${pkgver}

  DESTDIR="${pkgdir}" meson install -C build --skip-subprojects
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Remove the default config files (should be provided by 64-bit package)
  rm "${pkgdir}/usr/share/vkShade/vkShade.ini"
  rm "${pkgdir}/usr/share/vkShade/ReShade.ini"
}
