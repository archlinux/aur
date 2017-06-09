pkgname=renderdoc
pkgver=0.34
pkgrel=3
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
makedepends=("cmake")
depends=("libx11" "libxcb" "mesa" "libgl" "qt5-base" "qt5-svg" "qt5-x11extras" "xcb-util-keysyms")
source=("https://github.com/baldurk/renderdoc/archive/v${pkgver}.tar.gz"
        "0001-Avoid-calling-XOpenDisplay-multiple-times-fixes-cras.patch")
sha384sums=("1e507108fd1b4bcbf1161a66095ffa19a38a099fc301fd5ed206769f7609c4da4b45522dd63ad7825bfd523b7c35442a"
            "4113c5bf7293e9fdc1cf140a79620a53ee1a7d08b9ba932088a5c2112d43cddd4425a6bbc134409eb8e2969e68c86c19")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/0001-Avoid-calling-XOpenDisplay-multiple-times-fixes-cras.patch"
}

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_VERSION_STABLE=ON \
        -DBUILD_VERSION_DIST_CONTACT="https://aur.archlinux.org/packages/renderdoc" \
        -DBUILD_VERSION_DIST_NAME="Arch" \
        -DBUILD_VERSION_DIST_VER="${pkgver}" \
        -B"${srcdir}/${pkgname}-${pkgver}"/build \
        -H"${srcdir}/${pkgname}-${pkgver}"
  cmake --build "${srcdir}/${pkgname}-${pkgver}"/build
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/${pkgname}-${pkgver}"/build install
}

# vim:set ts=2 sw=2 et:
