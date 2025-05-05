# Maintainer: rpx <rpx at clearlight dot systems>
#
# Debian-compiled binaries.
# requires libxml2.so.2 from Arch archive.
# Thanks to Enzi, Unity Engine Forum:
# https://discussions.unity.com/t/arch-libxml2-so-2-is-missing/1637394


pkgname=openvsp-bin
pkgdesc='A parametric aircraft geometry tool'
pkgver=3.43.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://openvsp.org'
license=('NASA OPEN SOURCE AGREEMENT VERSION 1.3')
depends=(
  'cblas'
  'cminpack'
  'freeglut'
  'gcc'
  'git'
  'glew'
  'libxml2'
  'pandoc'
  'python'
  'swig')
optdepends=(
  'doxygen: generate documentation'
  'graphviz: generate documentation')
makedepends=('cmake' 'unzip')

_name=OpenVSP-OpenVSP_${pkgver}


# requires libxml2.so.2 from Arch archive.
libxml2_pkgver=2.13.8
libxml2_pkgrel=1

source=("${pkgname}-${pkgver}.deb"::"https://openvsp.org/download.php?file=zips/current/linux/OpenVSP-${pkgver}-Ubuntu-24.04_amd64.deb"
  "https://archive.archlinux.org/packages/l/libxml2/libxml2-${libxml2_pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('ca055b7dba5f4d950c11ddc107b67f0d4e7839026c2b5f88a6bab8d72c6d67ca'
  '2a1b0ab11ff213a57268d20fff183e3fd3e4ab9191aeed473de336b77bdfa6e1')

prepare() {
  mkdir -p "${srcdir}/build"
  mkdir -p "${srcdir}/lib"
}

build() {
  # Debian package is just an ar archive containing two tars.
  ar x ${pkgname}-${pkgver}.deb
  # Delete the remainder
  rm debian-binary control.tar.gz ${pkgname}-${pkgver}.deb
  # Put the package into form standard for compilation from source
  mv data.tar.gz "${srcdir}/build/OpenVSP-${pkgver}-Linux.tar.gz"

  bsdtar -xf "${srcdir}/libxml2-${libxml2_pkgver}-1-x86_64.pkg.tar.zst" -C "${srcdir}" $"usr/lib/libxml2.so.${libxml2_pkgver}"
}

package() {
  cd ${srcdir}/build
  tar xvf "OpenVSP-${pkgver}-Linux.tar.gz"
  mv ./opt/OpenVSP "./OpenVSP-${pkgver}-Linux" && rmdir opt
  cd "./OpenVSP-${pkgver}-Linux" 

  mkdir -p ${pkgdir}/usr/share/${pkgname}

  # binaries
  cp vsp vspaero vspscript vsploads vspaero_adjoint vspaero_complex vspaero_opt vspviewer \
    ${pkgdir}/usr/share/${pkgname}
 
  # misc
  cp README.md ${pkgdir}/usr/share/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/${pkgname}
  cp vspIcon.png ${pkgdir}/usr/share/${pkgname}
  cp -r airfoil ${pkgdir}/usr/share/${pkgname}
  cp -r CustomScripts ${pkgdir}/usr/share/${pkgname}
  cp -r help ${pkgdir}/usr/share/${pkgname}
  cp -r matlab ${pkgdir}/usr/share/${pkgname}
  test -d python && cp -r python ${pkgdir}/usr/share/${pkgname}
  cp -r scripts ${pkgdir}/usr/share/${pkgname}
  cp -r textures ${pkgdir}/usr/share/${pkgname}
  cp -r vspaero_ex ${pkgdir}/usr/share/${pkgname}

  # binary symlinks, relative
  mkdir -p ${pkgdir}/usr/bin
  cd ${pkgdir}/usr/share/${pkgname}
  ln -sr vsp vspaero vspscript vsploads vspaero_adjoint vspaero_complex vspaero_opt vspviewer \
    ${pkgdir}/usr/bin/

  # libraries missing in Arch
  mkdir -p ${pkgdir}/usr/lib
  # libxml2.so.2
  install -m 755 "${srcdir}/usr/lib/libxml2.so.${libxml2_pkgver}" "$pkgdir/usr/lib/libxml2.so.${libxml2_pkgver}"
  ln -sf $"libxml2.so.${libxml2_pkgver}" "$pkgdir/usr/lib/libxml2.so.2"
}
