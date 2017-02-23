# Maintainer : Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Previous Maintainer : kuri <sysegv at gmail dot com>
# Contributor : Kevin C <kiven at kiven dot fr>
# Contributor: Alex 'AdUser' Z
pkgname=fusioninventory-agent
_pkgname="FusionInventory-Agent"
pkgver=2.3.19
pkgrel=1
pkgdesc="An application for keeping track of the hardware and software"
arch=(any)
url="http://fusioninventory.org"
_watch="https://github.com/fusinv/fusioninventory-agent/releases"
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
  'perl-data-structure-util'
)
makedepends=(
  'perl-http-proxy'
  'perl-http-server-simple'
  'perl-http-server-simple-authen'
  'perl-io-socket-ssl'
  # Provides IO::Capture::Stderr
  'perl-io-captureoutput'
  'perl-ipc-run'
  'perl-test-compile'
  'perl-test-deep'
  'perl-test-exception'
  'perl-test-mockmodule'
  # Provided by 'perl-test-most'
  # 'perl-test-more>=0.93'
  'perl-test-most'
  'perl-test-nowarnings'
  'perl-lwp-protocol-https'
  'perl-test-mockobject'
  'perl-json-pp'
  'perl-net-snmp'
)

optdepends=(
# Global
  'perl-compress-zlib: message compression'
  'perl-http-daemon: web interface'
  'perl-io-socket-ssl>=1.14: HTTPS support'
  'perl-lwp-protocol-https: HTTPS support'
  'perl-proc-daemon: daemon mode'
  'perl-proc-pid-file: daemon mode'

# Inventory
  'perl-parse-edid: Inventory EDID data parsing'
  # FIXME: Doesn't build ATM
  'perl-net-cups>=0.60: Inventory printers detection'
  'perl-datetime'
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
  'perl-json-pp: Deploy'
  # Provided by perl-uri
  # 'perl-uri-escape: Deploy'
  'perl-uri: Deploy'
  'perl-net-ping: Deploy'
  'perl-parallel-forkmanager: Deploy'

# Network
  'perl-net-snmp: Network inventory'
  # FIXME: not in AUR
  # 'perl-net-nbname: Network'
  # provided by perl
  # 'perl-thread-queue>=2.0.1'
  'perl-crypt-des: Network inventory SNMPv3 support'
  'nmap: Network discovery'

# Wake-On-Lan
  # provided by perl-net-write
  # 'perl-net-write-layer2: Wake on Lan'
  'perl-net-write: Wake on Lan ethernet method support'
)
checkdepends=(
    'perl-http-proxy'
    'perl-http-server-simple'
    # TESTME: is it provided by perl-http-server-simple?
    # 'perl-http-server-simple-authen'
    'perl-io-socket-ssl'
    # Provided by perl-io-captureoutput
    #'perl-io-capture-sderr'
    'perl-io-captureoutput'
    'perl-ipc-run'
    'perl-test-compile'
    'perl-test-deep'
    'perl-test-exception'
    'perl-test-mockmodule'
    # Provided by perl-test-most
    # 'perl-test-more'
    'perl-test-most'
    'perl-test-nowarnings'
    'perl-lwp-protocol-https'
    'perl-test-mockobject'
    'perl-json-pp'
    'perl-net-snmp'
    'perl-parallel-forkmanager'
)
source=("https://github.com/fusioninventory/fusioninventory-agent/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  'fusioninventory-agent.service'
  'fusioninventory-agent.config')
md5sums=('4119c8a83604898447c127c7f1a51470'
         'cd0d59b266a41977f51d9e99ecca8cd5'
         '7cce12647a737aadcdd79dee4575aff3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  perl Makefile.PL \
    PREFIX="/usr" \
    SYSCONFDIR="/etc/fusioninventory" \
    LOCALSTATEDIR="/var/lib/fusioninventory-agent"

  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}/"
  install -D -m644 ${srcdir}/fusioninventory-agent.service \
    ${pkgdir}/usr/lib/systemd/system/fusioninventory-agent.service
  mv ${pkgdir}/etc/fusioninventory/agent.cfg \
     ${pkgdir}/etc/fusioninventory/agent.cfg.default
  install -D -m644 ${srcdir}/fusioninventory-agent.config \
    ${pkgdir}/etc/conf.d/fusioninventory-agent
  mkdir -p "${pkgdir}/var/lib/fusioninventory-agent"
}
