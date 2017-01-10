pkgname=dell-mgmtstat
pkgver=8.4
pkgrel=1
pkgdesc="Dell OpenManage iDRAC Linux Remote Access Utilities (RACADM)"
arch=(x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl libsmbios sblim-sfcc)
conflicts=(dell-srvadmin)
source=("http://downloads.dell.com/FOLDER03909742M/1/OM-MgmtStat-Dell-Web-LX-8.4.0-2193_A00.tar.gz"
        "http://downloads.dell.com/FOLDER03909745M/1/OM-MgmtStat-Dell-Web-LX-8.4.0-2193_A00.tar.gz.sign")
sha256sums=('470c3701aac8e113c1e11fef815091c74d3a0a887d54ce8b91f9a5578afca1e0'
            'dc380f13668de5b0ffa1d9d910fabb86d062a1c711ab96f2d04f3267a1c48ce6')
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

  mkdir -p "$pkgdir/usr/bin"
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
