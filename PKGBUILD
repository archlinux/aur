# Maintainer: Samuel Bernard <samuel.bernard@gmail.com>
# Based on https://aur.archlinux.org/packages/mathematica/
pkgname=wolframengine
pkgver=13.2.0
pkgrel=2
pkgdesc="Free Wolfram Engine(TM) for Developers"
arch=('x86_64')
url="https://www.wolfram.com/engine/"
license=('proprietary')
provides=("wolframscript")
source=(
  "WolframEngine_${pkgver}_LINUX.sh::https://account.wolfram.com/download/public/wolfram-engine/desktop/LINUX"
)
noextract=("WolframEngine_${pkgver}_LINUX.sh")
sha256sums=("44f8199532034fd01044827bfe3b337f4e1e4b0da5f8346d97a2e0488c0d6ff7")
# TODO: list based on namcap, all in opt but some are probably mandatory
depends=( )
optdepends=(
  arb
  assimp
  bzip2
  clucene
  curl
  espeak
  ffmpeg
  flite
  gmime3
  intel-mkl
  java-environment
  java-runtime
  lib32-glibc
  libarchive
  libmad
  libnet
  libxinerama
  libxtst
  llvm11-libs
  minizip
  mongo-c-driver
  mpfr
  nss
  nvidia-utils
  opencascade
  portaudio
  primecount
  primesieve
  protobuf
  qhull
  qt5-quick3d
  qt6-quick3d
  r
  ruby
  tbb
  tiled
  tre
)
options=("!strip")

prepare() {
  if [ $(echo "${srcdir}" | wc -w) -ne 1 ]; then
    msg2 "ERROR: The WolframEngine installer doesn't support directory names with spaces."
    msg2 "Current build directory: ${srcdir}"
    exit 1
  fi

  chmod +x ${srcdir}/WolframEngine_${pkgver}_LINUX.sh
}

package() {
    msg2 "Running WolframEngine installer"
    # https://support.wolfram.com/46072
    sh ${srcdir}//WolframEngine_${pkgver}_LINUX.sh -- \
      -execdir=${pkgdir}/usr/bin \
      -targetdir=${pkgdir}/opt/WolframEngine \
      -auto
    msg2 "Errors related to 'xdg-icon-resource' and 'xdg-desktop-menu' are to be expected during WolframEngine's installation."
#
    msg2 "Fixing symbolic links"
#    cd ${pkgdir}/opt/WolframEngine/Executables
#    rm wolframscript
#    ln -s /opt/WolframEngine/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript
    cd ${pkgdir}/usr/bin
    rm -f WolframKernel
    ln -s /opt/WolframEngine/Executables/math
    ln -s /opt/WolframEngine/Executables/MathKernel
    ln -s /opt/WolframEngine/Executables/mcc
    ln -s /opt/WolframEngine/Executables/wolfram
    ln -s /opt/WolframEngine/Executables/WolframKernel
    ln -s /opt/WolframEngine/Executables/wolframplayer
    ln -s /opt/WolframEngine/Executables/WolframPlayer
    ln -s /opt/WolframEngine/SystemFiles/Kernel/Binaries/Linux-x86-64/ELProver
    ln -s /opt/WolframEngine/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript

    msg2 "Setting up WolframScript"
    mkdir -p ${srcdir}/WolframScript
    mkdir -p ${pkgdir}/usr/share/
    cd ${srcdir}/WolframScript
    bsdtar -xf ${pkgdir}/opt/WolframEngine/SystemFiles/Installation/wolframscript_*+*_amd64.deb data.tar.xz
    tar -xf data.tar.xz -C ${pkgdir}/usr/share/ --strip=3 ./usr/share/


    msg2 "Copying menu and mimetype information"
    mkdir -p \
      ${pkgdir}/usr/share/applications \
      ${pkgdir}/usr/share/desktop-directories \
      ${pkgdir}/usr/share/mime/packages
    cd ${pkgdir}/opt/WolframEngine/SystemFiles/Installation
    cp wolfram-all.directory ${pkgdir}/usr/share/desktop-directories/
    cp *.xml ${pkgdir}/usr/share/mime/packages/

    msg2 "Copying icons"
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/{32x32,64x64,128x128}/{apps,mimetypes}
    cd ${pkgdir}/opt/WolframEngine/SystemFiles/FrontEnd/SystemResources/X
    for i in 32 64 128; do
      cp App-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-mathematica.png
      for mimetype in $(ls vnd.* | cut -d '-' -f1 | uniq); do
        cp ${mimetype}-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-${mimetype}.png
      done
    done

    msg2 "Copying man pages"
    mkdir -p ${pkgdir}/usr/share/man/man1
    cd ${pkgdir}/opt/WolframEngine/SystemFiles/SystemDocumentation/Unix
    cp *.1 ${pkgdir}/usr/share/man/man1

    msg2 "Copying license"
    mkdir -p ${pkgdir}/usr/share/licenses/WolframEngine/
    cp ${pkgdir}/opt/WolframEngine/LICENSE.txt \
      ${pkgdir}/usr/share/licenses/WolframEngine/license.txt

    msg2 "Fixing file permissions"
    chmod go-w -R ${pkgdir}/*

    msg2 "Clean up"
    rm -f ${pkgdir}/opt/WolframEngine/SystemFiles/Installation/wolframscript*
    rm -f ${pkgdir}/opt/WolframEngine/SystemFiles/Installation/wolfram-mathematica${pkgver%%\.*}.desktop
    rm -f ${pkgdir}/opt/WolframEngine/InstallErrors
}
