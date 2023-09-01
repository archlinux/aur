# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>

pkgname=openrv-git
pkgver=r20230901+1424a24
pkgrel=1
pkgdesc="An image and sequence viewer for VFX and animation artists"
arch=('x86_64')
url='https://github.com/AcademySoftwareFoundation/OpenRV'
license=('Apache' 'custom')
depends=('alsa-lib' 'glew' 'libxcomposite' 'libaio' 'pulseaudio' 'opengl-driver'
         'ocl-icd' 'sqlite' 'tk'
         'qt5-tools' 'qt5-webengine' 'qt5-xmlpatterns'
         'python-yaml' 'python-requests' 'python-py7zr')
         #'libatomic_ops' 'ffmpeg4.4' 'boost-libs' 'gc' 'imath' 'openexr' 'openssl-1.1'
         #'pyside2' 'spdlog')
makedepends=('cmake>=3.24' 'git' 'ninja' 'opencl-headers' 'nasm'
             'python-wheel' 'python-dohq-artifactory' 'python-pre-commit'
             'boost' 'doctest')

source=('git+https://github.com/AcademySoftwareFoundation/OpenRV.git'
        'git+https://github.com/shotgunsoftware/openrv-WFObj.git'
        'git+https://github.com/shotgunsoftware/openrv-pub.git'
        'git+https://github.com/shotgunsoftware/openrv-oiio.git'
        'openrv.patch')
b2sums=('SKIP' 'SKIP' 'SKIP' 'SKIP'
        '17791aa4445deee1d3c3de103ba0a4072f6abea246b918ae7f69b4b2d1e4f8e7cb2689e2424285b21170927fd418955eb36a6688e114506f1e495c4f1bc1db86')

pkgver() {
  cd OpenRV
  cmakelistsver = $(cmake --system-information |                                                                                                                                                                               [11:25:02]
    awk -F= '$1~/RV_MAJOR_VERSION:STRING/{MAJOR=$2; next} \
                /RV_MINOR_VERSION:STRING/{MINOR=$2; next} \
                /RV_REVISION_NUMBER:STRING/{print MAJOR "." MINOR "." $2}')
  printf "%s.r%s.%s" cmakelistsver "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd OpenRV
  git submodule init
  git config submodule.src/lib/files/WFObj.url "$srcdir/openrv-WFObj"
  git config submodule.src/pub.url "$srcdir/openrv-pub"
  git config submodule.src/lib/oiio.url "$srcdir/openrv-oiio"
  git -c protocol.file.allow=always submodule update
  patch --forward --strip=1 --input="${srcdir}/openrv.patch"
}

build() {
  cd OpenRV
  if [[ -z "${QT_HOME}" ]]; then
    export QT_HOME=/usr
  fi
  source rvcmds.sh
  rvmk
}
