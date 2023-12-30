# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=alfae
pkgver=1.4.2
pkgrel=1
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins"
arch=('x86_64')
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL3')
depends=('legendary' 'heroic-gogdl')
makedepends=('dotnet-sdk' 'git')
options=('!strip')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> desktop
  sed -i '1 i\Comment=An Itch.io/Epic Games/GOG launcher that works through plugins' desktop
  sed -i '1 i\StartupWMClass=Alfae' desktop
  sed -i '1 i\Icon=alfae' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=/opt/Alfae/Alfae %U' desktop
  sed -i '1 i\Name=Alfae' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop alfae.desktop
}

build() {
  cd Alfae

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
  mkdir -p "$pkgdir/opt/Alfae" "$pkgdir/usr/bin"
  # Install
  mv Alfae/Release/* "$pkgdir/opt/Alfae"
  ln -s /opt/Alfae/Alfae "$pkgdir/usr/bin/alfae"
  install -Dm644 Alfae/Launcher/Assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/alfae.png"
  install -Dm644 alfae.desktop -t "$pkgdir/usr/share/applications"
}
