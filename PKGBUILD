pkgname=dell-srvadmin
pkgver=8.4
pkgrel=1
pkgdesc="Dell OpenManage iDRAC server management (OMSA and RACADM)"
arch=(i686 x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl libsmbios sblim-sfcc)
provides=(dell-mgmtstat=$pkgver)
conflicts=(dell-mgmtstat)
source_i686=("http://downloads.dell.com/FOLDER03909659M/1/OM-SrvAdmin-Dell-Web-LX-8.4.0-2193_A00.tar.gz"
             "http://downloads.dell.com/FOLDER03909645M/1/OM-SrvAdmin-Dell-Web-LX-8.4.0-2193_A00.tar.gz.sign")
sha256sums_i686=('a4f686616839a6f36ecb23d122bc9076b282a5ffb9832c4bcd6cf3e76aa239cf'
                 '44f23a5082219f81534bc8974c2fde085413b22b1e0e4ec61f51dcf19a8c3eb7')
source_x86_64=("http://downloads.dell.com/FOLDER03909513M/1/OM-SrvAdmin-Dell-Web-LX-8.4.0-2193.SLES12.x86_64_A00.tar.gz"
               "http://downloads.dell.com/FOLDER03909512M/1/OM-SrvAdmin-Dell-Web-LX-8.4.0-2193.SLES12.x86_64_A00.tar.gz.sign")
sha256sums_x86_64=('284f759a5f0be5c18d892a423bd5596603aa54a9c92fdd2d10c1302c95eef782'
                   '02408ee77c5850b43d2bbd593f4da011089ffc11ada5cf3e50f42a9a478cd28a')
validpgpkeys=('4172E2CE955A1776A5E61BB7CA77951D23B66A9D')
options=(!strip)

package() {
  case $CARCH in
    i686)   _sarch=i386;;
    x86_64) _sarch=x86_64;;
  esac

  cd "$srcdir/linux/RPMS/supportRPMS/srvadmin/SLES12/$_sarch"

  for _pkg in *.rpm; do
    if [[ $_pkg == @(libsmbios|smbios-utils|sblim-sfcc)* ]]; then
      continue
    fi
    msg2 "Extracting $_pkg"
    bsdtar -xvf "$_pkg" -C "$pkgdir"
  done

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
