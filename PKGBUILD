# Maintainer: Eddie.website <maintainer@eddie.website>
# Based on work by Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ> and Beini <bane aτ iki dot fi>

pkgname=eddie-cli-git
pkgver=2.21.3
pkgrel=1
pkgdesc='Eddie - VPN tunnel - CLI - beta'
arch=('i686' 'x86_64')
url=https://eddie.website
license=(GPLv3)
depends=(mono openvpn sudo)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH')
makedepends=('cmake')
provides=('eddie-cli')
conflicts=('airvpn' 'airvpn-beta-bin' 'airvpn-git')
install=eddie-cli.install
source=('git+https://github.com/AirVPN/Eddie.git')
sha1sums=('SKIP')

case "$CARCH" in
    i686) _pkgarch="x86"
      ;;
    x86_64) _pkgarch="x64"
      ;;
esac

build() {
  export TERM=xterm # Fix Mono bug "Magic number is wrong".

  # Compile C# sources
  cd "Eddie"
  if [ "cli" = "cli" ]; then
    xbuild /verbosity:minimal /p:Configuration="Release" /p:Platform="$_pkgarch" src/eddie.linux.cli.sln
  elif [ "cli" = "ui" ]; then
    xbuild /verbosity:minimal /p:Configuration="Release" /p:Platform="$_pkgarch" src/eddie2.linux.ui.sln
  fi

  # Compile C sources (Tray)
  if [ "cli" = "ui" ]; then
    cd src/UI.GTK.Linux.Tray
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=. 
    make
    strip -S --strip-unneeded -o eddie-tray-strip eddie_tray
    cd ../..
  fi

  # Compile C sources
  chmod +x src/eddie.linux.postbuild.sh
  chmod +x src/Lib.Platform.Linux.Native/build.sh
  
  if [ "cli" = "cli" ]; then
    src/eddie.linux.postbuild.sh "src/App.CLI.Linux/bin/$_pkgarch/Release/" ui $_pkgarch Release
  elif [ "cli" = "ui" ]; then
    src/eddie.linux.postbuild.sh "src/App.Forms.Linux/bin/$_pkgarch/Release/" ui $_pkgarch Release
  fi
}

package() {
  cd "Eddie"
  install -Dm755 "src/App.CLI.Linux.Elevated/bin/eddie-cli-elevated" "$pkgdir/usr/lib/eddie-cli/eddie-cli-elevated"
  install -Dm644 "src/Lib.Core/bin/$_pkgarch/Release/Lib.Core.dll" "$pkgdir/usr/lib/eddie-cli/Lib.Core.dll"
  install -Dm644 "src/Lib.Platform.Linux/bin/$_pkgarch/Release/Lib.Platform.Linux.dll" "$pkgdir/usr/lib/eddie-cli/Lib.Platform.Linux.dll"
  install -Dm644 "src/Lib.Platform.Linux.Native/bin/libLib.Platform.Linux.Native.so" "$pkgdir/usr/lib/eddie-cli/libLib.Platform.Linux.Native.so"  
  install -Dm755 "repository/linux_arch/bundle/eddie-cli/usr/bin/eddie-cli" "$pkgdir/usr/bin/eddie-cli"
  sed -i 's/{@lib}/lib/g' "$pkgdir/usr/bin/eddie-cli"
  install -Dm644 "common/manifest.json"       "$pkgdir/usr/share/eddie-cli/manifest.json"
  install -Dm644 "common/libraries.txt"       "$pkgdir/usr/share/eddie-cli/libraries.txt"
  install -Dm644 "common/gpl3.txt"       "$pkgdir/usr/share/eddie-cli/gpl3.txt"
  install -Dm644 "common/cacert.pem"       "$pkgdir/usr/share/eddie-cli/cacert.pem"
  install -Dm644 "common/icon.png"       "$pkgdir/usr/share/eddie-cli/icon.png"
  install -Dm644 "common/icon_gray.png"       "$pkgdir/usr/share/eddie-cli/icon_gray.png"
  install -Dm644 "common/icon.png"       "$pkgdir/usr/share/eddie-cli/tray.png"
  install -Dm644 "common/icon_gray.png"       "$pkgdir/usr/share/eddie-cli/tray_gray.png"
  install -Dm644 "common/iso-3166.json"       "$pkgdir/usr/share/eddie-cli/iso-3166.json"
  install -Dm644 "common/lang/inv.json"       "$pkgdir/usr/share/eddie-cli/lang/inv.json"
  install -Dm644 "common/providers/AirVPN.json"       "$pkgdir/usr/share/eddie-cli/providers/AirVPN.json"
  install -Dm644 "common/providers/OpenVPN.json"       "$pkgdir/usr/share/eddie-cli/providers/OpenVPN.json"
  install -Dm644 "common/providers/WireGuard.json"       "$pkgdir/usr/share/eddie-cli/providers/WireGuard.json"
  install -Dm644 "repository/linux_arch/bundle/eddie-cli/usr/share/doc/eddie-cli/copyright"    "$pkgdir/usr/share/doc/eddie-cli/copyright"
  install -Dm644 "repository/linux_arch/bundle/eddie-cli/usr/share/polkit-1/actions/org.airvpn.eddie.cli.elevated.policy" "$pkgdir/usr/share/polkit-1/actions/org.airvpn.eddie.cli.elevated.policy"
  sed -i 's/{@lib}/lib/g' "$pkgdir/usr/share/polkit-1/actions/org.airvpn.eddie.cli.elevated.policy"  

  if [ "cli" = "cli" ]; then
    install -Dm755 "src/App.CLI.Linux/bin/$_pkgarch/Release/App.CLI.Linux.exe" "$pkgdir/usr/lib/eddie-cli/eddie-cli.exe"
  elif [ "cli" = "ui" ]; then
    install -Dm755 "src/App.Forms.Linux/bin/$_pkgarch/Release/App.Forms.Linux.exe" "$pkgdir/usr/lib/eddie-cli/eddie-cli.exe"
    install -Dm644 "src/App.Forms.Linux/bin/$_pkgarch/Release/Lib.Forms.dll" "$pkgdir/usr/lib/eddie-cli/Lib.Forms.dll"
    install -Dm644 "src/App.Forms.Linux/bin/$_pkgarch/Release/Lib.Forms.Skin.dll" "$pkgdir/usr/lib/eddie-cli/Lib.Forms.Skin.dll"
    install -Dm755 "src/UI.GTK.Linux.Tray/eddie-tray-strip" "$pkgdir/usr/lib/eddie-cli/eddie-tray"
    install -Dm644 "repository/linux_arch/bundle/eddie-cli/usr/share/pixmaps/eddie-cli.png"  "$pkgdir/usr/share/pixmaps/eddie-cli.png"
  fi

  # remember: the day when common/webui is need, i need a script that generate 'install' line above for each file, include dir is unresolved

  # Generate changelog
  curl "https://eddie.website/changelog/?software=client&format=debian&hidden=yes" -o "$pkgdir/usr/share/doc/eddie-cli/changelog"
  gzip -n -9 "$pkgdir/usr/share/doc/eddie-cli/changelog"

  # Generate man
  mkdir -p "$pkgdir/usr/share/man/man8/"
  mono "$pkgdir/usr/lib/eddie-cli/eddie-cli.exe" --cli --path.resources="$pkgdir/usr/share/eddie-cli/" --help --help.format=man >"$pkgdir/usr/share/man/man8/eddie-cli.8"
  gzip -n -9 "$pkgdir/usr/share/man/man8/eddie-cli.8"
  
  if [ "cli" = "ui" ]; then
    ## Fix .desktop file for KDE
    _desktop_session=$(printf "%s" "$DESKTOP_SESSION" | awk -F "/" '{print $NF}')
    if [ "$_desktop_session" = "plasma" ]; then
      msg2 "Installing desktop file for KDE..."
      desktop-file-install -m 644 --set-comment="OpenVPN UI" \
      --dir="$pkgdir/usr/share/applications/" \
      --set-icon="/usr/share/pixmaps/eddie-cli.png" \
      "repository/linux_arch/bundle/eddie-cli/usr/share/applications/eddie-cli.desktop"
    else
      msg2 "Installing desktop file..."
      desktop-file-install -m 644 --set-comment="OpenVPN UI" \
      --dir="$pkgdir/usr/share/applications/" \
      "repository/linux_arch/bundle/eddie-cli/usr/share/applications/eddie-cli.desktop"
    fi
  fi
}

