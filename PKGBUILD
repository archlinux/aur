# Maintainer: Eddie.website <maintainer@eddie.website>
# Based on work by Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ> and Beini <bane aτ iki dot fi>

# Pending work: man & changelog files generated automatically. 

pkgname=eddie-ui-git
pkgver=2.18.8
pkgrel=1
pkgdesc='Eddie - VPN tunnel - beta version'
arch=('i686' 'x86_64')
url=https://eddie.website
license=(GPLv3)
depends=(mono openvpn sudo desktop-file-utils libnotify libappindicator-gtk2)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH')
makedepends=('cmake')
provides=('eddie-ui')
conflicts=('airvpn' 'airvpn-beta-bin' 'airvpn-git')
install=eddie-ui.install
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
  cd * # First folder
  xbuild /verbosity:minimal /p:Configuration="Release" /p:Platform="$_pkgarch" src/eddie2.linux.sln

  # Compile C sources (Tray)
  cd src/UI.GTK.Linux.Tray
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=.  
  make
  strip -S --strip-unneeded -o eddie-tray-strip eddie_tray
  cd ../..

  # Compile C sources
  chmod +x src/eddie.linux.postbuild.sh
  chmod +x src/Lib.Platform.Linux.Native/build.sh
  src/eddie.linux.postbuild.sh "src/App.Forms.Linux/bin/$_pkgarch/Release/" ui $_pkgarch Release
}

package() {
  cd * # First folder
  install -Dm755 "src/App.Forms.Linux/bin/$_pkgarch/Release/App.Forms.Linux.exe" "$pkgdir/usr/lib/eddie-ui/eddie-ui.exe"
  install -Dm755 "src/App.Forms.Linux/bin/$_pkgarch/Release/eddie-cli-elevated" "$pkgdir/usr/lib/eddie-ui/eddie-cli-elevated"
  install -Dm644 "src/App.Forms.Linux/bin/$_pkgarch/Release/Lib.Core.dll" "$pkgdir/usr/lib/eddie-ui/Lib.Core.dll"
  install -Dm644 "src/App.Forms.Linux/bin/$_pkgarch/Release/Lib.Forms.dll" "$pkgdir/usr/lib/eddie-ui/Lib.Forms.dll"
  install -Dm644 "src/App.Forms.Linux/bin/$_pkgarch/Release/Lib.Platform.Linux.dll" "$pkgdir/usr/lib/eddie-ui/Lib.Platform.Linux.dll"
  install -Dm644 "src/Lib.Platform.Linux.Native/bin/libLib.Platform.Linux.Native.so" "$pkgdir/usr/lib/eddie-ui/libLib.Platform.Linux.Native.so"
  install -Dm755 "src/UI.GTK.Linux.Tray/eddie-tray-strip" "$pkgdir/usr/lib/eddie-ui/eddie-tray"
  install -Dm755 "repository/linux_arch/bundle/eddie-ui/usr/bin/eddie-ui" "$pkgdir/usr/bin/eddie-ui"
  sed -i 's/{@lib}/lib/g' "$pkgdir/usr/bin/eddie-ui"
  install -Dm644 "common/cacert.pem"       "$pkgdir/usr/share/eddie-ui/cacert.pem"
  install -Dm644 "common/icon.png"       "$pkgdir/usr/share/eddie-ui/icon.png"
  install -Dm644 "common/icon_gray.png"       "$pkgdir/usr/share/eddie-ui/icon_gray.png"
  install -Dm644 "common/icon.png"       "$pkgdir/usr/share/eddie-ui/tray.png"
  install -Dm644 "common/icon_gray.png"       "$pkgdir/usr/share/eddie-ui/tray_gray.png"
  install -Dm644 "common/iso-3166.json"       "$pkgdir/usr/share/eddie-ui/iso-3166.json"
  install -Dm644 "common/lang/inv.json"       "$pkgdir/usr/share/eddie-ui/lang/inv.json"
  # cp -r "common/webui"	"$pkgdir/usr/share/eddie-ui/webui"
  # install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/doc/eddie-ui/changelog.Debian.gz" "$pkgdir/usr/share/doc/eddie-ui/changelog.gz" # TOFIX: Missing changelog generation
  install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/doc/eddie-ui/copyright"    "$pkgdir/usr/share/doc/eddie-ui/copyright"
  # install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/man/man8/eddie-ui.8.gz"    "$pkgdir/usr/share/man/man1/eddie-ui.8.gz" # TOFIX: Missing man generation
  install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/polkit-1/actions/org.airvpn.eddie.ui.elevated.policy" "$pkgdir/usr/share/polkit-1/actions/org.airvpn.eddie.ui.elevated.policy"
  sed -i 's/{@lib}/lib/g' "$pkgdir/usr/share/polkit-1/actions/org.airvpn.eddie.ui.elevated.policy"
  install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/pixmaps/eddie-ui.png"  "$pkgdir/usr/share/pixmaps/eddie-ui.png"

  ## Fix .desktop file for KDE
  _desktop_session=$(printf "%s" "$DESKTOP_SESSION" | awk -F "/" '{print $NF}')
  if [ "$_desktop_session" = "plasma" ]; then
    msg2 "Installing desktop file for KDE..."
    desktop-file-install -m 644 --set-comment="OpenVPN UI" \
    --dir="$pkgdir/usr/share/applications/" \
    --set-icon="/usr/share/pixmaps/eddie-ui.png" \
    "repository/linux_arch/bundle/eddie-ui/usr/share/applications/eddie-ui.desktop"
  else
    msg2 "Installing desktop file..."
    desktop-file-install -m 644 --set-comment="OpenVPN UI" \
    --dir="$pkgdir/usr/share/applications/" \
    "repository/linux_arch/bundle/eddie-ui/usr/share/applications/eddie-ui.desktop"
  fi
}

