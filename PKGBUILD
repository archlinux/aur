pkgname=dell-mgmtstat
pkgver=9.4.0
pkgrel=1
pkgdesc="Dell OpenManage iDRAC Linux Remote Access Utilities (RACADM)"
arch=(x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl libsmbios sblim-sfcc)
optdepends=('openssl-1.0: for some old junk, like idracadm7'
            'openssl098: for even older junk, like racadm5')
conflicts=(dell-srvadmin)
source=("https://dl.dell.com/FOLDER05920767M/1/DellEMC-iDRACTools-Web-LX-9.4.0-3732_A00.tar.gz"
        "https://dl.dell.com/FOLDER05920766M/1/DellEMC-iDRACTools-Web-LX-9.4.0-3732_A00.tar.gz.sign")
sha256sums=('bd7cecb61fbf46818355c5c142e23b3b35466cacc5bb56ee24dc9a6da728d595'
            'SKIP')
validpgpkeys=('42550ABD1E80D7C1BC0BAD851285491434D8786F')
options=(!strip)

package() {
  case $CARCH in
    i686)   _sarch=i386;;
    x86_64) _sarch=x86_64;;
  esac

  cd "$srcdir/iDRACTools/racadm/SLES15/$_sarch"


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
