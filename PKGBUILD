pkgname=pyirct
_pkgname=irc-transport
pkgver=0.4
pkgrel=6
pkgdesc='IRC transport for Jabber'
arch=('any')
url='http://xmpppy.sourceforge.net/irc/'
license=('GPL')
depends=('python2-irc' 'xmpppy' 'python2-dnspython')
source=("http://downloads.sourceforge.net/project/xmpppy/PyIRCt/0.4/irc-transport-$pkgver.tar.gz"
        pyirct.service
        pyirct.tmpfiles
        config.xml)
md5sums=('414411cc20a1cfd3559d1ff546dfd424'
         'b88b73469f8a609edfe0997a4ea536db'
         '627964de07a39c472a6d9e188b900ede'
         '9c7f68595294ff6e567fd395b1711a67')
install='pyirct.install'

package() {
  cd "irc-transport-$pkgver"

  # python2 fix
  for FILE in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/env python2_' "$FILE"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "$FILE"
  done

  # make directory
  install -d -m755 "$pkgdir/usr/lib"

  # copy files
  install -d -m0755 "$pkgdir/var/spool/pyirct"
  install -Dm0644 "$srcdir/config.xml" "$pkgdir/etc/ejabberd/pyirc.xml"
  mv "$srcdir/${_pkgname}-${pkgver}/config_example.xml" "$pkgdir/etc/ejabberd/pyirc_example.xml"
  cp -r . "$pkgdir/usr/lib/$pkgname"
  ln -s ../../../etc/ejabberd/pyirc.xml "$pkgdir/usr/lib/$pkgname/config.xml"

  # systemd
  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm0644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
