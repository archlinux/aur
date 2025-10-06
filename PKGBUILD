# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Dan Ziemba <zman0900@gmail.com>
# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

pkgname=tvheadend-git
pkgver=4.3.r2475.gb6d5803
pkgrel=1
pkgdesc='TV streaming server and DVR'
#arch=(x86_64)
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://tvheadend.org
license=(GPL-3.0-or-later)
depends=(
  avahi ffmpeg libiconv libdvbcsa libfdk-aac libogg libtheora libvorbis libvpx
  openssl opus pcre2 pngquant uriparser x264 x265)
makedepends=(git python)
optdepends=(
  'libhdhomerun: HDHomeRun support'
  'xmltv: alternative source of programme listings')
options=(!buildflags !strip emptydirs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "$pkgname::git+https://github.com/tvheadend/tvheadend.git"
  tmpfile.conf
  tvheadend.service
  user.conf)
sha256sums=(
  'SKIP'
  'b01fa913421e67e40bc1aa5da079e30cb1d8c20913133ded1ad651d6ce84b9b6'
  'a8e95cd2ec5626a47f49c0aa1f8524d6e155809cfbf6504b9a1484afdf62cfb7'
  '35786e211d4cbf6de213f28e7382378f27f3bef17458e8533ad43fed06e7f202')

# Disable libav, if the FFmpeg version is not known to support libav
_print_libav_option() {
  local ffmpeg_supported ffmpeg_installed libav_option

  # Compare major version numbers of ffmpeg
  ffmpeg_supported="$(awk '$1 == "FFMPEG" { print $3 }' Makefile.ffmpeg | sed 's/^ffmpeg-//' | cut -d'.' -f1)"
  ffmpeg_installed="$(pacman -Q ffmpeg | awk '{ print $2 }' | sed 's/^ *//;s/r.*[.]//;s/.*://' | cut -d'.' -f1)"

  # Check the version supported by this package (and allow lower versions).
  # Optionally, check the version supported by Tvheadend
  if ((ffmpeg_installed <= 8)) || ((ffmpeg_supported > 0 && ffmpeg_supported == ffmpeg_installed)); then
    libav_option='--enable-libav'
  else
    libav_option='--disable-libav'
  fi

  echo -n "$libav_option"
}

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

  local libav_option
  libav_option="$(_print_libav_option)"
  printf 'Checking for libav (ffmpeg transcoding) support: %s\n' "$libav_option"

  local libhdhomerun_option=
  if pacman -Q libhdhomerun >/dev/null 2>&1; then
    libhdhomerun_option='--enable-hdhomerun_client'
  fi

  ./configure \
    --datadir=/var/lib \
    --disable-ffmpeg_static \
    --disable-hdhomerun_static \
    --disable-libfdkaac_static \
    --disable-libogg_static \
    --disable-libopus_static \
    --disable-libtheora_static \
    --disable-libvorbis_static \
    --disable-libvpx_static \
    --disable-libx264_static \
    --disable-libx265_static \
    "$libav_option" \
    $libhdhomerun_option \
    --enable-avahi \
    --enable-pngquant \
    --enable-vaapi \
    --enable-zlib \
    --mandir=/usr/share/man \
    --prefix=/usr \
    --python=python3 \
    \
    --cflags='-Wno-format-truncation' # --nowerror

  make
}

package() {
  make -C $pkgname DESTDIR="$pkgdir/" install

  install -Dm644 tmpfile.conf "$pkgdir/usr/lib/tmpfiles.d/tvheadend.conf"
  install -Dm644 tvheadend.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 user.conf "$pkgdir/usr/lib/sysusers.d/tvheadend.conf"
}
