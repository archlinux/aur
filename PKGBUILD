# Maintainer : Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Previous Maintainer : kuri <sysegv at gmail dot com>
# Contributor : Kevin C <kiven at kiven dot fr>
# Contributor: Alex 'AdUser' Z
pkgname=fusioninventory-agent
_pkgname="FusionInventory-Agent"
pkgver=2.6
pkgrel=1
pkgdesc="An application for keeping track of the hardware and software"
arch=(any)
url="http://fusioninventory.org"
_watch="https://github.com/fusioninventory/fusioninventory-agent/releases"
license=('GPL')
depends=(
  'perl>=5.8'
  # Needed for perl-http-server-simple to work properly. See https://bugs.archlinux.org/task/62707?project=5&string=perl-http-server-simple
  'perl-cgi'
  'perl-file-which'
  'perl-http-server-simple'
  'perl-http-server-simple-authen'
  'perl-io-socket-ssl>=1.14'
  # Provides IO::Capture::Stderr
  'perl-io-capture'
  'perl-ipc-run'
  # Provided by Perl
  #'perl-json-pp'
  # Provides LWP::UserAgent
  'perl-libwww>=5.8'
  'perl-lwp-protocol-https'
  'perl-net-ip'
  'perl-net-snmp'
  'perl-text-template'
  'perl-universal-require'
  'perl-xml-treepp>=0.26'
  # Daemon mode is required for systemd
  'perl-proc-daemon'
)
optdepends=(
# Global
  # FIXME: Not available in the AUR anymore. Provided by perl?
  'perl-compress-zlib: message compression'
  'perl-http-daemon: web interface'
  'perl-io-socket-ssl>=1.14: HTTPS support'
  'perl-lwp-protocol-https: HTTPS support'
  'perl-proc-pid-file'

# Inventory
  'perl-datetime'
  'perl-net-cups>=0.60: Inventory printers detection'
  # FIXME: Not available in the AUR anymore
  'perl-parse-edid: Inventory EDID data parsing'
  'dmidecode: Inventory DMI data retrieval'
  # Provides lspci
  'pciutils: Inventory PCI bus scanning (lspci)'
  'hdparm: Inventory additional disk drive info retrieval'
  # Provides get-edid
  'read-edid: Inventory EDID data access'
  # Provides ssh-keyscan
  'openssh: Inventory host SSH public key retrieval (ssh-keyscan)'

# Deploy
  'perl-archive-extract: Deploy'
  # Provided by Perl
  #'perl-digest-sha: Deploy'
  'perl-file-copy-recursive: Deploy'
  # Provided by Perl
  #'perl-json-pp: Deploy'
  # Provided by Perl
  #'perl-net-ping: Deploy'
  'perl-parallel-forkmanager: Deploy'
  # Provided by perl-uri
  #'perl-uri-escape: Deploy'
  'perl-uri: Deploy'

# Network
  # FIXME: not in AUR yet
  'perl-net-nbname: Network'
  'perl-net-snmp: Network inventory'
  # provided by Perl
  #'perl-thread-queue>=2.0.1'
  'perl-crypt-des: Network inventory SNMPv3 support'
  'nmap: Network discovery'
  'net-tools: ARP table lookup method support'

# Wake-On-Lan
  # provided by perl-net-write
  #'perl-net-write-layer2: Wake on Lan'
  'perl-net-write: Wake on Lan ethernet method support'
)
checkdepends=(
  'perl-file-copy-recursive'
  'perl-http-proxy'
  'perl-parallel-forkmanager'
  'perl-test-compile'
  'perl-test-cpan-meta'
  'perl-test-deep'
  'perl-test-exception'
  'perl-test-mockmodule'
  'perl-test-mockobject'
  # Provided by 'perl-test-most'
  #'perl-test-more>=0.93'
  'perl-test-most'
  'perl-test-nowarnings'
)
source=("${_watch}/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "package.patch")
md5sums=('6c56ffd7a959c1b5482e6967f519d625'
         'c3896747249badd126b65f0f3e8c822f')
backup=('etc/fusioninventory/agent.cfg'
        'etc/fusioninventory/inventory-server-plugin.cfg'
        'etc/fusioninventory/server-test-plugin.cfg'
        'etc/fusioninventory/ssl-server-plugin.cfg')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Apply packaging guidelines: http://fusioninventory.org/documentation/packaging/linux.html
  patch -Np1 -i "${srcdir}/package.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  perl Makefile.PL -- \
    PREFIX="/usr" \
    DATADIR="/usr/share/fusioninventory" \
    LOCALSTATEDIR="/var/lib/fusuioninventory-agent" \
    SYSCONFDIR="/etc/fusioninventory"

  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # FIXME: Test result disabled for now since it tries to write on the installed path
  make test || true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}/"

  mkdir -p "${pkgdir}/etc/fusioninventory/conf.d/"

  mkdir -p "${pkgdir}/var/lib/fusioninventory-agent/"

  install -D -m644 contrib/unix/fusioninventory-agent.service \
    "${pkgdir}/usr/lib/systemd/system/fusioninventory-agent.service"
}
