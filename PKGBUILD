# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: robertfoster

pkgname=rtpengine
pkgver=13.3.1.4
pkgrel=1
pkgdesc="A media relay for RTP sessions"
arch=('x86_64')
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')
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
  'libconfig'
  'libcurl-gnutls'
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
  'perl-data-dumper'
  'perl-io-socket-ip'
  'perl-json'
  'perl-socket6'
  'perl-xmlrpc-lite'
  'spandsp'
  'systemd-libs'
  'zlib'
)
makedepends=(
  'gcc'
  'gperf'
  'linux-headers'
  'make'
  'pandoc'
)
checkdepends=(
  'bash'
  'perl-crypt-openssl-rsa'
  'perl-crypt-rijndael'
  'perl-digest-crc'
  'perl-digest-hmac'
  'perl-exporter-tidy'
  'perl-io-multiplex'
  'perl-net-interface'
  'python-websockets'
)
optdepends=('rtpengine-kernel-dkms: Kernel module support for RTPengine')
options=(!emptydirs)
backup=('etc/rtpengine/rtpengine.conf'
        'etc/rtpengine/rtpengine-recording.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sipwise/rtpengine/archive/refs/tags/mr${pkgver}.tar.gz"
        "${pkgname}.sysusers")
sha256sums=('b67f3589b9cf51df80908d80645f323a2bcaf35ee59326b4dc3660a721ed8250'
            '9ee6664c7368cc0466d813c199c997ac4889eb0e72f7f0b51149510cf0ae0b3e')

build() {
  cd "${pkgname}-mr${pkgver}"
  make with_transcoding=yes PREFIX=/usr
}

check() {
  cd "${pkgname}-mr${pkgver}"
  make check
}

package() {
  cd "${pkgname}-mr${pkgver}"
  make DESTDIR="${pkgdir}" with_transcoding=yes PREFIX=/usr install

  # Install configuration files
  install -Dm644 "etc/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm644 "etc/${pkgname}-recording.conf" "${pkgdir}/etc/${pkgname}/${pkgname}-recording.conf"

  # Install systemd service files from the el directory
  install -Dm644 el/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 el/${pkgname}-recording.service "${pkgdir}/usr/lib/systemd/system/${pkgname}-recording.service"

  # Install Perl modules
  install -Dm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP" perl/NGCP/Rtpengine.pm
  install -Dm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP/Rtpclient" perl/NGCP/Rtpclient/*.pm
  install -Dm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP/Rtpengine" perl/NGCP/Rtpengine/*.pm

  # Install the sysusers configuration file
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  # Create spool directory
  install -d "${pkgdir}/var/spool/rtpengine"

  # Remove the usr/libexec directory if it exists
  rm -rf "${pkgdir}/usr/libexec"
}

# vim: set ts=2 sw=2 et:
