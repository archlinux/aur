# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

## links:
# https://www.winehq.org
# https://gitlab.winehq.org/wine/wine
# https://gitlab.winehq.org/wine/wine-staging
# https://github.com/wine-staging/wine-staging

pkgname="winecx-wow64"
pkgver=25.0.1
_pkgver="${pkgver/rc/-rc}"
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs"
url="https://www.winehq.org"
license=('LGPL-2.1-or-later')
arch=('x86_64')

depends=(
  alsa-lib              #lib32-alsa-lib
  fontconfig            #lib32-fontconfig
  freetype2             #lib32-freetype2
  gettext               #lib32-gettext
  gnutls                #lib32-gnutls
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libpcap               #lib32-libpcap
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxcursor            #lib32-libxcursor
  libxi                 #lib32-libxi
  libxinerama           #lib32-libxinerama
  libxkbcommon          #lib32-libkbcommon
  libxrandr             #lib32-libxrandr
  opencl-icd-loader     #lib32-opencl-icd-loader
  pcsclite              #lib32-pcsclite
  sdl2                  #lib32-sdl2
  unixodbc              #lib32-unixodbc
  v4l-utils             #lib32-v4l-utils
  wayland               #lib32-wayland
  desktop-file-utils
  libgphoto2
)
makedepends=(
  libxxf86vm        #lib32-libxxf86vm
  mesa              #lib32-mesa
  mesa-libgl        #lib32-mesa-libgl
  vulkan-icd-loader #lib32-vulkan-icd-loader
  autoconf
  bison
  flex
  mingw-w64-gcc
  opencl-headers
  perl
  vulkan-headers
)
_makeoptdeps=(
  ::alsa-plugins #lib32-alsa-plugins
  ::dosbox
  libcups::cups #lib32-libcups
  samba::samba
  sane::sane
)
for i in "${_makeoptdeps[@]}"; do
  [ -n "${i%%::*}" ] && makedepends+=("${i%%::*}")
  [ -n "${i##*::}" ] && optdepends+=("${i##*::}")
done

provides=("winecx")
conflicts=("winecx")

install="wine.install"
backup=("usr/lib/binfmt.d/wine.conf")

options=(staticlibs !lto)

source=(
  "https://media.codeweavers.com/pub/crossover/source/crossover-sources-$pkgver.tar.gz"
  "30-win32-aliases.conf"
  "wine-binfmt.conf"
  "distversion.h"
)
b2sums=('411cd6f468dbf0dd29d3495964c46cb1ae126bd23cf4cbfef6a85b8c0e247b5984b65e1159f133142cfb3a21eeb612f821fd26a8a47d970dfd21a01d0c66439d'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588'
        'efbb28d4cf6e60b75f269c19bb708049d85b3aaace819b6fcd4507b1f8b05bf745e7171ee57f504d89089952bc9081419669b69a8102e9bcd6d6b0f5ed9730ab')

prepare() {
    # Alteração: Ajuste para a nova estrutura de diretórios
    mkdir -p "${srcdir}/sources/wine/programs/winedbg"
    cp "${srcdir}/distversion.h" "${srcdir}/sources/wine/programs/winedbg/distversion.h"
}

build() {
  # Apply flags for cross-compilation
  export CROSSCFLAGS="-O2 -pipe"
  export CROSSCXXFLAGS="-O2 -pipe"
  export CROSSLDFLAGS="-Wl,-O1"

  mkdir -p build
  cd build
  ../sources/wine/configure \
    --disable-tests \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-archs=x86_64,i386
  make
}

package() {
  cd build
  make prefix="${pkgdir}/opt/winecx" \
             libdir="${pkgdir}/opt/winecx/lib" \
             dlldir="${pkgdir}/opt/winecx/lib/wine" install

    install -D -m755 "./wine" -t "${pkgdir}/usr/bin/winecx"
    install -D -m755 "./wine" -t "${pkgdir}/usr/bin/winecx64"

    # font aliasing settings for win32 applications
    install -d -m755 "${pkgdir}/opt/winecx/share/fontconfig/conf.default"
    install -D -m644 "${srcdir}/30-win32-aliases.conf" -t "${pkgdir}/opt/winecx/share/fontconfig/conf.avail"
    ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/opt/winecx/share/fontconfig/conf.default/30-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
