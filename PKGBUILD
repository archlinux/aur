# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=upbge
pkgname=${_pkgname}-bin
pkgver=0.36.1
pkgrel=1
pkgdesc='Uchronia Project Blender Game Engine fork of Blender Game Engine - binary package'
arch=('x86_64')
url="https://upbge.org/#/"
license=('GPL-3.0-or-later')
depends+=('alembic' 'embree' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'libharu' 'potrace' 'openxr'
          'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio' 'sdl2'
          'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng'
          'python' 'python-zstandard' 'ccache' 'libdecor' 'libepoxy' 'hicolor-icon-theme')
optdepends=('cuda: CUDA support in Cycles'
            'optix>=7.4.0: OptiX support in Cycles'
            'usd=21.05: USD export Scene'
            'openpgl: Intel Path Guiding library in Cycles'
            'openimagedenoise: Intel Open Image Denoise support in compositing'
            'materialx: MaterialX materials'
            'level-zero-headers: Intel OpenCL FPGA kernels (all four needed)'
            'intel-compute-runtime: Intel OpenCL FPGA kernels (all four needed)'
            'intel-graphics-compiler: Intel OpenCL FPGA kernels (all four needed)'
            'intel-oneapi-basekit: Intel OpenCL FPGA kernels (all four needed)'
            'makepkg-cg: Control resources during compilation')
provides=("${_pkgname}" "blender")
conflicts=("${_pkgname}" "blender")
sha512sums=('1e156998c09726c41c87c25cc6839a5150ca65096467a5be705a4d5cb1be001052fc0f54fe214dbbfe6b612fd646173148113ffaadf9179a17f297e6d1bdfc5e')
source=("${pkgname}::https://github.com/UPBGE/upbge/releases/download/v0.36.1/upbge-0.36.1-linux-x86_64.tar.xz")

package() {
  cd "upbge-${pkgver}-linux-x86_64"

  mkdir -p ${pkgdir}/opt/upbge
  cp -R "./." ${pkgdir}/opt/upbge/
  rm ${pkgdir}/opt/upbge/upbge.svg ${pkgdir}/opt/upbge/upbge-symbolic.svg ${pkgdir}/opt/upbge/upbge.desktop

  install -Dm 644 ./upbge.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/upbge.svg
  install -Dm 644 ./upbge-symbolic.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/upbge-symbolic.svg
  install -Dm 755 ./upbge.desktop ${pkgdir}/usr/share/applications/upbge.desktop

  mkdir -p ${pkgdir}/usr/bin

  echo $'#!/bin/sh\nPYTHONPATH=/opt/upbge/3.6/python/lib/python3.10/ /opt/upbge/blenderplayer "$@"' > ${pkgdir}/opt/upbge/blenderplayer-compat
  chmod 755 ${pkgdir}/opt/upbge/blenderplayer-compat

  ln -s /opt/upbge/blender ${pkgdir}/usr/bin/blender
  ln -s /opt/upbge/blender-thumbnailer ${pkgdir}/usr/bin/blender-thumbnailer
  ln -s /opt/upbge/blenderplayer-compat ${pkgdir}/usr/bin/blenderplayer
}
