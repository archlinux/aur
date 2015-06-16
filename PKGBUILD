# Maintainer: Basil Schneider <basil dot schneider at cern dot ch>
pkgname=lpadmincern
pkgver=1.3.13   # 1.3.13-1.slc6 (published 2014-09-10)
pkgrel=3
pkgdesc="CERN LDAP printer database client"
url="https://printservice.web.cern.ch/printservice/"
arch=('any')   # according to RPM spec; only tested on x86_64
license=('GPL')
depends=('cups' 'perl' 'perl-ldap' 'gzip' 'tar' 'python')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install=()
source=("http://ftp.riken.jp/Linux/cern/slc6X/updates/SRPMS/lpadmincern-1.3.13-1.slc6.src.rpm")
md5sums=('ef11f5ad7a29cf9dcd4f4f7d895df554')

build() {
  msg2 "Unpacking"
  tar xf "${pkgname}"-"${pkgver}".tar.gz
  cd "${pkgname}"-"${pkgver}"
  # Okay, this is ugly. Instead of
  # $ systemctl start cups
  # we need to call
  # $ systemctl enable org.cups.cupsd.service
  # $ systemctl daemon-reload
  # $ systemctl start org.cups.cupsd.service
  msg2 "Updating script to CUPS 2.0"
  sed -i "/systemctl restart cups/s#\
       \( *\)\(\$cupsc=\)'\(/usr/bin/systemctl\).*#\
       \1\2'\3 enable org.cups.cupsd; \\n\
       \1        \3 daemon-reload; \\n\
       \1        \3 start org.cups.cupsd'#" "${pkgname}".pl
  msg2 "Creating man page"
  pod2man "${pkgname}".pl > "${pkgname}".1
}

package() {
  cd "${pkgname}"-"${pkgver}"

  msg2 "Creating directories"
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/man/man1
  mkdir -p "${pkgdir}"/etc/cron.daily/
  mkdir -p "${pkgdir}"/etc/logrotate.d/
  mkdir -p "${pkgdir}"/etc/sysconfig/
  mkdir -p "${pkgdir}"/usr/share/"${pkgname}"/ppds/
  mkdir -p "${pkgdir}"/usr/share/man/man1
  mkdir -p "${pkgdir}"/usr/share/man/man8
 
  msg2 "Installing scripts"
  install -m 755 "${pkgname}".pl "${pkgdir}"/usr/bin/"${pkgname}"
  install -m 644 "${pkgname}".1 "${pkgdir}"/usr/share/man/man1/
  install -m 644 ppds/* "${pkgdir}"/usr/share/"${pkgname}"/ppds/
  
  install -m755 lpq-cern.py "${pkgdir}"/usr/bin/lpq.cern
  install -m755 lprm-cern.py "${pkgdir}"/usr/bin/lprm.cern
  install -m755 lpadmincern.cron "${pkgdir}"/etc/cron.daily/lpadmincern
  install -m755 lpadmincern.logrotate "${pkgdir}"/etc/logrotate.d/lpadmincern
  install -m755 lpadmincern.sysconfig "${pkgdir}"/etc/sysconfig/lpadmincern
 
  msg2 "Creating symlinks"
  pushd "${pkgdir}"/usr/bin > /dev/null
  ln -sf cancel.cups cancel.cern
  ln -sf lp.cups lp.cern
  ln -sf lpr.cups lpr.cern
  ln -sf lpstat.cups lpstat.cern
  cd "${pkgdir}"/usr/bin
  ln -sf lpc.cups lpc.cern
  popd > /dev/null
 
  msg2 "Installing manpages"
  install -m644 man/cancel-cern.1 "${pkgdir}"/usr/share/man/man1/cancel-cern.1
  install -m644 man/lp-cern.1 "${pkgdir}"/usr/share/man/man1/lp-cern.1
  install -m644 man/lpq-cern.1 "${pkgdir}"/usr/share/man/man1/lpq-cern.1
  install -m644 man/lpr-cern.1 "${pkgdir}"/usr/share/man/man1/lpr-cern.1
  install -m644 man/lprm-cern.1 "${pkgdir}"/usr/share/man/man1/lprm-cern.1
  install -m644 man/lpstat-cern.1 "${pkgdir}"/usr/share/man/man1/lpstat-cern.1
  install -m644 man/lpc-cern.8 "${pkgdir}"/usr/share/man/man8/lpc-cern.8
  
  pushd "${pkgdir}"/usr/share/man/man1 > /dev/null
  gzip cancel-cern.1 lp-cern.1 lpq-cern.1 lpr-cern.1 lprm-cern.1 lpstat-cern.1
  cd "${pkgdir}"/usr/share/man/man8
  gzip lpc-cern.8
  popd > /dev/null
}
