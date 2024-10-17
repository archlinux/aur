# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=openrv-git
pkgver=2.1.0.r280.dd73ec4
pkgrel=1
pkgdesc="aka Open RV, an image and sequence viewer for VFX and animation artists"
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
        'ffmpeg.patch'
        'ocio.patch'
        'ocio_install_yaml-cpp.patch'
        'oiio.patch'
        'externalpackages.patch'
        'glew-lib64.patch'
        'jpegturbo-lib64.patch'
        'pyside2.patch'
        'pyside2-tools-root.patch'
        'qt5.patch'
        'pyside2-build_scripts.patch')
        # 'manual://gcc_64.tar')  # Uncomment to pass Qt5 to chroot
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'b0049be4ef7ade129682f8ccfb5bbaedf8b20f4459996dcc4d75e86a34a0382d099c6f342aebb997b8fef3ad190e4d3cb937f6e780095a33e66781c3c4eda604'
        '7e8bf6f5e14c51c258c755e1013352ae80725a6cd65223bdffc65282a83ca1d93b16621a0c1af41311ed603ac0f36503a8d930786d04483feda61d32d392b504'
        'f5d463d66fadff1d8d9fc7fadd04f5b723bc24a5530dce916e881e812d5e5d701bcbfbcaff6331ef94612028a82b3275fb309dfee292d12800ba4118ddd8c6eb'
        '4d6b004ae837a636bdaf3c97ca0e67feab3c9792548f9d515ff6cef8ee854d716703174aa4349905b9ed078a28ebc4a6f41166f855e3d4068d7b9de4555ebdb9'
        '83132f08eacfa5684d7adbcba60981e53e908025a31b6e39196a13a74a543d346fdcdbc95eb339bfc2c149c100ead760e7d0609afb275481d30a6c190782e8bb'
        'ab830c1bcae5a35a3c3efc7f09776837a5b0b3d53cb7a42db5fad052635e848a79013617c97abdba2ce51fd41a593f8dde216e52e73e0bc3a7f4e608a22d165b'
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
  patch --forward --strip=1 --input="$srcdir/ffmpeg.patch"
  patch --forward --strip=1 --input="$srcdir/ocio.patch"
  patch --forward --strip=1 --input="$srcdir/oiio.patch"
  patch --forward --strip=1 --input="$srcdir/glew-lib64.patch"
  patch --forward --strip=1 --input="$srcdir/jpegturbo-lib64.patch"
  patch --forward --strip=1 --input="$srcdir/pyside2.patch"
  # patch --forward --strip=1 --input="$srcdir/qt5.patch"  # Holdover from trying to use Arch-provided Qt5
  sed -i 's/HAVE_MREMAP 1/HAVE_MREMAP 0/g' src/pub/nedmalloc/malloc.c.h
  sed -i 's/s->pcrc_32_tab = get_crc_table()/s->pcrc_32_tab = (const unsigned long *)get_crc_table()/g' src/pub/minizip/unzip.c
  sed -i 's/char\* tagList = \&/char\* tagList = \(char\*\)\&/g' src/pub/FTGL/FTVectoriser.cpp
  sed -i 's/"--enable-shared",/"--enable-shared", "ax_cv_c_float_words_bigendian=no",/' src/build/make_python.py
  sed -i 's/"CY2023"/"CY2024"/' cmake/defaults/rv_options.cmake
  sed -i 's/pip install --user/pip install/' rvcmds.sh
  sed -i -E 's/alias (\w+)="(.+)"/\1() { \2; };/' rvcmds.sh  # Allow commands to run in PKGBUILD
  sed -i 's,\\"${CMAKE_GENERATOR}\\","${CMAKE_GENERATOR}",' rvcmds.sh
  sed -i "s/{WIN_PERL};/{WIN_PERL} "'"'"-DRV_FFMPEG_PATCH_COMMAND_STEP=git cherry-pick -n fef22c87ada4517441701e6e61e062c9f4399c8e 03823ac0c6a38bd6ba972539e3203a592579792f 06c2a2c425f22e7dba5cad909737a631cc676e3f 9d675bb60d2542631f37613aa92b7e1144bbeaa1 43b417d516b0fabbec1f02120d948f636b8a018e"'"'";/" rvcmds.sh
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
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mkdir -p "$pkgdir/opt/openrv"
  export RV_INST="$pkgdir/opt/openrv"
  source rvcmds.sh
  rvinst
}

