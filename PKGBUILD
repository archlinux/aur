# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: robertfoster

pkgname=rtpengine
pkgver=13.0.1.3
pkgrel=1
pkgdesc='The Sipwise media proxy for Kamailio'
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=(
  'bcg729'
  'curl'
  'ffmpeg'
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
  'perl-bencode'
  'perl-config-tiny'
  'perl-exporter-tidy'
  'perl-json'
  'perl-socket6'
  'rtpengine-kernel-dkms'
  'spandsp'
  'systemd-libs'
  'zlib'
)
optdepends=(
  'libiptcdata: iptables management support'
  'mariadb-clients: media playback and call recording daemon support'
)
makedepends=(
  'gperf'
  'pkgconf'
  'pandoc-cli'
)
backup=(
  'etc/rtpengine/rtpengine.conf'
  'etc/rtpengine/rtpengine-recording.conf'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sipwise/rtpengine/archive/refs/tags/mr${pkgver}.tar.gz"
        'rtpengine.sysusers')
sha256sums=('f144ad7b9ddef25bedf872d0bdd18b4884db63fdcb557cbf3bfb99e84e25ca1c'
            'ea1580fbf7372309533e56d2a33714dc4d58311429ba60bf25b1bddee5ff7231')

package() {
  cd "${pkgname}-mr${pkgver}"

  # Install utils
  make DESTDIR="${pkgdir}" install
  # Install daemon
  install -Dvm644 -t "${pkgdir}/etc/${pkgname}" etc/{rtpengine,rtpengine-recording}.conf
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" el/{rtpengine,rtpengine-recording}.service
  # Uses /etc/sysconfig path
  install -Dvm644 el/rtpengine.sysconfig "${pkgdir}/etc/sysconfig/rtpengine"
  install -Dvm644 el/rtpengine-recording.sysconfig "${pkgdir}/etc/sysconfig/rtpengine-recording"
  install -Dvm644 "${srcdir}/rtpengine.sysusers" "${pkgdir}/usr/lib/sysusers.d/rtpengine.conf"
  # Create spool directory
  install -dv "${pkgdir}/var/spool/rtpengine"
  # Install perl modules
  install -Dvm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP" perl/NGCP/Rtpengine.pm
  install -Dvm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP/Rtpclient" perl/NGCP/Rtpclient/*.pm
  install -Dvm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP/Rtpengine" perl/NGCP/Rtpengine/*.pm
}

# vim:set ts=2 sw=2 et:
