#Maintainer: archdevlab <https://github.com/archdevlab>

pkgname=lib32-vkd3d-proton-git
pkgdesc='D3D12 to Vulkan translation library (32-bit) (git version)'
pkgver=2.13.r48.gebe7279
pkgrel=1
arch=(i686 x86_64)
url='https://source.winehq.org/git/vkd3d.git'
license=(LGPL)
depends=(lib32-spirv-tools lib32-vulkan-icd-loader)
makedepends=(meson glslang wine xcb-util-keysyms lib32-xcb-util-keysyms xorgproto git)
conflicts=(lib32-vkd3d-proton)
provides=(lib32-vkd3d-proton-git lib32-vkd3d-proton)
source=(git+https://github.com/HansKristian-Work/vkd3d-proton.git)

pkgver(){
  cd "${srcdir}"/vkd3d-proton
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}"/vkd3d-proton
  git submodule update --init --recursive
}

build(){
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export ASFLAGS+=" --32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  rm -rf "${srcdir}"/build

  local meson_options=(
    --cross-file lib32
    -D b_ndebug=true
    -D b_lto=false
    -D buildtype=plain
    --wrap-mode=nofallback
    -D prefix=/usr
    -D bindir=bin
    -D datadir=share
    -D includedir=include
    -D libdir=lib32
    -D sysconfdir=/etc
    -D enable_tests=false
    -D enable_extras=false
    -D enable_profiling=false
    -D enable_renderdoc=false
    -D enable_descriptor_qa=false
    -D enable_trace=auto
  )

  meson "${srcdir}"/vkd3d-proton "${srcdir}"/build "${meson_options[@]}"
  meson configure --no-pager "${srcdir}"/build
  meson compile -C "${srcdir}"/build
}

package(){
  DESTDIR="${pkgdir}" meson install -C "${srcdir}"/build

  rm -rf "${pkgdir}"/usr/include/

  # install license
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 "${srcdir}"/vkd3d-proton/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  install -m644 "${srcdir}"/vkd3d-proton/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  install -m644 "${srcdir}"/vkd3d-proton/AUTHORS "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}

sha256sums=(SKIP)

# vim:set ts=8 sts=2 sw=2 et:
