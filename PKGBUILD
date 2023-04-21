# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=alfae
pkgver=1.4.0
pkgrel=3
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins"
arch=('any')
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL3')
depends=('legendary' 'heroic-gogdl')
makedepends=('dotnet-sdk')
options=('!strip')
_desktop=alfae.desktop
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('94f9b547aecb635244d788de3a3a2c317061bf6fff99eaa747f79c067f1825de')

prepare() {
  # "Create a shortcut"
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=An Itch.io/Epic Games/GOG launcher that works through plugins' $_desktop
  sed -i '1 i\StartupWMClass=Alfae' $_desktop
  sed -i '1 i\Icon=alfae' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=/opt/Alfae/Alfae %U' $_desktop
  sed -i '1 i\Name=Alfae' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mkdir -p desktop
  mv $_desktop desktop
}

build() {
  cd Alfae-$pkgver

  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true

  cd LocalGames
  dotnet publish -o ../Release/plugins/LocalGames -p:Configuration=Release
  
  cd ../SteamExporterPlugin
  dotnet publish -o ../Release/plugins/SteamExporterPlugin -p:Configuration=Release
  
  cd ../BottlesPlugin
  dotnet publish -o ../Release/plugins/BottlesPlugin -p:Configuration=Release
  
  cd ../ItchIoIntegration
  dotnet publish -o ../Release/plugins/ItchIoIntegration -p:Configuration=Release
  
  cd ../SteamGridDbMiddleware
  dotnet publish -o ../Release/plugins/SteamGridDbMiddleware -p:Configuration=Release
  
  cd ../HideGamesMiddleware
  dotnet publish -o ../Release/plugins/HideGamesMiddleware -p:Configuration=Release
  
  cd ../LegendaryIntegration
  dotnet publish -o ../Release/plugins/LegendaryIntegration -p:Configuration=Release
  
  cd ../GogIntegration
  dotnet publish -o ../Release/plugins/GogIntegration -p:Configuration=Release
  
  cd ../Launcher
  dotnet publish -o ../Release -r linux-x64 --self-contained -p:PublishSingleFile=true -p:Configuration=Release

  cd ../Release
  ln -fs /usr/bin/legendary
  ln -fs /usr/bin/gogdl
}

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  # Install
  cp -r Alfae-$pkgver/Release $pkgdir/opt/Alfae
  ln -s /opt/Alfae/Alfae $pkgdir/usr/bin/$pkgname
  install -Dm644 Alfae-$pkgver/Launcher/Assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 desktop/$_desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 Alfae-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 Alfae-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
