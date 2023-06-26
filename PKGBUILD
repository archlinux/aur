#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-vulkan-icd-loader-git
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (32-bit) (git version)'
pkgver=1.3.254.r13.gb02d69f
pkgrel=1
arch=(i686 x86_64)
url='https://github.com/KhronosGroup/Vulkan-Loader'
license=(Apache-2.0)
makedepends=(cmake python lib32-libx11 lib32-libxrandr lib32-wayland vulkan-headers-git git ninja make)
depends=(lib32-glibc)
optdepends=('lib32-vulkan-driver: packaged vulkan driver')
conflicts=(lib32-vulkan-icd-loader)
provides=(lib32-vulkan-icd-loader libvulkan.so lib32-vulkan-icd-loader-git)
source=(git+https://github.com/KhronosGroup/Vulkan-Loader.git)
md5sums=(SKIP)

pkgver(){
 cd Vulkan-Loader

 # cutting off 'foo-' prefix that presents in the git tag
 git describe --long --tags --abbrev=7 --exclude sdk-* | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd ${srcdir}/Vulkan-Loader
  #scripts/update_deps.py
  #git clone https://github.com/google/googletest.git external/googletest # optional
}

build(){
export CC='gcc -m32'
export CXX='g++ -m32'
export ASFLAGS=--32
export CFLAGS=-m32
export CXXFLAGS=-m32
export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  cd ${srcdir}/Vulkan-Loader

  rm -rf build_32

  cmake -H. -G Ninja -Bbuild_32 \
  -DCMAKE_C_FLAGS=-m32 \
  -DCMAKE_CXX_FLAGS=-m32 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DVULKAN_HEADERS_INSTALL_DIR=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib32 \
  -DCMAKE_INSTALL_SYSCONFDIR=/etc \
  -DCMAKE_INSTALL_DATADIR=/share \
  -DCMAKE_SKIP_RPATH=True \
  -DBUILD_TESTS=OFF \
  -DBUILD_WSI_XCB_SUPPORT=On \
  -DBUILD_WSI_XLIB_SUPPORT=On \
  -DBUILD_WSI_WAYLAND_SUPPORT=On \
  -DCMAKE_BUILD_TYPE=Release \
  -DUSE_CCACHE=OFF

  ninja -C build_32
}

package(){
  DESTDIR="${pkgdir}" ninja -C ${srcdir}/Vulkan-Loader/build_32/ install

  # install licence
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/Vulkan-Loader/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
