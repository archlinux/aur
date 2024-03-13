# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-wow64-for-wechat
_pkgver=9.4
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="A compatibility layer for running Windows programs"
url="https://www.winehq.org"
license=(LGPL)
arch=(x86_64)
depends=(
  fontconfig      #lib32-fontconfig
  freetype2       #lib32-freetype2
  gettext         #lib32-gettext
  libxcursor      #lib32-libxcursor
  libxi           #lib32-libxi
  libxrandr       #lib32-libxrandr
  desktop-file-utils
)
makedepends=(
  alsa-lib              #lib32-alsa-lib
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libcups               #lib32-libcups
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxinerama           #lib32-libxinerama
  libxxf86vm            #lib32-libxxf86vm
  mesa                  #lib32-mesa
  mesa-libgl            #lib32-mesa-libgl
  opencl-icd-loader     #lib32-opencl-icd-loader
  pcsclite              #lib32-pcsclite
  sdl2                  #lib32-sdl2
  v4l-utils             #lib32-v4l-utils
  vulkan-icd-loader     #lib32-vulkan-icd-loader
  autoconf
  bison
  flex
  libgphoto2
  mingw-w64-gcc
  opencl-headers
  perl
  samba
  sane
  vulkan-headers
)
optdepends=(
  alsa-lib              #lib32-alsa-lib
  alsa-plugins          #lib32-alsa-plugins
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  libpulse              #lib32-libpulse
  libxcomposite         #lib32-libxcomposite
  libxinerama           #lib32-libxinerama
  opencl-icd-loader     #lib32-opencl-icd-loader
  pcsclite              #lib32-pcsclite
  sdl2                  #lib32-sdl2
  v4l-utils             #lib32-v4l-utils
  cups
  dosbox
  libgphoto2
  samba
  sane
)
provides=("wine=$pkgver")
conflicts=("wine")
install="wine.install"
options=(staticlibs !lto)
source=(
  #"https://dl.winehq.org/wine/source/${_pkgver::1}.x/wine-${_pkgver}.tar.xz"
  "https://mirrors.ustc.edu.cn/wine/wine/source/${_pkgver::1}.x/wine-${_pkgver}.tar.xz"
  "30-win32-aliases.conf"
  "wine-binfmt.conf"
  "0001-winex11.drv-Update-a-candidate-window-s-position-wit.patch"
  "0002-wine-wechat.patch"
)
sha256sums=('c55ff9957612549b8c7df7cddc79d7a00d19157d05b371148bf08d4ddf768ec6'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
            '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4'
            'd62ea49462e4f6cf40ec37d34c6690cf81b7cf0816c0464257910acab57dd416'
            'b9ba6dd20c021688d46d0aaddd9c9635b78bd854d0593978f8dad3706e710481')


prepare() {
  cd $srcdir/wine-$_pkgver
  # fix fcitx position
  patch -p1 < $srcdir/0001-winex11.drv-Update-a-candidate-window-s-position-wit.patch
  # fix wechat shadow
  patch -p1 < $srcdir/0002-wine-wechat.patch
}

build() {
  cd $srcdir/wine-$_pkgver
  ./configure \
    --disable-tests \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-archs=x86_64,i386
  make
}

package() {
  cd $srcdir/wine-$_pkgver
  make prefix="$pkgdir"/usr \
    libdir="$pkgdir"/usr/lib \
    dlldir="$pkgdir"/usr/lib/wine install

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/i386-windows/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.dll

  ln -sf /usr/bin/wine "$pkgdir"/usr/bin/wine64

  # Font aliasing settings for Win32 applications
  install -Dm644 "$srcdir"/30-win32-aliases.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail/
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir"/usr/share/fontconfig/conf.default/30-win32-aliases.conf

  install -Dm644 "$srcdir"/wine-binfmt.conf "$pkgdir"/usr/lib/binfmt.d/wine.conf
}

# vim:set ts=8 sts=2 sw=2 et:
