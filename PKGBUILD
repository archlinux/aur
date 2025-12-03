# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Alexander Paetzelt <techge+arch [ät] posteo [do] net>

pkgname=kismet-full-git
pkgver=2025_12_R0.r12232.20251107.97d2dd89c
pkgrel=1
pkgdesc="A sniffer, WIDS, and wardriving tool for Wi-Fi, Bluetooth, Zigbee, RF. Latest git checkout, built with as many features as possible."
url="https://www.kismetwireless.net/"
arch=(
  'x86_64'
  'armv7h'
  'aarch64'
  'i686'
)
license=('GPL-2.0-or-later')
depends=(
  'abseil-cpp'
  'bladerf'
  'bluez-libs'
  'gcc-libs'
  'glibc'
  'libcap'
  'libelf'
  'libnl'
  'libnm'
  'libcap-ng'
  'libcrypto.so'
  'libgobject-2.0.so'
  'libpcap'
  'libprotobuf.so'
  'libusb'
  'libwebsockets'
  'lm_sensors'
  'mosquitto'
  'pcre2'
  'rtl-sdr'
  'sqlite'
  'sh'
  'ubertooth'
  'zlib'
)
makedepends=(
  'git'

  'glib2'
  'openssl'
  'protobuf'
)
optdepends=(
  'festival: text-to-speech support'
  'flite:  alternative/lightweight text-to-speech support'
  'gpsd: log coordinates of detected networks'
  'hackrf: use with HackRF compatible software defined radio (SDR)'
  'sox: provide the default kismet sound playback binary'
  'wireshark-cli: mergecap, to merge multiple capture files'
  'libbtbb: bluetooth baseband decoding library'
  'kismet-docs: For documentation'
)
backup=(#
  etc/kismet/kismet.conf
  etc/kismet/kismet_80211.conf
  etc/kismet/kismet_alerts.conf
  etc/kismet/kismet_filter.conf
  etc/kismet/kismet_httpd.conf
  etc/kismet/kismet_logging.conf
  etc/kismet/kismet_memory.conf
  etc/kismet/kismet_uav.conf
  etc/kismet/kismet_wardrive.conf
)
provides=(
  "kismet=${pkgver}"
  "kismet-full=${pkgver}"
  "kismet-git=${pkgver}"
)
conflicts=(
  'kismet'
)
install="kismet.install"
source=(
  "git+https://github.com/kismetwireless/kismet"
  "kismet-sysusers.conf"
)
sha256sums=(
  'SKIP'
  '0ac08bf5016e00596e2fc0bc89e7907c2186b811ed8d8a2bffe6b95b42e147a3'
)

prepare() {
  cd "$srcdir/kismet"

  ./tools/mkversion.sh

  autoreconf -fiv
  git log > git.log
}

pkgver() {
  cd "$srcdir/kismet"

  #_ver="$(git describe --tags | sed -E -e 's|^kismet-||' -e 's|^[vV]||' -e 's|-|_|g' -e 's|_([0-9]+)_g[0-9a-f]+$|+\1|' -e 's|\-g[0-9a-f]+$||' )"
  _ver_major="$(grep -E '^[[:space:]]*const[[:space:]]+.*VERSION_MAJOR[[:space:]]*=' version.c | awk -F= '{print $2}' | tr -d '";[[:space:]]')"
  _ver_minor="$(grep -E '^[[:space:]]*const[[:space:]]+.*VERSION_MINOR[[:space:]]*=' version.c | awk -F= '{print $2}' | tr -d '";[[:space:]]')"
  _ver_tiny="$(grep -E '^[[:space:]]*const[[:space:]]+.*VERSION_TINY[[:space:]]*=' version.c | awk -F= '{print $2}' | tr -d '";[[:space:]]')"
  _ver="${_ver_major}_${_ver_minor}_R${_ver_tiny}"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver_major}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "$srcdir/kismet"

  local _silencewarnings _warning
  _silencewarnings=(
    'stringop-overread'
  )
  for _warning in "${_silencewarnings[@]}"; do
    CFLAGS+=" -Wno-${_warning} -Wno-error=${_warning}"
    CXXFLAGS+=" -Wno-${_warning} -Wno-error=${_warning}"
  done
  export CFLAGS
  export CXXFLAGS

  # * python- modules are deprecated and not used anymore. '--enable-python-tools' is needed to build `btgeier`.
  # * protobuf is deprecated. Enable the functionality (compatibility with old sources) anyway, since we explicitly build all possible features in this package.
  ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc/kismet \
    --with-suidgroup=315 \
    --enable-protobuf \
    --disable-protobuflite \
    --enable-python-tools \
    --disable-debuglibs \
    --enable-largefile \
    --enable-mutextimeout \
    --enable-linuxwext \
    --enable-libcap \
    --enable-pcre \
    --disable-prelude \
    --enable-libwebsockets \
    --enable-btgeiger \
    --enable-bladerf \
    --enable-libnm \
    --enable-libusb \
    --enable-wifi-coconut \
    --enable-ubertooth \
    --enable-librtlsdr \
    --enable-mosquitto \
    --enable-lmsensors \
    --enable-optimization \
    --enable-year2038

  make all plugins
}

package() {
  cd "$srcdir/kismet"
  make DESTDIR="$pkgdir/" install
  # install systemd service
  install -vDm 644 "packaging/systemd/kismet.service" "${pkgdir}/usr/lib/system/systemd/kismet.service"

  # Makepkg strip bug #43600
  chmod u+w "${pkgdir}"/usr/bin/kismet*
  chmod o-x "${pkgdir}"/usr/bin/kismet_cap*
  chown 0:315 "${pkgdir}"/usr/bin/kismet_cap*

  # create group kismet via sysusers
  cd "$srcdir"
  install -vDm 644 "kismet-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/kismet.conf"

  cd "$srcdir/kismet"
  install -vDm 644 -t "${pkgdir}/usr/share/doc/kismet"  git.log README.md README.SSL README.OLD
  install -vDm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}

# vim: set ts=4 sw=4 et:
