# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=openrv-git
pkgver=1.0.0.r111.1424a24
pkgrel=1
pkgdesc="An image and sequence viewer for VFX and animation artists"
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/OpenRV'
license=('Apache' 'custom')
depends=('alsa-lib' 'libaio' 'mesa' 'tk' 'tcsh' 'opencl-icd-loader' 'glu' 'nss'
         'libxcomposite' 'libxcursor' 'xcb-util-keysyms' 'libxrandr' 'libva'
         'xcb-util-wm' 'xcb-util-renderutil' 'libxkbcommon-x11' 'libvdpau' 'libxtst'
         'libva' 'xcb-util-keysyms' 'libnsl' 'xcb-util-image' 'libcups' 'libpulse')
makedepends=('cmake>=3.24' 'git' 'opencl-headers' 'nasm' 'python-pip' 'meson'
             'openssl-1.1')
provides=('openrv')
options=(!strip)
DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download and install Qt from the official website, "
                                      "then tarball the Qt/5.15.2/gcc_64 directory defined as QT_HOME.")
source=('git+https://github.com/AcademySoftwareFoundation/OpenRV.git'
        'git+https://github.com/shotgunsoftware/openrv-WFObj.git'
        'git+https://github.com/shotgunsoftware/openrv-pub.git'
        'git+https://github.com/shotgunsoftware/openrv-oiio.git'
        'unblock-distro.patch'
        'ffmpeg.patch'
        'glew-lib64.patch'
        'pyside2.patch'
        'pyside2-tools-root.patch'
        'ambiguous-powf64.patch'
        'format-security.patch'
        'qt5.patch'
        'pyside2-build_scripts.patch')
        # 'manual://gcc_64.tar')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP'
        'b1424b55833ddc227f67a04897d416dd942405352e1b92ab8be8f7bc07ba059f6cb997b551d4fb7347f55fa4d809d3242db402bb19c028570447dc5955a782db' 
        'ad9fabb81c8f56e95b998108a1d94805d253466687a1dbf1daf3f24e3ebb81b527d40ac40eb7ed62d368959d610901838696b8fe3f0ea82e661cee285c322190'
        'ad6a8b6cab093efc66695aa4797ed35c2723d46427bbdede98f3963c266096b4f3e242cafdf132b4a65f5e777b61cb8416bfc67ab8600ab01fc5d75dce1fc07f'
        '930f6c7a59a225247678bf7cce1a332547f8b47915bc176a204e3edc09edaa32a6fdf7475750a05c5483e7b813f8f11eb715a0d36efad06dd32cd5f5453ff996'
        'a29b8e8cd6b8a78d7cf31b314bd81e605b6ffaa347d1ff75363848d81cc4624a0ca89b63183f1be41159f1671a78bbf123c98c7e42fba824a7012b9622f12288'
        '66ffac95c2d50f0ac09fb04eb05cef853901f443328e0819871c7ec116e356d2db8da7adf99cdd45c7d8bff9d73ae1ea257d8241ac6d598e662962abe2939194'
        'd4e7894519a54b62b430a0b63f9de78b9df348e0551ec23163bbedb0d926920d466f3ed5435fec502b86628784d021e1874842cca9ad9c65de03295aaec4a048'
        '9ed06e225dc5b3c2b367cd0756e448ffbca38bb658ba08ddb6b236b9b25eb83faf00ccaf9ad5ee741c7b0261d624a0c3a5c0d0728025c582d94c921f4b6e41a4'
        '5429215bda255dcd22687a89380babd0ff50091250c19ffd25feb4d88bf31cea29551572e52cdcc971a6a34fc6b468d9c80723e452763bd92ea826dccc148df5')
        # 'SKIP')

pkgver() {
  cd OpenRV
  ! cmake . >/dev/null 2>&1
  ! cmakelistsver=$(! cmake --system-information |
      awk -F= '$1~/RV_MAJOR_VERSION:STRING/{MAJOR=$2; next} \
                  /RV_MINOR_VERSION:STRING/{MINOR=$2; next} \
                  /RV_REVISION_NUMBER:STRING/{print MAJOR "." MINOR "." $2}')
  git clean -f -d >/dev/null 2>&1
  printf "%s.r%s.%s" $cmakelistsver "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd OpenRV

  git submodule init
  git config submodule.src/lib/files/WFObj.url "$srcdir/openrv-WFObj"
  git config submodule.src/pub.url "$srcdir/openrv-pub"
  git config submodule.src/lib/oiio.url "$srcdir/openrv-oiio"
  git -c protocol.file.allow=always submodule update

  find cmake/dependencies -type f -exec sed -i "s/lib64/lib/g" {} \;
  patch --forward --strip=1 --input="$srcdir/unblock-distro.patch"
  patch --forward --strip=1 --input="$srcdir/ffmpeg.patch"
  patch --forward --strip=1 --input="$srcdir/glew-lib64.patch"
  patch --forward --strip=1 --input="$srcdir/pyside2.patch"
  patch --forward --strip=1 --input="$srcdir/ambiguous-powf64.patch"
  patch --forward --strip=1 --input="$srcdir/format-security.patch"
  # patch --forward --strip=1 --input="$srcdir/qt5.patch"
  sed -i 's/pip install --user/pip install/' rvcmds.sh
  sed -i -E 's/alias (\w+)="(.+)"/\1() { \2; };/' rvcmds.sh
  sed -i 's,\\"${CMAKE_GENERATOR}\\","${CMAKE_GENERATOR}",' rvcmds.sh
  sed -i 's/--target ;/--target $1;/' rvcmds.sh
  sed -i 's/ctest /ctest --exclude-regex ".*ALSASafe.*" /' rvcmds.sh  # ALSASafe uses Rv::Option
  # sed -i 's/--parallel=8/--parallel=1/' rvcmds.sh
}

build() {
  cd OpenRV
  # export CMAKE_GENERATOR="Unix Makefiles"
  # export QT_HOME="$srcdir/gcc_64"
  python -m venv .
  source bin/activate
  source rvcmds.sh
  rvbootstrap
}

check() {
  cd OpenRV
  source rvcmds.sh
  rvtest
}

package() {
  cd OpenRV
  mkdir -p "$pkgdir/opt/openrv"
  export RV_INST="$pkgdir/opt/openrv"
  source rvcmds.sh
  rvinst
}

