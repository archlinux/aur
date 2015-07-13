pkgname=dell-srvadmin
pkgver=7.4.0
pkgrel=1
pkgdesc="Dell iDRAC server management tools (RACADM)"
arch=(i686 x86_64)
depends=(openssl098)
source=(http://downloads.dell.com/FOLDER02020533M/1/OM-MgmtStat-Dell-Web-LX-7.4.0-866_A00.tar.gz{,.sign})
sha256sums=('ea562fecb8c663912b9a0152a9f3e6cd457ddc7dfdb33da9dedba99c4a376e25'
            'SKIP')
validpgpkeys=('4172E2CE955A1776A5E61BB7CA77951D23B66A9D')
options=(!strip)

package() {
  case $CARCH in
    i686)   _sarch=i386;;
    x86_64) _sarch=x86_64;;
  esac

  cd "$srcdir/linux/rac/SLES11/$_sarch"

  for _pkg in *.rpm; do
    msg2 "Extracting $_pkg"
    bsdtar -xvf "$_pkg" -C "$pkgdir"
  done

  msg2 "Adjusting paths"
  _reloc etc/udev   usr/lib/udev
  _reloc usr/lib64  usr/lib
  _reloc usr/sbin   usr/bin

  ln -s /opt/dell/srvadmin/bin/idracadm7 "$pkgdir/usr/bin/racadm"

  msg2 "Removing crud"
  rm -f "$pkgdir/usr/lib/udev/rules.d/95-dataeng-udev.rules"
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
