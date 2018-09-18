# Maintainer : Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Previous Maintainer : kuri <sysegv at gmail dot com>
# Contributor : Kevin C <kiven at kiven dot fr>
# Contributor: Alex 'AdUser' Z
pkgname=fusioninventory-agent
_pkgname="FusionInventory-Agent"
pkgver=2.4.1
pkgrel=1
pkgdesc="An application for keeping track of the hardware and software"
arch=(any)
url="http://fusioninventory.org"
_watch="https://github.com/fusinventory/fusioninventory-agent/releases"
license=('GPL')
depends=(
  'perl>=5.8'
  'perl-file-which'
  # Provides LWP::UserAgent
  'perl-libwww>=5.8'
  'perl-net-ip'
  'perl-text-template'
  'perl-universal-require'
  'perl-xml-treepp>=0.26'
  # Daemon mode is required for systemd
  'perl-proc-daemon'
)
makedepends=(
  'perl-http-proxy'
  'perl-http-server-simple'
  'perl-http-server-simple-authen'
  'perl-io-socket-ssl'
  # Provides IO::Capture::Stderr
  'perl-io-capture'
  'perl-ipc-run'
  'perl-lwp-protocol-https'
  # Provided by Perl
  #'perl-json-pp'
  'perl-net-snmp'
  'perl-test-compile'
  'perl-test-deep'
  'perl-test-exception'
  'perl-test-mockmodule'
  'perl-test-mockobject'
  # Provided by 'perl-test-most'
  # 'perl-test-more>=0.93'
  'perl-test-most'
  'perl-test-nowarnings'
)
optdepends=(
# Global
  # FIXME: Not available in the AUR anymore. Provided by perl?
  'perl-compress-zlib: message compression'
  'perl-http-daemon: web interface'
  # >=1.14
  'perl-io-socket-ssl: HTTPS support'
  'perl-lwp-protocol-https: HTTPS support'
  # Required for Systemd. Added to depends.
  'perl-proc-daemon: daemon mode'

# Inventory
  'perl-datetime'
  # >=0.60
  'perl-net-cups: Inventory printers detection'
  # FIXME: Not available in the AUR anymore
  'perl-parse-edid: Inventory EDID data parsing'
  'dmidecode: Inventory DMI data retrieval'
  # Provides lspci
  'pciutils: Inventory PCI bus scanning (lspci)'
  'hdparm: Inventory additional disk drive info retrieval'
  'read-edid: Inventory EDID data access'
  # Provides ssh-keyscan
  'openssh: Inventory host SSH public key retrieval (ssh-keyscan)'

# Deploy
  'perl-archive-extract: Deploy'
  # Provided by Perl
  # 'perl-digest-sha: Deploy'
  'perl-file-copy-recursive: Deploy'
  # Provided by Perl
  #'perl-json-pp: Deploy'
  # Provided by Perl
  #'perl-net-ping: Deploy'
  'perl-parallel-forkmanager: Deploy'
  # Provided by perl-uri
  # 'perl-uri-escape: Deploy'
  'perl-uri: Deploy'

# Network
  # FIXME: not in AUR yet
  'perl-net-nbname: Network'
  'perl-net-snmp: Network inventory'
  # provided by Perl
  # 'perl-thread-queue>=2.0.1'
  'perl-crypt-des: Network inventory SNMPv3 support'
  'nmap: Network discovery'

# Wake-On-Lan
  # provided by perl-net-write
  # 'perl-net-write-layer2: Wake on Lan'
  'perl-net-write: Wake on Lan ethernet method support'
)
checkdepends=(
    'perl-file-copy-recursive'
    # Needed for perl-http-server-simple to work properly
    'perl-cgi'
    'perl-http-proxy'
    'perl-http-server-simple'
    'perl-http-server-simple-authen'
    'perl-io-socket-ssl'
    # Provided by perl-io-capture
    #'perl-io-capture-stderr'
    'perl-io-capture'
    'perl-ipc-run'
    # Provided by Perl
    #'perl-json-pp'
    'perl-net-snmp'
    'perl-lwp-protocol-https'
    'perl-parallel-forkmanager'
    'perl-test-compile'
    'perl-test-deep'
    'perl-test-exception'
    'perl-test-mockmodule'
    # Provided by perl-test-most
    # 'perl-test-more'
    'perl-test-most'
    'perl-test-nowarnings'
    'perl-test-mockobject'
)
source=("https://github.com/fusioninventory/fusioninventory-agent/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "setup.patch")
md5sums=('417fd23dd681f615055b65cd4e414187'
         '51f15a7346dda3d3337b514e73a00132')
backup=('etc/fusioninventory/agent.cfg')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Fixes setup paths. See: https://github.com/fusioninventory/fusioninventory-agent/issues/451#issuecomment-361326178
  patch -Np1 -i "${srcdir}/setup.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  perl Makefile.PL \
    PREFIX="/usr" \
    SYSCONFDIR="/etc/fusioninventory" \
    LOCALSTATEDIR="/var/lib/fusioninventory-agent"

  make
}

# FIXME: stalls at t/agent/http/client/connection.t .................... 7/36
#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#
#  make test
#}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}/"

  install -D -m644 contrib/unix/fusioninventory-agent.service \
    ${pkgdir}/usr/lib/systemd/system/fusioninventory-agent.service
  install -D -m644  etc/agent.cfg \
     ${pkgdir}/etc/agent.cfg

  mkdir -p "${pkgdir}/var/lib/fusioninventory-agent"
}
