# Maintainer: Daniele Basso <d dot bass05 at proton dot me>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-wow64-for-wechat
_name=wine
pkgver=8.19
pkgrel=1
provides=("wine=$pkgver")
conflicts=("wine")
source=(https://dl.winehq.org/wine/source/8.x/$_name-$pkgver.tar.xz
        30-win32-aliases.conf
        wine-binfmt.conf
        0001-winex11.drv-Update-a-candidate-window-s-position-wit.patch
        0002-wine-wechat.patch)
sha512sums=('ad4178c5e9f336eb968f0c378e3819794507447728acd10d642c1d66e0745837e47a70579bc9c7d9bec4510ca47e230bf4ab05ddf39323669ed24a6fce9f8c02'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
            '8c319dacdbd484ae2e02d9b967cd31866c525dd51a905c8ed9fa11b36794232c93ea97a94dbcaa5cacb3f44ab5570ee4a6da04576ae4963da300bf8d2c123705'
            '646dfd6ec62fb9ddbfb27aac0ac80d87926fbc3360bb53cca942622e95d1ec380f0b5efdfd45bbe1cdce72661b7b36b15ffb7874b1b4269e3bd56a14ec0d2166')
pkgdesc="A compatibility layer for running Windows programs (wechat patch version)"
url="https://www.winehq.org"
arch=(x86_64)
options=(staticlibs !lto)
license=(LGPL)
depends=(
  fontconfig      #lib32-fontconfig
  libxcursor      #lib32-libxcursor
  libxrandr       #lib32-libxrandr
  libxi           #lib32-libxi
  gettext         #lib32-gettext
  freetype2       #lib32-freetype2
  desktop-file-utils
)
makedepends=(autoconf bison perl flex mingw-w64-gcc
  giflib                #lib32-giflib
  libxinerama           #lib32-libxinerama
  libxcomposite         #lib32-libxcomposite
  libxxf86vm            #lib32-libxxf86vm
  v4l-utils             #lib32-v4l-utils
  libpulse              #lib32-libpulse
  alsa-lib              #lib32-alsa-lib
  mesa                  #lib32-mesa
  mesa-libgl            #lib32-mesa-libgl
  opencl-icd-loader     #lib32-opencl-icd-loader
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  vulkan-icd-loader     #lib32-vulkan-icd-loader
  sdl2                  #lib32-sdl2
  libcups               #lib32-libcups
  libgphoto2
  sane
  vulkan-headers
  samba
  opencl-headers
)
optdepends=(
  giflib                #lib32-giflib
  libldap               #lib32-libldap
  v4l-utils             #lib32-v4l-utils
  libpulse              #lib32-libpulse
  alsa-plugins          #lib32-alsa-plugins
  alsa-lib              #lib32-alsa-lib
  libxcomposite         #lib32-libxcomposite
  libxinerama           #lib32-libxinerama
  opencl-icd-loader     #lib32-opencl-icd-loader
  gst-plugins-base-libs #lib32-gst-plugins-base-libs
  sdl2                  #lib32-sdl2
  libgphoto2
  sane
  cups
  samba           dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
install=wine.install

prepare() {
  cd $srcdir/$_name-$pkgver
  # fix fcitx position
  patch -p1 < $srcdir/0001-winex11.drv-Update-a-candidate-window-s-position-wit.patch
  # fix wechat shadow
  patch -p1 < $srcdir/0002-wine-wechat.patch
}

build() {
  # Doesn't compile without remove these flags as of 4.10
  export CFLAGS="${CFLAGS/-fno-plt/} -ffat-lto-objects"
  export LDFLAGS="${LDFLAGS/,-z,now/}"
  mkdir -p $srcdir/$_name-$pkgver/build
  cd $srcdir/$_name-$pkgver/build
  ../configure \
    --without-tests \
    --prefix=/usr \
    --libdir=/usr/lib \
    --enable-archs=x86_64,i386
  make
}

package() {
  cd $srcdir/$_name-$pkgver/build
  
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install
  
  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/i386-windows/*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.dll

  ln -sf /usr/bin/wine $pkgdir/usr/bin/wine64

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
