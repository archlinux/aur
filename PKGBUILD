# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-photoshop
pkgver=11.0
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=("git+https://gitlab.winehq.org/wine/wine.git?signed#tag=wine-$_pkgbasever"
        "https://patch-diff.githubusercontent.com/raw/ValveSoftware/wine/pull/310.patch"
        30-win32-aliases.conf
        wine-binfmt.conf
        ntsync.conf)
sha512sums=('15afacf4796a92588201a100f4da001533ab350d6bec3b0f03a540fa594a4aa06aaaa4987789fe5ce7edc47da1509f8bf953d876368c61a9ae4df9128d247ec0'
            'a0748e0f87230e9a5956be46f9f1c8d708723f252f22c7b09fb9a5b476c09be32aa1fc6ae4b568f80e33b438d4022e7a1e200bd7865ad9b79d81639b8d29a09b'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
            'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
            'ac2bd634838ffe6b90f2637e229013f0993fc1013271dbeefd216dc262a8bb79e4a5ce15a75cbfcb0c3b521d32f4ebe1ed25a6b066b99cc327b60bd6d7212e6f')
validpgpkeys=(5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7
              DA23579A74D4AD9AF9D3F945CEFAC8EAAF17519D)

pkgdesc="A compatibility layer for running Windows programs"
url="https://www.winehq.org"
arch=(x86_64)
options=(!lto pestrip)
license=(LGPL-2.1-or-later)
depends=(
  desktop-file-utils
  fontconfig
  freetype2
  gcc-libs
  gettext
  libpcap
  libunwind
  libxcursor
  libxkbcommon
  libxi
  libxrandr
  wayland
)
makedepends=(
  alsa-lib
  ffmpeg
  git
  gnutls
  gst-plugins-base-libs
  libcups
  libgphoto2
  libpulse
  libxcomposite
  libxinerama
  libxxf86vm
  mesa
  mingw-w64-gcc
  opencl-headers
  opencl-icd-loader
  pcsclite
  perl
  samba
  sane
  sdl2
  unixodbc
  v4l-utils
  vulkan-headers
  vulkan-icd-loader
)
optdepends=(
  alsa-lib
  alsa-plugins
  cups
  dosbox
  ffmpeg
  gnutls
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gst-plugins-ugly
  libgphoto2
  libpulse
  libxcomposite
  libxinerama
  opencl-icd-loader
  pcsclite
  samba
  sane
  sdl2
  unixodbc
  v4l-utils
  wine-gecko
  wine-mono
)
install=wine.install

provides=(wine)
conflicts=(wine)

prepare() {
  # Get rid of old build dirs
  rm -rf $pkgname-64-build
  mkdir $pkgname-64-build

  cd wine
  patch -Np1 -i ../310.patch || echo "will fail but anyway..."
}

build() {
  # Apply flags for cross-compilation
  export CROSSCFLAGS="-O2 -pipe -g"
  export CROSSCXXFLAGS="-O2 -pipe -g"
  export CROSSLDFLAGS="-Wl,-O1"

  # Make sure correct source file paths are recorded in debug information,
  # so that wine crash reports can have correct paths
  if [[ $CFLAGS =~ (-ffile-prefix-map=[^[:space:]]+) ]]; then
    CROSSCFLAGS="$CROSSCFLAGS ${BASH_REMATCH[1]}"
    CROSSCXXFLAGS="$CROSSCXXFLAGS ${BASH_REMATCH[1]}"
  fi

  cd "$srcdir/$pkgname-64-build"
  ../wine/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --disable-tests \
    --enable-archs=x86_64,i386 \
    --enable-build-id

  make
}

package() {
  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  # Load ntsync module
  install -Dm644 "$srcdir/ntsync.conf" "$pkgdir/usr/lib/modules-load.d/10-ntsync.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
