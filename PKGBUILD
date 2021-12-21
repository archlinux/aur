# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_wine_commit=2f5f8b4bd4cb5771223d1ee96a55002d18ad01eb
_stag_commit=8f579c4eed5fa8114f277f93b915cf455d7837c9

pkgname=wine-ge-custom
_srctag=7.0rc2-GE-1
pkgver=${_srctag//-/.}
pkgrel=2

#_winever=${pkgver%.*}
_winever=$pkgver
_pkgbasever=${pkgver/rc/-rc}

source=(wine-ge-custom::git+https://github.com/GloriousEggroll/wine-ge-custom.git#tag=${_srctag}
        wine::git+https://github.com/wine-mirror/wine.git#commit=${_wine_commit}
        wine-staging::git+https://github.com/wine-staging/wine-staging.git#commit=${_stag_commit}
        wine-more_8x5_res.patch
        wine-wmclass.patch
        wine-isolate_home.patch
        30-win32-aliases.conf
        wine-binfmt.conf)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '13b0a9b1712eb3bf847a7bc78a46d5d32d6a8358c59b94289594811c2f25de925334aa7f76033176b49156117ada1c58bc1425a3e8514cbf305c27650a2b84e2'
            '30437d8ee92c5741fa50a7fe346ccfc48ba809dad0d740903a05a67781d23ea38a5094038a070a253e3fdd8046783b46a5420df6361bdd30cb229d3d88107569'
            '3dcdbd523fcbe79b9e9e9b026b9d0a5edf296514c7b48bd465d2dc05a8ca08e23ba8817e2de08edfe52286a2a2f81db42b65f71254cabe496752b9d45131d282'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285')
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs - GloriousEggroll branch"
url="https://github.com/GloriousEggroll/wine-ge-custom"
arch=(x86_64 x86_64_v3)
options=(!staticlibs !lto)
license=(LGPL)

depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  faudio           lib32-faudio
  desktop-file-utils
)

makedepends=(autoconf bison perl fontforge flex mingw-w64-gcc
  git
  giflib                lib32-giflib
  libpng                lib32-libpng
  gnutls                lib32-gnutls
  libxinerama           lib32-libxinerama
  libxcomposite         lib32-libxcomposite
  libxmu                lib32-libxmu
  libxxf86vm            lib32-libxxf86vm
  libldap               lib32-libldap
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libpulse              lib32-libpulse
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  libcups               lib32-libcups
  sane
  libgphoto2
  gsm
  ffmpeg
  samba
  opencl-headers
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
  ffmpeg
  cups
  samba           dosbox
)

provides=("wine=${_srctag%%-*}" "wine-wow64=${_srctag%%-*}")
conflicts=('wine' 'wine-wow64')
install=wine.install

prepare() {
  pushd $pkgname
    rm -r wine && cp -r "$srcdir"/wine wine
    rm -r wine-staging && cp -r "$srcdir"/wine-staging wine-staging
    patches/protonprep.sh
    pushd wine
      patch -p1 -i "$srcdir"/wine-more_8x5_res.patch
      patch -p1 -i "$srcdir"/wine-wmclass.patch
      patch -p1 -i "$srcdir"/wine-isolate_home.patch
      dlls/winevulkan/make_vulkan
      tools/make_requests
      autoreconf -f
    popd
  popd

  sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i $pkgname/wine/configure*

  # Fix openldap 2.5+ detection
  sed 's/-lldap_r/-lldap/' -i $pkgname/wine/configure

  # Get rid of old build dirs
  rm -rf $pkgname-{32,64}-build
  mkdir $pkgname-{32,64}-build
}

build() {
  cd "$srcdir"

  # Doesn't compile without remove these flags as of 4.10
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/,-z,now/}"
  # MingW Wine builds fail with relro
  export LDFLAGS="${LDFLAGS/,-z,relro/}"

  export CFLAGS="-O2 -march=nocona -mtune=core-avx2 -pipe"
  export CXXFLAGS="-O2 -march=nocona -mtune=core-avx2 -pipe"
  export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

  # Disable AVX instead of using 02, same as dxvk, the rest are from Proton
  export CFLAGS+=" -mno-avx -mno-avx2"
  export CXXFLAGS+=" -mno-avx -mno-avx2"
  export CFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf"
  export CXXFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf -std=c++17"

  export CROSSCFLAGS="$CFLAGS"
  export CROSSCXXFLAGS="$CXXFLAGS"
  export CROSSLDFLAGS="$LDFLAGS -Wl,--file-alignment,4096"

  msg2 "Building Wine-64..."

  cd "$srcdir/$pkgname-64-build"
  ../$pkgname/wine/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-faudio \
    --with-gstreamer \
    --with-mingw \
    --with-alsa \
    --without-oss \
    --disable-winemenubuilder \
    --disable-win16 \
    --disable-tests \
    --enable-win64 \
    --with-xattr

  make

  msg2 "Building Wine-32..."

  export CFLAGS+=" -mstackrealign"
  export CXXFLAGS+=" -mstackrealign"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  cd "$srcdir/$pkgname-32-build"
  ../$pkgname/wine/configure \
    --prefix=/usr \
    --with-x \
    --with-faudio \
    --with-gstreamer \
    --with-mingw \
    --with-alsa \
    --without-oss \
    --disable-winemenubuilder \
    --disable-win16 \
    --disable-tests \
    --with-xattr \
    --libdir=/usr/lib32 \
    --with-wine64="$srcdir/$pkgname-64-build"

  make
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/$pkgname-32-build"

  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib32" \
    dlldir="$pkgdir/usr/lib32/wine" install

  msg2 "Packaging Wine-64..."
  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib32/wine/i386-windows/*.{dll,exe}
  x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/usr/lib/wine/x86_64-windows/*.{dll,exe}

  find "$pkgdir"/usr/lib{,32}/wine -iname "*.a" -delete
  find "$pkgdir"/usr/lib{,32}/wine -iname "*.def" -delete
}

# vim:set ts=8 sts=2 sw=2 et:
