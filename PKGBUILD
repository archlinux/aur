pkgname=dell-mgmtstat
pkgver=8.3
pkgrel=1
pkgdesc="Dell OpenManage iDRAC Linux Remote Access Utilities (RACADM)"
arch=(x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl libsmbios sblim-sfcc)
conflicts=(dell-srvadmin)
source=("http://downloads.dell.com/FOLDER03574555M/1/OM-MgmtStat-Dell-Web-LX-8.3.0-1908_A00.tar.gz"
        "http://downloads.dell.com/FOLDER03574562M/1/OM-MgmtStat-Dell-Web-LX-8.3.0-1908_A00.tar.gz.sign")
sha256sums=('aee506e2a0aa6122572b1661773771db11958711985f4526d02691ea665f4322'
            '16bba8b28c45ef7a0be795199e8cbf048506f286bacf507d8539877d3c4892f0')
validpgpkeys=('4172E2CE955A1776A5E61BB7CA77951D23B66A9D')
options=(!strip)

package() {
  case $CARCH in
    i686)   _sarch=i386;;
    x86_64) _sarch=x86_64;;
  esac

  cd "$srcdir/linux/rac/SLES12/$_sarch"

  for _pkg in *.rpm; do
    if [[ $_pkg == @(libsmbios|smbios-utils|sblim-sfcc)* ]]; then
      continue
    fi
    msg2 "Extracting $_pkg"
    bsdtar -xvf "$_pkg" -C "$pkgdir"
  done

  msg2 "Adjusting paths"
  _reloc etc/udev   usr/lib/udev
  _reloc usr/lib64  usr/lib

  ln -s "/opt/dell/srvadmin/bin/idracadm7" "$pkgdir/usr/bin/racadm"

  msg2 "Removing crud"
  rm -vf "$pkgdir/usr/lib/udev/rules.d/95-dataeng-udev.rules"
}

_reloc() {
  local src=$pkgdir/$1 dst=$pkgdir/$2
  if [[ -d $src ]]; then
    msg2 "Moving $src"
    if [[ -d $dst ]]; then
      mv -v "$src"/* "$dst"
      rmdir "$src"
    else
      mv -v "$src" "$dst"
    fi
  fi
}

# vim: ts=2:sw=2:et:
