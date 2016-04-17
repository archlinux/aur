pkgname=dell-srvadmin
pkgver=8.3
pkgrel=2
pkgdesc="Dell OpenManage iDRAC server management (OMSA and RACADM)"
arch=(i686 x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl libsmbios sblim-sfcc)
provides=(dell-mgmtstat=$pkgver)
conflicts=(dell-mgmtstat)
source_i686=("http://downloads.dell.com/FOLDER03572627M/2/OM-SrvAdmin-Dell-Web-LX-8.3.0-1908_A00.tar.gz"
             "http://downloads.dell.com/FOLDER03572656M/2/OM-SrvAdmin-Dell-Web-LX-8.3.0-1908_A00.tar.gz.sign")
sha256sums_i686=('b509ddb8ef4461c29d06c6af12b78847374d06a67416ecc7daa055ab4048084d'
                 'ac9b75efec36fd354d0f90d113abdf5758c8297515aef4a1ef4deb378557740f')
source_x86_64=("http://downloads.dell.com/FOLDER03573498M/1/OM-SrvAdmin-Dell-Web-LX-8.3.0-1908.SLES12.x86_64_A00.tar.gz"
               "http://downloads.dell.com/FOLDER03573499M/1/OM-SrvAdmin-Dell-Web-LX-8.3.0-1908.SLES12.x86_64_A00.tar.gz.sign")
sha256sums_x86_64=('402872530dd4588980b520253dcd31a4c28b33957f007f1a87fe8893e572acb7'
                   'e9b02aea9869ca4c34b1188ebf8db3e57ede0acbeddd95c87145716174f161a3')
validpgpkeys=('4172E2CE955A1776A5E61BB7CA77951D23B66A9D')
options=(!strip)

package() {
  case $CARCH in
    i686)   _sarch=i386;;
    x86_64) _sarch=x86_64;;
  esac

  cd "$srcdir/linux/RPMS/supportRPMS/srvadmin/SLES12/$_sarch"

  for _pkg in *.rpm; do
    if [[ $_pkg == @(libsmbios|smbios-utils)* ]]; then
      continue
    fi
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
  rm -rvf "$pkgdir"/usr/lib/{libcimcclient,libcimcClientXML,libcmpisfcc}.so*
  rm -rvf "$pkgdir"/usr/share/man/
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
