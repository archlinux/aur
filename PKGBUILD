# Maintainer: Cédric Schieli <cschieli@gmail.com>

pkgname=tvheadend-satip-server-git
_gitname='tvheadend-git'
pkgver=4.3.r1979.g8fc2dfa7e
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tvheadend.org/"
license=('GPL3')
depends=(
  'dbus'
  'openssl'
  'pcre2'
  'uriparser'
)
makedepends=(
  'git'
  'python'
)
options=('!strip' 'emptydirs')
provides=('tvheadend')
conflicts=('tvheadend' 'tvheadend-git')
backup=('etc/conf.d/tvheadend')
source=(
  "${_gitname}::git+https://github.com/tvheadend/tvheadend.git"
  'dvb-scan-tables::git+https://git.linuxtv.org/dtv-scan-tables.git'
  tvheadend.conf
  dbus.conf
  tvheadend.service
  tmpfile.conf
  user.conf
)
sha512sums=('SKIP'
            'SKIP'
            'f7f630d60217ae64d529d4573c3dbce3f57f2bb1ddd952b789232cd199155591c373ac8986006b9f4f64dbe64f40e18b00b8b3174d4f0c0f4310573d7ae79117'
            '5439d5bacd256a0d3b78b87d176638250e043ce3786fa4a72af36fcbde044d6b4301a6d45f83ccd9ef3eeaf353e909a6c418581972476a30e31776f6fd7330ef'
            '480b0213ccb7dad409027b3e66eeb97035350ff9e145b91dbe4fed8569bac12dd77756fc01aa2ac6bf0127683ab053152e05ac575dfada3c505613ebfc0160ce'
            '1080c8a2530d1f16ab5304cdd81c9c9da23b281e44a4874f4921905c843d876831214af481f9be91a74291ed4a6a10684dbdfb8f926b51bbb6895b92d493b201'
            '5e0475cfe1f915bd3269ba3e9e0ca6cc7e492988bfd4f1feafcbbd3e8b0276c228f0b08a4116f3213d12c0ea940eff0dc71601a6e6ddcda934964cf51a665539')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}"
    _dvbscan="${_gitname}/data/dvb-scan"
    rm -rf "${_dvbscan}"
    cp -a "dvb-scan-tables" "${_dvbscan}"
    rm -rf "${_dvbscan}/.git"
    touch "${_dvbscan}/.stamp"
}

build() {
  cd "${srcdir}/${_gitname}"

  # Work-around for GCC 10
  export CFLAGS="${CFLAGS} -fcommon"

  ./configure \
    --prefix=/usr \
    --datadir=/var/lib \
    --mandir=/usr/share/man/man1 \
    --python=python3 \
    --disable-avahi \
    --enable-zlib \
    --disable-pngquant \
    --disable-libav \
    --disable-ffmpeg_static --disable-ffmpeg \
    --disable-libx264_static --disable-libx264 \
    --disable-libx265_static --disable-libx265 \
    --disable-libvpx_static --disable-libvpx \
    --disable-libogg_static --disable-libogg \
    --disable-libtheora_static --disable-libtheora \
    --disable-libvorbis_static --disable-libvorbis \
    --disable-libfdkaac_static --disable-libfdkaac \
    --disable-libopus_static --disable-libopus \
    --disable-hdhomerun_static --disable-hdhomerun_client \
    --disable-cardclient \
    --disable-cwc \
    --disable-cccam \
    --disable-capmt \
    --disable-constcw \
    --disable-satip_client \
    --disable-iptv \
    --disable-timeshift \
    --disable-vaapi \
    --disable-inotify \
    --enable-epoll \
    --disable-pcre \
    --disable-ccache \
    --disable-tvhcsa \
    --enable-dbus_1 \
    --enable-libsystemd_daemon \
    --disable-pcloud_cache \
    --disable-ddci

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="$pkgdir/" install

  install -Dm 644 "${srcdir}/tvheadend.conf" "${pkgdir}/etc/conf.d/tvheadend"
  install -Dm 644 "${srcdir}/dbus.conf" "${pkgdir}/usr/share/dbus-1/system.d/tvheadend.conf"
  install -Dm 644 "${srcdir}/tvheadend.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/user.conf" "${pkgdir}/usr/lib/sysusers.d/tvheadend.conf"
  install -Dm 644 "${srcdir}/tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/tvheadend.conf"
}
