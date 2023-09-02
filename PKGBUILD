# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=openrv-git
pkgver=r20230901+1424a24
pkgrel=1
pkgdesc="An image and sequence viewer for VFX and animation artists"
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/OpenRV'
license=('Apache' 'custom')
depends=('alsa-lib' 'glew' 'libxcomposite' 'libaio' 'pulseaudio' 'mesa'
         'ocl-icd' 'sqlite' 'tk'
         'qt5-tools' 'qt5-webengine' 'qt5-xmlpatterns'
         'python-yaml' 'python-requests' 'python-py7zr'
         'ffmpeg4.4' 'boost-libs' 'gc' 'imath' 'openexr' 'openssl-1.1'
         'pyside2' 'spdlog' 'opentimelineio' 'tcsh' 'libfmt')
makedepends=('cmake>=3.24' 'git' 'ninja' 'opencl-headers' 'nasm'
             'python-wheel' 'python-dohq-artifactory' 'python-pre-commit'
             'boost' 'doctest')

source=('git+https://github.com/AcademySoftwareFoundation/OpenRV.git'
        'git+https://github.com/shotgunsoftware/openrv-WFObj.git'
        'git+https://github.com/shotgunsoftware/openrv-pub.git'
        'git+https://github.com/shotgunsoftware/openrv-oiio.git'
        'ambiguous-powf64.patch'
        'link-libfmt.patch'
        'skip-dependencies.patch'
        'unblock-distro.patch'
        'fmt.cmake')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP'
        '66ffac95c2d50f0ac09fb04eb05cef853901f443328e0819871c7ec116e356d2db8da7adf99cdd45c7d8bff9d73ae1ea257d8241ac6d598e662962abe2939194' 
        '6d72ad8345de21e773bc8ef2efa6d079b89c22188a97166580b9477c182dd8464eee1952e0e3fbf3800b4ef8f7c8bf66ad490e38bb4b53444523b948942f9700' 
        '49e7eb8435b24cd020c00c1de3b5f37ce61b2c89221da96c124d7d60bbfa3d0e5c11201a85343f0dba295b5fd30b50d5e1628d15aa3153464f56d5e83d1e6f9a' 
        'b1424b55833ddc227f67a04897d416dd942405352e1b92ab8be8f7bc07ba059f6cb997b551d4fb7347f55fa4d809d3242db402bb19c028570447dc5955a782db' 
        '9d1c84e03ab8abdbae41eaf5db697245e72621d212bb35a34dd8713d07a85cf3b3124b42d0c5de10231656956229d49c5ade477e9840af54def1fdec71151cba')

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

  patch --forward --strip=1 --input="${srcdir}/unblock-distro.patch"
  patch --forward --strip=1 --input="${srcdir}/skip-dependencies.patch"
  patch --forward --strip=1 --input="${srcdir}/link-libfmt.patch"
  patch --forward --strip=1 --input="${srcdir}/ambiguous-powf64.patch"
  mv "$srcdir/fmt.cmake" "cmake/dependencies"
}

build() {
  cd OpenRV
  if [[ -z "${QT_HOME}" ]]; then
    export QT_HOME=/usr
  fi
  if [[ -z "${QT_PLUGIN_PATH}" ]]; then
    export QT_PLUGIN_PATH=/usr/lib/qt/plugins
  fi
  source rvcmds.sh
  rvmk
}

package() {
  
}

# While the dependencies could skip building, the following environment variables
# needed to be set, and the process experiences significant difficulties getting Qt
# to load. If you don't add RV_HOME to your PYTHONPATH, you can get a barebones RV
# working in the meantime.
#
# QT_PLUGIN_PATH=/usr/lib/qt/plugins
# PYTHONHOME=/usr/lib/python3.11
# PYTHONPATH="$RV_HOME/plugins/Python:/usr/lib/python3.11/site-packages:/usr/lib/python3.11:/usr/lib/python3.11/lib-dynload"
# LD_LIBRARY_PATH=/usr/lib
# QTWEBENGINEPROCESS_PATH=/usr/lib/qt/libexec/QtWebEngineProcess

