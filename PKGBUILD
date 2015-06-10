# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tom Wizetek <tom@wizetek.com>

# TODO: Further cleanup

pkgname=jxplorer
pkgver=3.3.1
pkgrel=1
pkgdesc='Java LDAP client'
_pkgbin="${pkgname}-${pkgver}-linux-installer.run"
_desktop='usr/share/applications/JXplorer.desktop'
url='http://jxplorer.org/'
license=('custom')
arch=('any')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/version%20${pkgver}/${_pkgbin}")
md5sums=('19d7f034b3b0687800c0efb2f6ec35ab')

package() {
  chmod 0700 ${_pkgbin}
  ./${_pkgbin} --mode unattended --prefix ${srcdir}/${pkgname}
  
  install -d -m 0755 ${pkgdir}/opt
  cp -r ${srcdir}/${pkgname} ${pkgdir}/opt
  chmod 0755 ${pkgdir}/opt/${pkgname}/jxplorer.sh
  
  # Regrettably, there is no user settings separation (as far as I can tell).
  # We will use globally writeable config files then. Sorry.
  # There may be more than these two files and the plugins directory!
  touch ${pkgdir}/opt/${pkgname}/gssapi.conf
  touch ${pkgdir}/opt/${pkgname}/jxconfig.txt
  chmod 0666 ${pkgdir}/opt/${pkgname}/gssapi.conf
  chmod 0666 ${pkgdir}/opt/${pkgname}/jxconfig.txt
  chmod 0777 ${pkgdir}/opt/${pkgname}/plugins
  
  cat > ${pkgname}.run << EoF
#!/bin/sh
cd /opt/${pkgname}
sh jxplorer.sh "\$@"
EoF
  install -d "$pkgdir/usr/bin"
  install -Dm755 "$pkgname.run" "$pkgdir/usr/bin/$pkgname"
  
  install -Dm644 "$srcdir/$pkgname/JXplorer.desktop" "$pkgdir/$_desktop"
  sed -i "s,${srcdir},/opt," "$pkgdir/$_desktop"
  sed -i "/^Version=/c\Version=${pkgver}" "$pkgdir/$_desktop"
  sed -i "/^Comment=/c\Comment=${pkgdesc}" "$pkgdir/$_desktop"
  
  rm "$pkgdir/opt/$pkgname/uninstall" \
    "$pkgdir/opt/$pkgname/"*.desktop \
    "$pkgdir/opt/$pkgname/"*.bat
}

# vim:set ts=2 sw=2 et:
