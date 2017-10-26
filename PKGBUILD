pkgname=dell-mgmtstat
pkgver=8.5
pkgrel=1
pkgdesc="Dell OpenManage iDRAC Linux Remote Access Utilities (RACADM)"
arch=(x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl libsmbios sblim-sfcc)
optdepends=('openssl-1.0: for some old junk, like idracadm7'
            'openssl098: for even older junk, like racadm5')
conflicts=(dell-srvadmin)
source=("https://downloads.dell.com/FOLDER04161783M/1/OM-MgmtStat-Dell-Web-LX-8.5.0-2372_A00.tar.gz"
        "https://downloads.dell.com/FOLDER04161790M/1/OM-MgmtStat-Dell-Web-LX-8.5.0-2372_A00.tar.gz.sign")
sha256sums=('8ba2cb30834541dff540b48922bdac93e316df2a28c33f3cbd6301ee180a7213'
            '70bab1f33a018444bb916f67c538ff2256075f964355ce655ae32641ab39cae3')
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
  ln -s "/opt/dell/srvadmin/bin/idracadm" "$pkgdir/usr/bin/racadm"

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
