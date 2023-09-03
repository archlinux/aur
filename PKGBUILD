# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=openrv-git
pkgver=r20230903+1424a24
pkgrel=1
pkgdesc="An image and sequence viewer for VFX and animation artists"
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/OpenRV'
license=('Apache' 'custom')
depends=('alsa-lib' 'glew' 'libxcomposite' 'libaio' 'pulseaudio' 'mesa'
         'ocl-icd' 'sqlite' 'tk' 'tcsh' 'fmt')
optdepends=('ninja: Preferred CMake Generator')
makedepends=('cmake>=3.24' 'git' 'opencl-headers' 'nasm')

source=('git+https://github.com/AcademySoftwareFoundation/OpenRV.git'
        'git+https://github.com/shotgunsoftware/openrv-WFObj.git'
        'git+https://github.com/shotgunsoftware/openrv-pub.git'
        'git+https://github.com/shotgunsoftware/openrv-oiio.git'
        'unblock-distro.patch'
        'ffmpeg.patch'
        'glew-lib64.patch'
        'pyside2.patch'
        'pyside2-tools-root.patch'
        'ambiguous-powf64.patch')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP'
        'b1424b55833ddc227f67a04897d416dd942405352e1b92ab8be8f7bc07ba059f6cb997b551d4fb7347f55fa4d809d3242db402bb19c028570447dc5955a782db' 
        'ad9fabb81c8f56e95b998108a1d94805d253466687a1dbf1daf3f24e3ebb81b527d40ac40eb7ed62d368959d610901838696b8fe3f0ea82e661cee285c322190'
        'ad6a8b6cab093efc66695aa4797ed35c2723d46427bbdede98f3963c266096b4f3e242cafdf132b4a65f5e777b61cb8416bfc67ab8600ab01fc5d75dce1fc07f'
        '7267ed30c25d741dbabb7c46b97982b0340504e862bbde57c7d251f1164a04da7d90eaf92701aceb64f0963f0756ec206949543f05f030d6f3e4a0a69e10b0b0'
        'a29b8e8cd6b8a78d7cf31b314bd81e605b6ffaa347d1ff75363848d81cc4624a0ca89b63183f1be41159f1671a78bbf123c98c7e42fba824a7012b9622f12288'
        '66ffac95c2d50f0ac09fb04eb05cef853901f443328e0819871c7ec116e356d2db8da7adf99cdd45c7d8bff9d73ae1ea257d8241ac6d598e662962abe2939194')

pkgver() {
  cd OpenRV
  cmake .
  cmakelistsver=$(cmake --system-information |                                                                                                                                                                               [11:25:02]
    awk -F= '$1~/RV_MAJOR_VERSION:STRING/{MAJOR=$2; next} \
                /RV_MINOR_VERSION:STRING/{MINOR=$2; next} \
                /RV_REVISION_NUMBER:STRING/{print MAJOR "." MINOR "." $2}')
  git clean -f -d
  printf "%s.r%s.%s" cmakelistsver "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd OpenRV

  git submodule init
  git config submodule.src/lib/files/WFObj.url "$srcdir/openrv-WFObj"
  git config submodule.src/pub.url "$srcdir/openrv-pub"
  git config submodule.src/lib/oiio.url "$srcdir/openrv-oiio"
  git -c protocol.file.allow=always submodule update

  find cmake/dependencies -type f -exec sed -i "s/lib64/lib/g" {} \;
  patch --forward --strip=1 --input="${srcdir}/unblock-distro.patch"
  patch --forward --strip=1 --input="${srcdir}/ffmpeg.patch"
  patch --forward --strip=1 --input="${srcdir}/glew-lib64.patch"
  patch --forward --strip=1 --input="${srcdir}/pyside2.patch"
  patch --forward --strip=1 --input="${srcdir}/ambiguous-powf64.patch"
}

build() {
  cd OpenRV
  if ! pacman -Qs ninja > /dev/null; then
    export CMAKE_GENERATOR="Unix Makefiles"
  fi
  source rvcmds.sh
  rvmk
}

package() {
  cd OpenRV
  source rvcmds.sh
  mkdir -p $pkgdir/openrv
  rvinst $pkgdir/openrv
}

