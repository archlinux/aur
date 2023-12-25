# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=openrv-git
pkgver=1.0.0.r171.c5ba738
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
        'ocio.patch'
        'ocio_install_yaml-cpp.patch'
        'oiio.patch'
        'glew-lib64.patch'
        'jpegturbo-lib64.patch'
        'pyside2.patch'
        'pyside2-tools-root.patch'
        'qt5.patch'
        'pyside2-build_scripts.patch')
        # 'manual://gcc_64.tar')  # Uncomment to pass Qt5 to chroot
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP'
        'b1424b55833ddc227f67a04897d416dd942405352e1b92ab8be8f7bc07ba059f6cb997b551d4fb7347f55fa4d809d3242db402bb19c028570447dc5955a782db' 
        '1a09ccede75b3b6c57d19f7378c73a3a732dfe726c0bf6a70c168fe2b0aa92ea7c71d65e01020990f887d67a9a23232be2d71da97717248cb2d68ae8fc34d338'
        '521af5eb255ad0280bfb364e3a8710ae4450a5f0d0943cfb844053ff5058865265e790c132197f6003f14a6724b498b30fa8db013298ec5e55526a9eefc5486e'
        'f5d463d66fadff1d8d9fc7fadd04f5b723bc24a5530dce916e881e812d5e5d701bcbfbcaff6331ef94612028a82b3275fb309dfee292d12800ba4118ddd8c6eb'
        '03cd706fb027ee46aaa86c744800190f797da9a879e95c5f6e7ac830c7f4b0cb5bd9e2c66f6924664bb633e4552ba63b9c82cb4318ffea66b44e6b86fd13e59f'
        'ad6a8b6cab093efc66695aa4797ed35c2723d46427bbdede98f3963c266096b4f3e242cafdf132b4a65f5e777b61cb8416bfc67ab8600ab01fc5d75dce1fc07f'
        '31ae9ab03451ac06771ae3d07d6b07ce86ea38494bea9d25c49940493a2a7e38db5267a5c4043a9811590ca236d3c9735376f4ab2c529b4565c33e57ee2b6448'
        '930f6c7a59a225247678bf7cce1a332547f8b47915bc176a204e3edc09edaa32a6fdf7475750a05c5483e7b813f8f11eb715a0d36efad06dd32cd5f5453ff996'
        'a29b8e8cd6b8a78d7cf31b314bd81e605b6ffaa347d1ff75363848d81cc4624a0ca89b63183f1be41159f1671a78bbf123c98c7e42fba824a7012b9622f12288'
        '9ed06e225dc5b3c2b367cd0756e448ffbca38bb658ba08ddb6b236b9b25eb83faf00ccaf9ad5ee741c7b0261d624a0c3a5c0d0728025c582d94c921f4b6e41a4'
        '5429215bda255dcd22687a89380babd0ff50091250c19ffd25feb4d88bf31cea29551572e52cdcc971a6a34fc6b468d9c80723e452763bd92ea826dccc148df5')
        # 'SKIP')  # Uncomment to pass Qt5 to chroot

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

  find cmake -type f -exec sed -i "s/lib64/lib/g" {} \;
  patch --forward --strip=1 --input="$srcdir/unblock-distro.patch"
  patch --forward --strip=1 --input="$srcdir/ffmpeg.patch"
  patch --forward --strip=1 --input="$srcdir/ocio.patch"
  patch --forward --strip=1 --input="$srcdir/oiio.patch"
  patch --forward --strip=1 --input="$srcdir/glew-lib64.patch"
  patch --forward --strip=1 --input="$srcdir/jpegturbo-lib64.patch"
  patch --forward --strip=1 --input="$srcdir/pyside2.patch"
  # patch --forward --strip=1 --input="$srcdir/qt5.patch"  # Holdover from trying to use Arch-provided Qt5
  # sed -i 's/os.cpu_count() or 1/min(os.cpu_count() or 1, 8)/' src/build/make_pyside.py  # May resolve random compiler segfault on AMD
  sed -i 's/pip install --user/pip install/' rvcmds.sh
  sed -i -E 's/alias (\w+)="(.+)"/\1() { \2; };/' rvcmds.sh  # Allow commands to run in PKGBUILD
  sed -i 's,\\"${CMAKE_GENERATOR}\\","${CMAKE_GENERATOR}",' rvcmds.sh
  sed -i 's/--target ;/--target $1;/' rvcmds.sh
  sed -i 's/ctest /ctest --exclude-regex ".*(ALSASafe|io_oiio).*" /' rvcmds.sh  # ALSASafe uses Rv::Option, removed OpenVDB from OIIO
  # sed -i 's/--parallel=8/--parallel=1/' rvcmds.sh  # May help with debugging
}

build() {
  cd OpenRV
  # export CMAKE_GENERATOR="Unix Makefiles"  # Uncomment to not use Ninja
  # export QT_HOME="$srcdir/gcc_64"  # Uncomment to pass Qt5 to chroot
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

