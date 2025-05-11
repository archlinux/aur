# Warning: If you are downgrading from the development branch (Wine ≥ 10.1,
# for example), your WINEPREFIX may break and experience unusual bugs.
# Try to make a clean WINEPREFIX, such as by doing “rm -rf ~/.wine”

pkgname=wine-stable
_pkgver=10.0
pkgver=${_pkgver/-/}  # Useful for wine-stable-next
pkgrel=2

source=(https://dl.winehq.org/wine/source/10.0/wine-$_pkgver.tar.xz{,.sign}
        30-win32-aliases.conf
        wine-binfmt.conf
        0001-ntdll-Use-signed-type-for-IAT-offset-in-LdrResolveDe.patch
        0002-winebuild-Avoid-using-.idata-section-for-delay-load-.patch
        0003-msvcrt-Add-truncf-to-the-import-library.patch)
b2sums=('92178cf484cf33e9f3b8340429ee8e68c36e0d25eee4a892f059ab73f103cfcb9eb15e1883bc9fd8c8fe311d4ccbb56582d1f780da7b1406a7839a13addd29ae'
        'SKIP'
        '45db34fb35a679dc191b4119603eba37b8008326bd4f7d6bd422fbbb2a74b675bdbc9f0cc6995ed0c564cf088b7ecd9fbe2d06d42ff8a4464828f3c4f188075b'
        'e9de76a32493c601ab32bde28a2c8f8aded12978057159dd9bf35eefbf82f2389a4d5e30170218956101331cf3e7452ae82ad0db6aad623651b0cc2174a61588'
        '78564cf88803815fe4362830fb0ee55664c4a685a233f24a244f872bd65fcc6dbac6949d225e8b773ad31429d620335a35e28e3fa263a2bb02d590f7676b181c'
        'fc79e9f7f32702af2ef27db69f35867b0891a3d2d0275404d32b22452c52fd65331569c9e4719ea6f0330d3322ef0cf8e5ecb711aff8eb19f7c6578a0e0ec354'
        'a110a496ae1719636c8533c5c416bc0ed676bac49f9a72ca6972463728eeb3e8a86ac8755ddf0120de093cd96ce23216e9b534364694c3282f1a0955ee70ca7c')
validpgpkeys=(DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="https://www.winehq.org/"
arch=(x86_64)
options=(staticlibs !lto)
license=(LGPL-2.1-or-later)
install=wine.install

depends=(
  desktop-file-utils
  fontconfig             lib32-fontconfig
  freetype2              lib32-freetype2
  gcc-libs               lib32-gcc-libs
  gettext                lib32-gettext
  libpcap                lib32-libpcap
  libunwind              lib32-libunwind
  libxcursor             lib32-libxcursor
  libxi                  lib32-libxi
  libxkbcommon           lib32-libxkbcommon
  libxrandr              lib32-libxrandr
  wayland                lib32-wayland
)

makedepends=(
  alsa-lib               lib32-alsa-lib
  gnutls                 lib32-gnutls
  gst-plugins-base-libs  lib32-gst-plugins-base-libs
  libcups                lib32-libcups
  libgphoto2
  libpulse               lib32-libpulse
  libxcomposite          lib32-libxcomposite
  libxinerama            lib32-libxinerama
  libxxf86vm             lib32-libxxf86vm
  mesa                   lib32-mesa
  mingw-w64-gcc
  ocl-icd                lib32-ocl-icd
  opencl-headers
  pcsclite               lib32-pcsclite
  perl
  samba
  sane
  sdl2                   lib32-sdl2
  unixodbc               lib32-unixodbc
  v4l-utils              lib32-v4l-utils
  vulkan-headers
  vulkan-icd-loader      lib32-vulkan-icd-loader
)

optdepends=(
  alsa-lib               lib32-alsa-lib
  alsa-plugins           lib32-alsa-plugins
  cups
  dosbox
  gnutls                 lib32-gnutls
  gst-plugins-bad        lib32-gst-plugins-bad
  gst-plugins-base       lib32-gst-plugins-base
  gst-plugins-base-libs  lib32-gst-plugins-base-libs
  gst-plugins-good       lib32-gst-plugins-good
  gst-plugins-ugly       lib32-gst-plugins-ugly
  libgphoto2
  libpulse               lib32-libpulse
  libxcomposite          lib32-libxcomposite
  libxinerama            lib32-libxinerama
  ocl-icd                lib32-ocl-icd
  pcsclite               lib32-pcsclite
  samba
  sane
  sdl2                   lib32-sdl2
  unixodbc               lib32-unixodbc
  v4l-utils              lib32-v4l-utils
  vulkan-icd-loader      lib32-vulkan-icd-loader
  wine-gecko
  wine-stable-mono
)

provides=(wine=$pkgver)
conflicts=(wine)

prepare() {
  # Allow ccache to work
  mv wine-$_pkgver wine

  for patch in *.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -d wine -p1 -i "../$patch"
    fi
  done

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-{32,64}-build
}

build() {
  cd "$srcdir/wine-64-build"

  # https://bugs.winehq.org/show_bug.cgi?id=43530
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export LDFLAGS="${LDFLAGS/-Wl,-z,now/}"

  # Apply flags for cross-compilation
  export CROSSCFLAGS="-O2 -pipe -g"
  export CROSSCXXFLAGS="-O2 -pipe -g"
  export CROSSLDFLAGS="-Wl,-O1"

  ../wine/configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --without-ffmpeg \
      --with-x \
      --with-wayland \
      --with-gstreamer \
      --enable-win64

  make

  _wine32opts=(
    --libdir=/usr/lib32
    --with-wine64="$srcdir/wine-64-build"
  )

  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/wine-32-build"
  ../wine/configure \
      --prefix=/usr \
      --without-ffmpeg \
      --with-x \
      --with-wayland \
      --with-gstreamer \
      "${_wine32opts[@]}"

  make
}

package() {
  cd "$srcdir/wine-32-build"

  make STRIP=true prefix="$pkgdir/usr" \
       libdir="$pkgdir/usr/lib32" \
       dlldir="$pkgdir/usr/lib32/wine" install

  cd "$srcdir/wine-64-build"
  make STRIP=true prefix="$pkgdir/usr" \
       libdir="$pkgdir/usr/lib" \
       dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf \
     "$pkgdir/etc/fonts/conf.d/30-win32-aliases.conf"
  install -Dm644 "$srcdir/wine-binfmt.conf" \
     "$pkgdir/usr/share/wine/binfmt/wine.conf"
}
