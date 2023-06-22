# _     _            _        _          _____
#| |__ | | __ _  ___| | _____| | ___   _|___ /
#| '_ \| |/ _` |/ __| |/ / __| |/ / | | | |_ \
#| |_) | | (_| | (__|   <\__ \   <| |_| |___) |
#|_.__/|_|\__,_|\___|_|\_\___/_|\_\\__, |____/
#                                  |___/

#Maintainer: blacksky3 <https://github.com/blacksky3>
#Credits: Laurent Carlier <lordheavym@gmail.com>

pkgname=vulkan-icd-loader-git
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (git version)'
pkgver=1.3.254.r13.gb02d69f
pkgrel=1
arch=(x86_64)
url='https://github.com/KhronosGroup/Vulkan-Loader'
license=(Apache-2.0)
makedepends=(cmake python python-lxml libx11 libxrandr wayland vulkan-headers git ninja make)
depends=(glibc)
optdepends=('vulkan-driver: packaged vulkan driver')
conflicts=(vulkan-icd-loader)
provides=(vulkan-icd-loader libvulkan.so vulkan-icd-loader-git)
source=(git+https://github.com/KhronosGroup/Vulkan-Loader.git)
md5sums=(SKIP)

pkgver(){
 cd ${srcdir}/Vulkan-Loader

 # cutting off 'foo-' prefix that presents in the git tag
 git describe --long --tags --abbrev=7 --exclude sdk-* | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd ${srcdir}/Vulkan-Loader
  #scripts/update_deps.py
  #git clone https://github.com/google/googletest.git external/googletest # optional
}

build(){
  cd ${srcdir}/Vulkan-Loader

  rm -rf build_64

  cmake -H. -G Ninja -Bbuild_64 \
  -DCMAKE_C_FLAGS=-m64 \
  -DCMAKE_CXX_FLAGS=-m64 \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DVULKAN_HEADERS_INSTALL_DIR=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_INSTALL_SYSCONFDIR=/etc \
  -DCMAKE_INSTALL_DATADIR=/share \
  -DCMAKE_SKIP_RPATH=True \
  -DBUILD_TESTS=OFF \
  -DBUILD_WSI_XCB_SUPPORT=On \
  -DBUILD_WSI_XLIB_SUPPORT=On \
  -DBUILD_WSI_WAYLAND_SUPPORT=On \
  -DCMAKE_BUILD_TYPE=Release

  ninja -C build_64
}

package_vulkan-icd-loader-git(){
  DESTDIR="${pkgdir}" ninja -C ${srcdir}/Vulkan-Loader/build_64/ install

  # install licence
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/Vulkan-Loader/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/
}
