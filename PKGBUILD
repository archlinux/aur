# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: robertfoster

pkgname=rtpengine
pkgver=12.5.1.3
pkgrel=1
pkgdesc='The Sipwise media proxy for Kamailio'
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=(
  'curl'
  'gcc-libs'
  'glib2'
  'glibc'
  'hiredis'
  'iptables'
  'json-glib'
  'libevent'
  'libmnl'
  'libnftnl'
  'libpcap'
  'liburing'
  'libwebsockets'
  'libxmlrpc'
  'mariadb-libs'
  'mosquitto'
  'ncurses'
  'openssl'
  'opus'
  'pcre2'
  'perl'
  'rtpengine-kernel-dkms'
  'spandsp'
  'systemd-libs'
  'zlib'
)
optdepends=(
  'bcg729: G.729 transcoding support'
  'ffmpeg: transcoding support'
  'libiptcdata: iptables management support'
  'mariadb-clients: media playback and call recording daemon support'
)
makedepends=(
  'gperf'
  'pkgconf'
  'pandoc-cli'
  'gcc13'
)
backup=(
  'etc/rtpengine/rtpengine.conf'
  'etc/rtpengine/rtpengine-recording.conf'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sipwise/rtpengine/archive/refs/tags/mr${pkgver}.tar.gz"
        'rtpengine.sysusers')
sha256sums=('77e36ca170c540b1d38e6b1041f1f15d9ef2613fcbe5d8417cb09332e48b9e35'
            'ea1580fbf7372309533e56d2a33714dc4d58311429ba60bf25b1bddee5ff7231')

package() {
  cd "${pkgname}-mr${pkgver}"

  # Fails to build with gcc-14
  export CC=gcc-13 CXX=g++-13
  # Install utils
  make DESTDIR="${pkgdir}" install
  # Install daemon
  install -Dvm644 -t "${pkgdir}/etc/${pkgname}" etc/{rtpengine,rtpengine-recording}.conf
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" el/{rtpengine,rtpengine-recording}.service
  # Uses /etc/sysconfig path
  install -Dvm644 el/rtpengine.sysconfig "${pkgdir}/etc/sysconfig/rtpengine"
  install -Dvm644 el/rtpengine-recording.sysconfig "${pkgdir}/etc/sysconfig/rtpengine-recording"
  install -Dvm644 "${srcdir}/rtpengine.sysusers" "${pkgdir}/usr/lib/sysusers.d/rtpengine.conf"
  install -dv "${pkgdir}/var/spool/rtpengine"
}

# vim: ts=2 sw=2 et:
