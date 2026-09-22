# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Hy Goldsher <hyness-at-freshlegacycode-dot-org>

pkgname=davmail-trunk-bin
_pkgname=davmail
_basever=7.0.0
pkgver=7.0.0.trunk.983
pkgrel=1
pkgdesc="a POP/IMAP/SMTP/Caldav/LDAP gateway for the exchange service"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://$_pkgname.sourceforge.net/"
license=('GPL')
makedepends=('unzip' 'curl') # curl for pkgver()
depends=('java-runtime')
optdepends=('java-openjfx: Office 365 browser based authentication'
            'swt: Fix issues with the tray icon')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("https://ci.appveyor.com/api/projects/mguessan/davmail/artifacts/dist%2F$_pkgname-$_basever-trunk.zip?job=Environment%3A%20JAVA_HOME%3DC%3A%5CProgram%20Files%5CJava%5Cjdk1.8.0"
        $_pkgname.desktop
        $_pkgname@.system_service
        $_pkgname@.user_service)
md5sums=('SKIP'
         '1df37a6120d88de8df3cb735977336ba'
         '8d373851babe1d8bb860228c8b4db702'
         '271e9e66dfdb496d242c9a6102937c65')
install=$_pkgname.install

pkgver() {
    buildver=$(curl -s "https://ci.appveyor.com/api/projects/mguessan/davmail" \
      | grep -oP '"version":\s*"\K[^"]+')
    printf '%s.trunk.%s' "$_basever" "$buildver"
}

package() {
  install -d $pkgdir/{usr/share/$_pkgname/lib,usr/bin,etc/$_pkgname}
  install -Dm644 $_pkgname.jar $pkgdir/usr/share/$_pkgname/
  install -D lib/* $pkgdir/usr/share/$_pkgname/lib
  install -Dm755 $srcdir/$_pkgname $pkgdir/usr/share/$_pkgname
  install -Dm755 $srcdir/$_pkgname $pkgdir/usr/bin/
  install -Dm644 $srcdir/$_pkgname.desktop ${pkgdir}/usr/share/applications/$_pkgname.desktop
  install -Dm644 $srcdir/$_pkgname\@.system_service ${pkgdir}/usr/lib/systemd/system/$_pkgname\@.service
  install -Dm644 $srcdir/$_pkgname\@.user_service ${pkgdir}/usr/lib/systemd/user/$_pkgname\@.service

  # Create icons
  unzip -q $_pkgname.jar tray.png tray32.png tray48.png tray128.png
  install -Dm644 tray.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/$_pkgname.png
  install -Dm644 tray32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/$_pkgname.png
  install -Dm644 tray48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/$_pkgname.png
  install -Dm644 tray128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_pkgname.png
}
