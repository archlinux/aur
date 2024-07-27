# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: robertfoster

pkgname=rtpengine
pkgver=12.4.1.7
pkgrel=1
pkgdesc='The Sipwise media proxy for Kamailio'
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=(
  'json-glib'
  'zlib'
  'openssl'
  'pcre'
  'pcre2'
  'libxmlrpc'
  'hiredis'
  'libcurl-compat'
  'libevent'
  'libpcap'
  'systemd-libs'
  'spandsp'
  'mosquitto'
  'libwebsockets'
  'opus'
  'perl-config-tiny'
)
optdepends=(
  'mariadb-clients: Media playback and call recording daemon support'
  'libiptcdata: Iptables management support'
  'ffmpeg: Transcoding support'
  'bcg729: G.729 transcoding support'
  'rtpengine-kernel-dkms: Kernel module for rtpengine media proxy'
  'linux-lts-headers: Build the module for LTS Arch kernel'
)
makedepends=(
  'gperf'
  'glib2'
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
sha256sums=('0ad6475f03ae6a9afd527a3077388339900c73d13ff88d7f61597150949eb8c2'
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

# vim:set ts=2 sw=2 et:
