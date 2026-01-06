# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=upbge
pkgname=${_pkgname}-bin
pkgver=0.50
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
sha512sums=('d549c5892f17296e53cc041b6389ed28522356469f7b9977f25ecce4b7e896197dcfb4b1e06427f0a6610424505869cdc649aef6790c9a3ac060903b00a4d41f')
source=("${pkgname}::https://github.com/UPBGE/upbge/releases/download/v0.50/upbge-0.50-linux-x64.tar.xz")

package() {
  cd "upbge-${pkgver}-linux-x64"

  mkdir -p ${pkgdir}/opt/upbge
  cp -R "./." ${pkgdir}/opt/upbge/
  rm ${pkgdir}/opt/upbge/org.upbge.UPBGE.svg ${pkgdir}/opt/upbge/org.upbge.UPBGE-symbolic.svg ${pkgdir}/opt/upbge/org.upbge.UPBGE.desktop

  install -Dm 644 ./org.upbge.UPBGE.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.upbge.UPBGE.svg
  install -Dm 644 ./org.upbge.UPBGE-symbolic.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.upbge.UPBGE-symbolic.svg
  install -Dm 755 ./org.upbge.UPBGE.desktop ${pkgdir}/usr/share/applications/org.upbge.UPBGE.desktop

  mkdir -p ${pkgdir}/usr/bin

  echo $'#!/bin/sh\nPYTHONPATH=/opt/upbge/5.0/python/lib/python3.11/ /opt/upbge/blenderplayer "$@"' > ${pkgdir}/opt/upbge/blenderplayer-compat
  chmod 755 ${pkgdir}/opt/upbge/blenderplayer-compat

  ln -s /opt/upbge/blender ${pkgdir}/usr/bin/blender
  ln -s /opt/upbge/blender-thumbnailer ${pkgdir}/usr/bin/blender-thumbnailer
  ln -s /opt/upbge/blenderplayer-compat ${pkgdir}/usr/bin/blenderplayer
}
