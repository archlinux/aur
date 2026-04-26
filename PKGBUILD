# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: robertfoster

pkgname=rtpengine
pkgver=26.0.1.3
pkgrel=1
pkgdesc="Media relay for RTP sessions (Sipwise proxy)"
arch=('x86_64')
url="https://github.com/sipwise/rtpengine"
license=('GPL-3.0-or-later')

depends=(
  'bcg729' 'curl' 'ffmpeg' 'gcc-libs' 'glib2' 'glibc' 'hiredis'
  'iptables' 'json-glib' 'libconfig' 'libcurl-gnutls' 'libevent'
  'libjwt2' 'libmnl' 'libnftnl' 'libpcap' 'liburing' 'libwebsockets'
  'mariadb-libs' 'mosquitto' 'ncurses' 'openssl' 'opus' 'pcre2'
  'perl' 'perl-bencode' 'perl-config-tiny' 'perl-crypt-openssl-rsa'
  'perl-crypt-rijndael' 'perl-data-dumper' 'perl-digest-crc'
  'perl-digest-hmac' 'perl-io-multiplex' 'perl-io-socket-ip' 'perl-json'
  'perl-libwww' 'perl-net-interface' 'perl-socket6' 'perl-xmlrpc-lite'
  'spandsp' 'systemd-libs' 'xmlrpc-c' 'zlib'
)

makedepends=(
  'gcc'
  'gperf'
  'make'
  'pkgconf'
  'ruby-ronn-ng'
)

checkdepends=(
  'bash'
  'perl-exporter-tidy'
  'python-websockets'
)

optdepends=('rtpengine-kernel-dkms: Kernel module support for RTPengine forwarding')
options=(!emptydirs)

install="${pkgname}.install"

backup=('etc/rtpengine/rtpengine.conf'
        'etc/rtpengine/rtpengine-recording.conf'
        'etc/conf.d/rtpengine')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sipwise/rtpengine/archive/refs/tags/mr${pkgver}.tar.gz"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles"
        "10-kmod.conf")
sha256sums=('50960682ff4b844b2c3f14bf90c35d3d1e4eb938b2accf1030d7230cba985b5a'
            '9ee6664c7368cc0466d813c199c997ac4889eb0e72f7f0b51149510cf0ae0b3e'
            '50330c2dd7c3f3fcb4dd0ed947cbc08139a1255199885299646ebefc48f5f34f'
            '342781f68382a10521dfe2eb1c0527e7f1bab18435995ea41da8eb57ca7d7e9d')

prepare() {
  cd "${pkgname}-mr${pkgver}"

  # Fix paths for Arch Linux /etc/conf.d standard
  sed -i 's|/etc/sysconfig/|/etc/conf.d/|g' el/${pkgname}.service
  sed -i 's|/etc/sysconfig/|/etc/conf.d/|g' el/${pkgname}-recording.service

  # Fix upstream binary option parsing bug
  sed -i 's|${CFG_FILE}|${CONFIG_FILE}|g' el/${pkgname}.service

  # Correct PID location for unprivileged execution
  sed -i 's|/run/rtpengine.pid|/run/rtpengine/rtpengine.pid|g' el/${pkgname}.sysconfig

  # Bypass Debian changelog version parsing
  sed -i "s|dpkg-parsechangelog.*|echo ${pkgver} |g" daemon/Makefile || true
}

build() {
  cd "${pkgname}-mr${pkgver}"
  make with_transcoding=yes PREFIX=/usr
}

check() {
  cd "${pkgname}-mr${pkgver}"
  make check || warning "Some tests may fail in isolated environments."
}

package() {
  cd "${pkgname}-mr${pkgver}"
  make DESTDIR="${pkgdir}" with_transcoding=yes PREFIX=/usr install

  # Install configs with restricted permissions
  install -Dm640 "etc/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
  install -Dm640 "etc/${pkgname}-recording.conf" "${pkgdir}/etc/${pkgname}/${pkgname}-recording.conf"

  # Systemd and Environment setup
  install -Dm644 el/${pkgname}.sysconfig "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 el/${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 el/${pkgname}-recording.service "${pkgdir}/usr/lib/systemd/system/${pkgname}-recording.service"

  # Load separate Arch-specific configuration files
  install -Dm644 "${srcdir}/10-kmod.conf" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service.d/10-kmod.conf"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

  # Perl modules
  install -Dm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP" perl/NGCP/Rtpengine.pm
  install -Dm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP/Rtpclient" perl/NGCP/Rtpclient/*.pm
  install -Dm644 -t "${pkgdir}/usr/share/perl5/vendor_perl/NGCP/Rtpengine" perl/NGCP/Rtpengine/*.pm

  # Directories and Cleanup
  install -d "${pkgdir}/var/spool/rtpengine"
  rm -rf "${pkgdir}/usr/libexec"
}
