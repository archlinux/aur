# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Dan Ziemba <zman0900@gmail.com>
# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

pkgname=tvheadend-git
pkgver=4.3.r2165.gdd884b8
pkgrel=1
pkgdesc='TV streaming server and DVR'
#arch=(x86_64)
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://tvheadend.org/
license=(GPL3)
depends=(avahi ffmpeg libdvbcsa libfdk-aac libhdhomerun libogg libtheora libvorbis libvpx
         openssl opus pcre2 pngquant uriparser x264 x265)
makedepends=(git python)
optdepends=('xmltv: alternative source of programme listings')
# NOTE: !lto : to avoid build errors in case lto is enabled (in makepkg.conf). See https://tvheadend.org/issues/6026
options=(!lto !strip emptydirs)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/tvheadend/tvheadend.git"
        tmpfile.conf
        tvheadend.service
        user.conf)
sha256sums=('SKIP'
            'b01fa913421e67e40bc1aa5da079e30cb1d8c20913133ded1ad651d6ce84b9b6'
            'a8e95cd2ec5626a47f49c0aa1f8524d6e155809cfbf6504b9a1484afdf62cfb7'
            '35786e211d4cbf6de213f28e7382378f27f3bef17458e8533ad43fed06e7f202')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname

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
    --enable-avahi \
    --enable-libav \
    --enable-pngquant \
    --enable-vaapi \
    --enable-zlib \
    --mandir=/usr/share/man/man1 \
    --prefix=/usr \
    --python=python3

  make
}

package() {
  make -C $pkgname DESTDIR="$pkgdir/" install

  install -Dm644 tmpfile.conf         "$pkgdir/usr/lib/tmpfiles.d/tvheadend.conf"
  install -Dm644 tvheadend.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 user.conf            "$pkgdir/usr/lib/sysusers.d/tvheadend.conf"
}
