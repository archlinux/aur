# Maintainer: Benjamin Bukowski <benjamin.bukowski@gmail.com>
pkgname=firebird-superserver
_pkgver=2.5.4.26856
_buildver=0
pkgver=${_pkgver}_${_buildver}
pkgrel=1
pkgdesc="A open source SQL relational database management system (RDMS)"
arch=('i686' 'x86_64')
url="http://www.firebirdsql.org/"
license=('IPL IDPL')
provides=("libfbclient=${_pkgver}")
depends=()
conflicts=('firebird-classicserver' 'libfbclient')
install=firebird-superserver.install

_arch=i686
[[ "$CARCH" == x86_64 ]] && _arch=amd64

_filename="FirebirdSS-${_pkgver}-${_buildver}.${_arch}"
source=("http://downloads.sourceforge.net/firebird/${_filename}.tar.gz"
        'firebird-sysv.rc'
        'firebird-tmpfiles.conf'
        'firebird-systemd.service')
md5sums=('553d2027de702dc06ff077d7a0f4de83'
         '19e24e34c773826860958d4938396b05'
         '98eff99fd8d195a45c251610d67bd473'
         'ee9068e9bfdfa01e9dc79c72d1bfcdd8')

[[ "$CARCH" == x86_64 ]] && md5sums[0]='6b7a764b97f8ac810b1659c03e31d895'

package() {
  cd "$srcdir/${_filename}"

  msg "Extracting firebird"
  tar -xzof buildroot.tar.gz -C $pkgdir

  [[ "$CARCH" == x86_64 ]] &&  mv $pkgdir/usr/lib64/ $pkgdir/usr/lib/

  install -Dm755 $srcdir/firebird-sysv.rc $pkgdir/etc/rc.d/firebird
  install -Dm644 $srcdir/firebird-systemd.service $pkgdir/usr/lib/systemd/system/firebird.service
  install -Dm644 $srcdir/firebird-tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/firebird.conf

  touch $pkgdir/opt/firebird/{fb_guard,firebird.log}
 
  chmod u=rw,go= $pkgdir/opt/firebird/{fb_guard,firebird.log,security2.fdb,examples/empbuild/*.fdb}

  cat << EOT > $pkgdir/opt/firebird/SYSDBA.password
# This is the default password
# You should change this password at the earliest oportunity
# Your password can be changed to a more suitable one using the
# /opt/firebird/bin/gsec utility
ISC_USER=SYSDBA
ISC_PASSWD=masterkey
EOT

  chmod u=r,go= $pkgdir/opt/firebird/SYSDBA.password

  if [ -x $pkgdir/opt/firebird/bin/fbmgr.bin ]; then
    cat > $pkgdir/opt/firebird/bin/fbmgr << EOT
#!/bin/sh
FIREBIRD=/opt/firebird
export FIREBIRD
exec /opt/firebird/bin/fbmgr.bin \$@
EOT
fi
chmod ugo+x $pkgdir/opt/firebird/bin/fbmgr

}

# vim:set ts=2 sw=2 et:
