pkgname=leagueoflegends
_pkgname='League of Legends'
pkgver=2016_05_13
pkgrel=1
epoch=2
pkgdesc='A competitive online game set in an imaginative world (Riot Games)'
url='https://leagueoflegends.com'
arch=(any)
depends=(winetricks alsa-lib libldap lcms2 gnutls mpg123)
depends_x86_64=(lib32-alsa-lib lib32-libldap lib32-lcms2 lib32-gnutls lib32-mpg123)
optdepends=(alsa-plugins libpulse)
optdepends_x86_64=(lib32-alsa-plugins lib32-libpulse)
makedepends=(gendesk icoutils imagemagick)
source=(https://riotgamespatcher-a.akamaihd.net/ShellInstaller/EUW/LeagueofLegends_EUW_Installer_$pkgver.exe
        leagueoflegends)
sha1sums=('d2ca75180300e02c845102fff5bdaafcadf0664d'
          'e0420006939187ae08fce7de826c5944d9e2facb')
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
  wine LeagueofLegends_*_Installer_$pkgver.exe /extract:"$(winepath -w $srcdir)" /exenoui
  msiexec /i LoL.*.msi APPDIR=$(winepath -w $srcdir/LoL) /q
}

package() {
  cd $srcdir
  # games gid is 50
  install -Dm755 -g 50 leagueoflegends $pkgdir/usr/bin/leagueoflegends
  install -Dm755 leagueoflegends.desktop $pkgdir/usr/share/applications/leagueoflegends.desktop
  cd $srcdir/LoL
  install -dm775 -g 50 $pkgdir/opt/games/{,$pkgname}
  cp -r * $pkgdir/opt/games/$pkgname
  chgrp -R 50 $pkgdir/opt/games/$pkgname
  find $pkgdir/opt/games/$pkgname -type d -exec chmod 775 {} +
  find $pkgdir/opt/games/$pkgname -type f -exec chmod 764 {} +
  cd $srcdir
  convert LoL/RADS/system/lol.ico lol.png
  install -Dm644 lol-3.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

