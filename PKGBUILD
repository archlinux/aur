# Maintainer:  Matt Parnell/ilikenwf <parwok@gmail.com>
# Contributor: G. Richard Bellamy <rbellamy@pteradigm.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: ptk042 <ptk042@gmail.com>
# Contributor: mmm <markotahal@gmail.com>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: David Fuhr <david.fuhr@web.de>
# what the heck

pkgname=oracle-sqldeveloper
pkgver=18.1.0.095.1630
pkgrel=1
pkgdesc="A graphical tool for database development"
arch=('any')
url="http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html"
license=('custom:OTN')
depends=('java-environment' 'bash' 'perl')
optdepends=('ksh')
source=(manual://sqldeveloper-$pkgver-no-jre.zip
        oracle-sqldeveloper.desktop
        oracle-sqldeveloper.sh
        LICENSE
        java_home.patch)
DLAGENTS+=('manual::/usr/bin/echo The source file for this package needs to be downloaded manually, since it requires a login and is not redistributable.;/usr/bin/echo Please visit http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html.; exit 1;')
md5sums=('39b4e0ea8d3c6894e40089567e0ca367'
         '59783d9d8c5f9da8256fa14d0e61a35e'
         '26c1dc933a9ab58a4245f4f351717645'
         '71a4092467209c160d0f34abbc08e049'
         'fe446201cc0d5326ecb757c384c67232')
# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'

package() {
  cd "$srcdir/sqldeveloper"

  patch -Np1 < "$srcdir/java_home.patch"
  find . \( -iname "*.exe" -o -iname "*.dll" \) -exec rm -f "{}" +
  find . -type f -exec install -Dm644 "{}" "$pkgdir/opt/oracle-sqldeveloper/{}" \;
  chmod +x "$pkgdir/opt/$pkgname/sqldeveloper.sh"

  install -Dm755 "$srcdir/$pkgname.sh"      "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/LICENSE"          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg "You will need to set JAVA_HOME or run this package for the first time from the console to set the jdk path."
}

# vim:set ts=2 sw=2 et:
