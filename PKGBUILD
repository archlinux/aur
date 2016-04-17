pkgname=dell-srvadmin
pkgver=8.2
pkgrel=1
pkgdesc="Dell OpenManage iDRAC server management tools (RACADM)"
arch=(i686 x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl sblim-sfcc)
source_i686=("http://downloads.dell.com/FOLDER03253292M/1/OM-SrvAdmin-Dell-Web-LX-8.2.0-1739_A00.tar.gz"
             "http://downloads.dell.com/FOLDER03253295M/1/OM-SrvAdmin-Dell-Web-LX-8.2.0-1739_A00.tar.gz.sign")
sha256sums_i686=('40a3e497e83673739e0ab2f3daef2641d0c07ed16d20c9a5c0d09814cff745ff'
                 '55e5f84ecac25077f0789c62ce28012db85a624e41ead7bb0a1f5f9464d81894')
source_x86_64=("http://downloads.dell.com/FOLDER03244864M/1/OM-SrvAdmin-Dell-Web-LX-8.2.0-1739.SLES12.x86_64_A00.tar.gz"
               "http://downloads.dell.com/FOLDER03284075M/1/OM-SrvAdmin-Dell-Web-LX-8.2.0-1739.SLES12.x86_64_A00.tar.gz.sign")
sha256sums_x86_64=('2a62311c0a2d00591c804262a5e6d28796ac9b12c337b855c6f689dc814574ba'
                   'ff7fc319694a3c70b8afc5a54a45c6bdc38ec760eeb8d861476c886c2488e925')
validpgpkeys=('4172E2CE955A1776A5E61BB7CA77951D23B66A9D')
options=(!strip)

package() {
  case $CARCH in
    i686)   _sarch=i386;;
    x86_64) _sarch=x86_64;;
  esac

  cd "$srcdir/linux/RPMS/supportRPMS/srvadmin/SLES12/$_sarch"

  for _pkg in *.rpm; do
    msg2 "Extracting $_pkg"
    bsdtar -xvf "$_pkg" -C "$pkgdir"
  done

  msg2 "Adjusting paths"
  _reloc etc/udev   usr/lib/udev
  _reloc usr/lib64  usr/lib
  _reloc usr/sbin   usr/bin

  ln -s "/opt/dell/srvadmin/bin/idracadm7" "$pkgdir/usr/bin/racadm"

  msg2 "Removing crud"
  rm -vf "$pkgdir/usr/lib/udev/rules.d/95-dataeng-udev.rules"

  msg2 "Removing conflicting files"
  rm -vf "$pkgdir"/usr/lib/{libcimcclient,libcimcClientXML,libcmpisfcc}.so*
  rm -vf "$pkgdir"/usr/share/man/
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
