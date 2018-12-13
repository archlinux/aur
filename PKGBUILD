# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc-git
pkgver=1.2+59.g006bf38e79
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
depends=("libx11" "libxcb" "mesa" "libgl" "qt5-base" "qt5-svg" "qt5-x11extras" "xcb-util-keysyms")
source=("git+https://github.com/baldurk/renderdoc#branch=v1.x"
        "renderdoc.desktop")
sha256sums=('SKIP'
            'eab4941dc17fbbdcb9e34a698c3b304d212be54956daeb0c3b1cf5b7f2b00984')
conflicts=('renderdoc')
provides=('renderdoc')

pkgver() {
  cd "${srcdir}"/renderdoc
  git describe --always --abbrev=10 HEAD |
    sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_VERSION_STABLE=ON \
        -DBUILD_VERSION_DIST_CONTACT="https://aur.archlinux.org/packages/renderdoc-git" \
        -DBUILD_VERSION_DIST_NAME="Arch" \
        -DBUILD_VERSION_DIST_VER="$(pkgver)" \
        -B"${srcdir}/renderdoc"/build \
        -H"${srcdir}/renderdoc"
  cmake --build "${srcdir}/renderdoc"/build
}

package() {
  make DESTDIR="${pkgdir}" -C "${srcdir}/renderdoc"/build install

  install -Dm644 "${srcdir}"/renderdoc.desktop "$pkgdir/usr/share/applications/renderdoc.desktop"
  install -Dm644 "${srcdir}"/renderdoc/docs/imgs/logo.png "$pkgdir/usr/share/icons/renderdoc.png"
}
