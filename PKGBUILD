# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=alfae
pkgver=1.4.3
pkgrel=1
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins"
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('legendary' 'heroic-gogdl')
makedepends=('dotnet-sdk' 'git')
options=('!strip')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=Alfae\n\
Icon=alfae\n\
Exec=/opt/Alfae/Alfae %U\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=Alfae\n\
Comment=An Itch.io/Epic Games/GOG launcher that works through plugins\n\
Categories=Game;" > alfae.desktop
}

build() {
  export NUGET_PACKAGES="$srcdir/NUGET_PACKAGES"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  cd Alfae

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
# Create directories
  mkdir -p "$pkgdir/opt/Alfae" "$pkgdir/usr/bin"
# Install
  mv Alfae/Release/* "$pkgdir/opt/Alfae"
  ln -s /opt/Alfae/Alfae "$pkgdir/usr/bin/alfae"
  install -Dm644 Alfae/Launcher/Assets/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/alfae.png"
  install -Dm644 alfae.desktop -t "$pkgdir/usr/share/applications"
}
