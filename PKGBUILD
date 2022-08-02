# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Dan Ziemba <zman0900@gmail.com>
# Contributor: Benjamin Hedrich <kiwisauce (a) pagenotfound (dot) de>

_gitname='tvheadend-git'
pkgname=tvheadend-git
pkgver=4.3.r2028.g1c65e8b0f
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tvheadend.org/"
license=('GPL3')
depends=(
  'avahi'
  'ffmpeg4.4'
  'libavresample'
  'libdvbcsa'
  'libfdk-aac'
  'libhdhomerun'
  'libogg'
  'libtheora'
  'libvorbis'
  'libvpx'
  'openssl'
  'opus'
  'pcre2'
  'pngquant'
  'uriparser'
  'x264'
  'x265'
)
makedepends=(
  'git'
  'python'
)
optdepends=(
  'xmltv: For an alternative source of programme listings'
)
options=('!strip' 'emptydirs')
provides=('tvheadend')
conflicts=('tvheadend')
source=(
  "${_gitname}::git+https://github.com/tvheadend/tvheadend.git"
  tvheadend.service
  tmpfile.conf
  user.conf
  0001-use-ffmpeg4.4.patch
)
sha512sums=('SKIP'
            'd29662ee47f2d0da98d444819f730a8c487999454d60d7397b0f67068300ab5111ffce18befc9fdef5ff8fa1925213716837ea44808fb934197e4a56f98de8a7'
            '1080c8a2530d1f16ab5304cdd81c9c9da23b281e44a4874f4921905c843d876831214af481f9be91a74291ed4a6a10684dbdfb8f926b51bbb6895b92d493b201'
            '5e0475cfe1f915bd3269ba3e9e0ca6cc7e492988bfd4f1feafcbbd3e8b0276c228f0b08a4116f3213d12c0ea940eff0dc71601a6e6ddcda934964cf51a665539'
            'f381843e870723bffe34648e6427a5bbfb85076f59b2def1e89b58bc68db93f06dbd6fe20b508bb72daecf0e832094beae769425c121c632a9d017edd00b8575')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -Np1 -i ../0001-use-ffmpeg4.4.patch
}

build() {
  cd "${srcdir}/${_gitname}"

  # Work-around for GCC 10
  export CFLAGS="$CFLAGS -Wno-error=array-bounds -Wno-error=address"

  ./configure \
    --prefix=/usr \
    --datadir=/var/lib \
    --mandir=/usr/share/man/man1 \
    --python=python3 \
    --enable-avahi \
    --enable-zlib \
    --enable-pngquant \
    --enable-libav \
    --disable-ffmpeg_static --enable-ffmpeg \
    --disable-libx264_static --enable-libx264 \
    --disable-libx265_static --enable-libx265 \
    --disable-libvpx_static --enable-libvpx \
    --disable-libogg_static --enable-libogg \
    --disable-libtheora_static --enable-libtheora \
    --disable-libvorbis_static --enable-libvorbis \
    --disable-libfdkaac_static --enable-libfdkaac \
    --disable-libopus_static --enable-libopus \
    --disable-hdhomerun_static --enable-hdhomerun_client

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="$pkgdir/" install

  install -Dm 644 "${srcdir}/tvheadend.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/user.conf" "${pkgdir}/usr/lib/sysusers.d/tvheadend.conf"
  install -Dm 644 "${srcdir}/tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/tvheadend.conf"
}
