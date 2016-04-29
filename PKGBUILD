pkgname=leagueoflegends
_pkgname='League of Legends'
pkgver=20141509
_pkgver=9_15_2014 # installer version
pkgrel=1
pkgdesc='A competitive online game set in an imaginative world (Riot Games)'
url='https://leagueoflegends.com'
arch=(any)
depends=(winetricks alsa-lib libldap lcms2 gnutls mpg123)
depends_x86_64=(lib32-alsa-lib lib32-libldap lib32-lcms2 lib32-gnutls lib32-mpg123)
optdepends=(alsa-plugins libpulse)
optdepends_x86_64=(lib32-alsa-plugins lib32-libpulse)
makedepends=(gendesk icoutils)
source=(https://riotgamespatcher-a.akamaihd.net/ShellInstaller/EUW/LeagueofLegends_EUW_Installer_$_pkgver.exe
        leagueoflegends)
sha1sums=('c18abec07aea597e0b7b9453018da05f40a1a382'
          '32623d56c2a9e364fc5f682e37259c25f5f88b24')
install=$pkgname.install

prepare() {
  cd $srcdir
  gendesk -f -n \
      --pkgname "$pkgname" \
      --name "$_pkgname" \
      --pkgdesc "$pkgdesc" \
      --categories 'Wine;Games'
}

build() {
  cd $srcdir
  wine LeagueofLegends_*_Installer_9_15_2014.exe /extract
  LD_PRELOAD=/usr/lib32/libjpeg.so.62 msiexec /i LoL.*.msi APPDIR=$(winepath -w $srcdir/LoL) /q
}

package() {
  cd $srcdir
  # games gid is 50
  install -Dm755 -g 50 leagueoflegends $pkgdir/usr/bin/leagueoflegends
  install -Dm755 leagueoflegends.desktop $pkgdir/usr/share/applications/leagueoflegends.desktop
  cd $srcdir/LoL
  install -dm775 -g 50 $pkgdir/var/games/{,$pkgname}
  cp -r * $pkgdir/var/games/$pkgname
  chgrp -R 50 $pkgdir/var/games/$pkgname
  find $pkgdir/var/games/$pkgname -type d -exec chmod 775 {} +
  find $pkgdir/var/games/$pkgname -type f -exec chmod 764 {} +
  cd $srcdir
  convert LoL/RADS/system/lol.ico lol.png
  install -Dm644 lol-3.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

