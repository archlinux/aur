# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=q2rtx-git
pkgver=1.8.0.r0.gd65761f2
_pkgver=1.8.0
pkgrel=1
pkgdesc="NVIDIA’s implementation of RTX ray-tracing in Quake II "
arch=(x86_64)
url="https://github.com/NVIDIA/Q2RTX"
license=(GPL2 custom)
depends=(gcc-libs libssh2 vulkan-icd-loader sndio)
makedepends=(git cmake openal libglvnd python pipewire alsa-lib libpulse jack portaudio sdl2)
optdepends=(q2rtx-data)
provides=(q2rtx)
conflicts=(q2rtx quake2rtx)
replaces=(quake2rtx)
#options=(!lto)
source=("git+https://github.com/NVIDIA/Q2RTX.git"
        "git+https://github.com/madler/zlib.git"
        "git+https://github.com/curl/curl.git"
        "git+https://github.com/libsdl-org/SDL.git"
        "git+https://github.com/nothings/stb.git"
        "git+https://github.com/syoyo/tinyobjloader-c.git"
        "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/glslang.git"
        "git+https://github.com/kcat/openal-soft.git"
        q2rtx.sh
        "https://github.com/NVIDIA/Q2RTX/releases/download/v${_pkgver}/q2rtx-${_pkgver}-linux.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '495e7ced4b818d7d91c7daedd8e74ab641383be25623b12800f64f499c808ad8'
            '7467a33056d8c98f9abef6bfdb02a6a2904a311ec669c59a68241cf588f93222')

pkgver() {
  cd Q2RTX
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Q2RTX
  git submodule init
  git config submodule.extern/zlib.url "${srcdir}/zlib"
  git config submodule.extern/curl.url "${srcdir}/curl"
  git config submodule.extern/SDL2.url "${srcdir}/SDL"
  git config submodule.extern/stb.url "${srcdir}/stb"
  git config submodule.extern/tinyobjloader-c.url "${srcdir}/tinyobjloader-c"
  git config submodule.extern/Vulkan-Headers.url "${srcdir}/Vulkan-Headers"
  git config submodule.extern/glslang.url "${srcdir}/glslang"
  git config submodule.extern/openal-soft.url "${srcdir}/openal-soft"
  git -c protocol.file.allow=always submodule update

  [[ -d build ]] || mkdir build
}

build() {
  export CFLAGS+=" -Wno-incompatible-pointer-types"

  cd Q2RTX/build
  cmake .. -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCONFIG_BUILD_GLSLANG=ON

  make
}

package() {
  install -Dm755 q2rtx.sh "${pkgdir}/usr/bin/q2rtx"

  cd Q2RTX
  install -d "${pkgdir}/usr/share/q2rtx/bin"
  cp q2rtx{,ded} "${pkgdir}/usr/share/q2rtx/bin/"
  cp -r baseq2 "${pkgdir}/usr/share/q2rtx/bin/"

  install -D license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -D notice.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 setup/find-retail-paks.sh "${pkgdir}/usr/bin/q2rtx-find-retail-paks"
  install -Dm644 setup/q2rtx.png -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 setup/q2rtx.desktop -t "${pkgdir}/usr/share/applications/"

  cd "${srcdir}/q2rtx"
  cp -r baseq2/players "${pkgdir}/usr/share/q2rtx/bin/baseq2"
  #install baseq2/*.pak "${pkgdir}/usr/share/q2rtx/bin/baseq2"
  #install baseq2/*.pkz "${pkgdir}/usr/share/q2rtx/bin/baseq2"
}
