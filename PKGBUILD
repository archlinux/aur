# Maintainer: Matthias Mailänder <matthias@mailaender.name>
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=nunit2
pkgver=2.7.1
pkgrel=2
pkgdesc="Unit-testing framework for all .NET languages."
arch=('any')
license=('custom')
url="https://nunit.org/"
depends=('mono')
makedepends=('sed')
source=("https://github.com/nunit-legacy/nunitv2/releases/download/${pkgver}/NUnit-${pkgver}.zip")
sha256sums=('2353b5bf95b1ce8d58744bea76e37e4455a0683a4332d0b9a931afe4c077b253')

package() {
  mkdir -p $pkgdir/usr/{share/licenses,lib}/$pkgname

  cp -r $srcdir/bin/* $pkgdir/usr/lib/$pkgname
  cp $srcdir/license.txt "$pkgdir/usr/share/licenses/$pkgname/"

  mkdir -p $pkgdir/usr/lib/mono/4.5
  for l in lib/nunit.core.dll lib/nunit.core.interfaces.dll framework/nunit.framework.dll lib/nunit.util.dll lib/nunit-console-runner.dll lib/nunit-gui-runner.dll lib/nunit.uiexception.dll lib/nunit.uikit.dll ; do
    gacutil -i $pkgdir/usr/lib/$pkgname/$l -package nunit -root $pkgdir/usr/lib
    name=$(echo $l | sed 's/\.dll//;s/.*\///')
    echo ${name}
    dir=$(echo $pkgdir/usr/lib/mono/gac/${name}/* | sed "s|$pkgdir||")
    echo ${dir}
    rm -rf $pkgdir/usr/lib/nunit/$l
    ln -sf ${dir}/${name}.dll $pkgdir/usr/lib/mono/4.5/${name}.dll
  done

  mkdir -p "$pkgdir/usr/bin/"

  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit2"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit2/nunit.exe "$@"' >> "$pkgdir/usr/bin/nunit2"
  chmod +x "$pkgdir/usr/bin/nunit2"
  
  echo '#!/bin/sh' > "$pkgdir/usr/bin/nunit2-console"
  echo 'exec /usr/bin/mono --debug /usr/lib/nunit2/nunit-console.exe "$@"' >> "$pkgdir/usr/bin/nunit2-console"
  chmod +x "$pkgdir/usr/bin/nunit2-console"
}
