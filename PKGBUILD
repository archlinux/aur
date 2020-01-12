pkgname=dell-srvadmin
pkgver=9.3.0
pkgrel=1
pkgdesc="Dell OpenManage iDRAC server management (OMSA and RACADM)"
arch=(x86_64)
url='http://en.community.dell.com/techcenter/systems-management/w/wiki/1760.openmanage-server-administrator-omsa'
depends=(openssl libsmbios sblim-sfcc)
provides=(dell-mgmtstat=$pkgver)
conflicts=(dell-mgmtstat)
source=("https://dl.dell.com/FOLDER05558134M/1/OM-SrvAdmin-Dell-Web-LX-9.3.0-3465.RHEL6.x86_64_A00.tar.gz"
        "https://dl.dell.com/FOLDER05558124M/1/OM-SrvAdmin-Dell-Web-LX-9.3.0-3465.RHEL6.x86_64_A00.tar.gz.sign")
sha256sums=('f81dcc28d951b18addef22e6c2f51a6bae3c76aa87066c3dbff0ec517855ac13'
            'SKIP')
validpgpkeys=('42550ABD1E80D7C1BC0BAD851285491434D8786F')
options=(!strip)

package() {
  case $CARCH in
    i686)   _sarch=i386;;
    x86_64) _sarch=x86_64;;
  esac

  cd "$srcdir/linux/RPMS/supportRPMS/srvadmin/RHEL6/$_sarch"

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

  # the .sh one is rather ugly, let's do both for consistency
  echo 'export PATH=$PATH:/opt/dell/srvadmin/sbin:/opt/dell/srvadmin/bin' \
    > "$pkgdir/etc/profile.d/srvadmin-path.sh"
  echo 'set path = ( $path /opt/dell/srvadmin/sbin /opt/dell/srvadmin/bin )' \
    > "$pkgdir/etc/profile.d/srvadmin-path.csh"
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
