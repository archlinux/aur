# Maintainer: Eddie.website <maintainer@eddie.website>
# Based on work by Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ> and Beini <bane aτ iki dot fi>


pkgname=eddie-ui
pkgver=2.24.6
pkgrel=1
pkgdesc='Eddie - VPN tunnel - UI'
arch=('x86_64' 'aarch64' 'armv7l')
url=https://eddie.website
license=(GPLv3)
depends=(mono curl openvpn sudo polkit libnotify libayatana-appindicator)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH')
makedepends=(git cmake patchelf dotnet-sdk mono-msbuild mono desktop-file-utils)
provides=('eddie-ui')
conflicts=('airvpn' 'airvpn-beta-bin' 'airvpn-git')
install=eddie-ui.install
source=('https://github.com/AirVPN/Eddie/archive/2.24.6.tar.gz')
sha1sums=('be47d85e5d11070708bb6d55260874a72ffc0761')
options=('!strip') # Incompatible with net8



ARCH=$CARCH
RID=linux-$CARCH
if [ "$RID" = "linux-x86_64" ]; then
  ARCH=x64
  RID=linux-x64
elif [ "$RID" = "linux-aarch64" ]; then
  RID=linux-arm64
elif [ "$RID" = "linux-armv7l" ]; then
  RID=linux-arm
fi

build() {  

  CONFIG=Release  

  cd "Eddie-$pkgver"

  # CLI
  if true; then    

    chmod +x src/App.CLI.Linux/postbuild.sh
    chmod +x src/Lib.Platform.Linux.Native/build.sh

    cd "src/App.CLI.Linux/"

    dotnet publish App.CLI.Linux.net8.csproj --configuration ${CONFIG} --runtime ${RID} --self-contained true -p:PublishTrimmed=true -p:EnableCompressionInSingleFile=true    

    cd "../../"
  fi

  # UI
  if [ "ui" = "ui" ]; then
    FRAMEWORK="net4" # Forced for now
    if [ $FRAMEWORK = "net8" ]; then
        chmod +x src/App.UI.Linux/build.sh
        "src/App.UI.Linux/build.sh" Release        
    elif [ $FRAMEWORK = "net4" ]; then

        # Note: x64 in path hardcoded, correct, net4 build are CIL      
        
        export TERM=xterm # Fix Mono bug "Magic number is wrong".
        #TARGETFRAMEWORK="v4.8"; # Removed for https://aur.archlinux.org/packages/eddie-ui#comment-920114
        RULESETPATH="src/ruleset/norules.ruleset"
        SOLUTIONPATH="src/App.Forms.Linux//App.Forms.Linux.sln"
        
        # clean temporary files from net8 compilation above, otherwise throw 'Your project does not reference ".NETFramework,Version=v4.8"'
        rm -rf "src/Lib.Core/bin"
        rm -rf "src/Lib.Core/obj"
        rm -rf "src/Lib.Platform.Linux/bin"
        rm -rf "src/Lib.Platform.Linux/obj"
        
        # msbuild is available when monodevelop is installed (reccomended)
        # xbuild is available when mono-complete is installed (deprecated)        
        #msbuild /verbosity:minimal /p:Configuration=${CONFIG} /p:Platform=x64 /p:TargetFrameworkVersion=${TARGETFRAMEWORK} /t:Rebuild "${SOLUTIONPATH}" /p:DefineConstants="EDDIEMONO4LINUX"
        msbuild /verbosity:minimal /p:Configuration=${CONFIG} /p:Platform=x64 /t:Rebuild "${SOLUTIONPATH}" /p:DefineConstants="EDDIEMONO4LINUX"

        # msbuild/Mono under Linux don't honor the postbuild event, called manually
        "src/App.Forms.Linux/postbuild.sh" "src/App.Forms.Linux/bin/x64/${CONFIG}/" ${ARCH} ${CONFIG}
                
        # mkbundle        
        if [ $ARCH = "x64" ]; then
            MKBUNDLECROSSTARGET="mono-6.8.0-debian-10-x64"
        elif [ $ARCH = "armv7l" ]; then
            MKBUNDLECROSSTARGET="mono-6.0.0-raspbian-9-arm"
        elif [ $ARCH = "aarch64" ]; then
            MKBUNDLECROSSTARGET="mono-6.6.0-debian-10-arm64"
        else
            MKBUNDLECROSSTARGET="mono-6.8.0-debian-10-${ARCH}"
        fi

        # Issue here, check with 'mkbundle --list-targets'
        #mkdir -p /home/pi/.mono/targets/${MKBUNDLECROSSTARGET}/lib/mono # Not sure if need
        if [[ ! -d ${HOME}/.mono/targets/${MKBUNDLECROSSTARGET} ]]; then
            echo Download mkbundle target. If break here, check with 'mkbundle --list-targets' and fix build.sh MKBUNDLECROSSTARGET
            mkbundle --fetch-target ${MKBUNDLECROSSTARGET}
        fi

        # Update config
        cp ${HOME}/.mono/targets/${MKBUNDLECROSSTARGET}/etc/mono/config src/App.Forms.Linux/bin/x64/Release/mkbundle.config
        sed -i 's/\$mono_libdir\///g' src/App.Forms.Linux/bin/x64/Release/mkbundle.config

        cd src/App.Forms.Linux/bin/x64/Release/
        mkbundle App.Forms.Linux.exe -o eddie-ui --cross ${MKBUNDLECROSSTARGET} --i18n all --config mkbundle.config --library ../../../../../repository/linux_portable/mkbundle/${ARCH}/libMonoPosixHelper.so --library ../../../../../repository/linux_portable/mkbundle/${ARCH}/libgdiplus.so.0 --library /usr/lib/libmono-native.so
        cd ../../../../..        
    fi    
  fi

  # Generate changelog
  curl "https://eddie.website/changelog/?software=client&format=debian&hidden=yes" -o "changelog"
  gzip -n -9 -f "changelog"
  
  if [ "ui" = "cli" ]; then
    # Generate man
    "src/App.CLI.Linux/bin/Release/net8.0/${RID}/publish/eddie-cli" --path.resources="../../../../../../resources" --help --help.format=man >"eddie-cli.8"
    gzip -n -9 -f "eddie-cli.8"
  fi

}

package() {
  cd "Eddie-$pkgver"  
  
  install -Dm755 "repository/linux_arch/bundle/eddie-ui/usr/bin/eddie-ui" "$pkgdir/usr/bin/eddie-ui"
  
  install -Dm644 "resources/eddie-vpn.txt"       "$pkgdir/usr/share/eddie-ui/eddie-vpn.txt"
  install -Dm644 "resources/manifest.json"       "$pkgdir/usr/share/eddie-ui/manifest.json"
  install -Dm644 "resources/libraries.txt"       "$pkgdir/usr/share/eddie-ui/libraries.txt"
  install -Dm644 "resources/gpl3.txt"       "$pkgdir/usr/share/eddie-ui/gpl3.txt"
  install -Dm644 "resources/cacert.pem"       "$pkgdir/usr/share/eddie-ui/cacert.pem"
  install -Dm644 "resources/iso-3166.json"       "$pkgdir/usr/share/eddie-ui/iso-3166.json"

  install -Dm644 "resources/lang/inv.json"       "$pkgdir/usr/share/eddie-ui/lang/inv.json"

  install -Dm644 "resources/icons/appindicator.png"       "$pkgdir/usr/share/eddie-ui/icons/appindicator.png"
  install -Dm644 "resources/icons/appindicator-gray.png"       "$pkgdir/usr/share/eddie-ui/icons/appindicator-gray.png"
  install -Dm644 "resources/icons/notifyicon.ico"       "$pkgdir/usr/share/eddie-ui/icons/notifyicon.ico"
  install -Dm644 "resources/icons/notifyicon-gray.ico"       "$pkgdir/usr/share/eddie-ui/icons/notifyicon-gray.ico"
  install -Dm644 "resources/icons/icon.png"       "$pkgdir/usr/share/eddie-ui/icons/icon.png"
  install -Dm644 "resources/icons/icon-gray.png"       "$pkgdir/usr/share/eddie-ui/icons/icon-gray.png"
  
  install -Dm644 "resources/providers/OpenVPN.json"       "$pkgdir/usr/share/eddie-ui/providers/OpenVPN.json"
  install -Dm644 "resources/providers/WireGuard.json"       "$pkgdir/usr/share/eddie-ui/providers/WireGuard.json"
  install -Dm644 "resources/providers/AirVPN.json"       "$pkgdir/usr/share/eddie-ui/providers/AirVPN.json"

  install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/doc/eddie-ui/copyright"    "$pkgdir/usr/share/doc/eddie-ui/copyright"
  install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/polkit-1/actions/org.airvpn.eddie.ui.elevated.policy" "$pkgdir/usr/share/polkit-1/actions/org.airvpn.eddie.ui.elevated.policy"
  
  install -Dm644 "changelog.gz" "$pkgdir/usr/share/doc/eddie-ui/changelog.gz"

  install -Dm755 "src/App.CLI.Linux/bin/Release/net8.0/${RID}/libLib.Platform.Linux.Native.so" "$pkgdir/usr/lib/eddie-ui/libLib.Platform.Linux.Native.so"
  install -Dm755 "src/App.CLI.Linux/bin/Release/net8.0/${RID}/eddie-cli-elevated" "$pkgdir/usr/lib/eddie-ui/eddie-cli-elevated"
  install -Dm755 "src/App.CLI.Linux/bin/Release/net8.0/${RID}/eddie-cli-elevated-service" "$pkgdir/usr/lib/eddie-ui/eddie-cli-elevated-service"
  install -Dm755 "src/App.CLI.Linux/bin/Release/net8.0/${RID}/publish/eddie-cli" "$pkgdir/usr/lib/eddie-ui/eddie-cli"

  if [ "ui" = "cli" ]; then
    install -Dm644 "eddie-cli.8.gz" "$pkgdir/usr/share/man/man8/eddie-cli.8.gz"
  elif [ "ui" = "ui" ]; then
    FRAMEWORK="net4" # Forced for now
    if [ $FRAMEWORK = "net8" ]; then
      echo TODO
    elif [ $FRAMEWORK = "net4" ]; then        
      install -Dm755 "src/App.Forms.Linux.Tray/bin/eddie-tray" "$pkgdir/usr/lib/eddie-ui/eddie-tray"      
      install -Dm755 "src/App.Forms.Linux/bin/x64/Release/eddie-ui" "$pkgdir/usr/lib/eddie-ui/eddie-ui"      
    fi
    
    install -Dm644 "repository/linux_arch/bundle/eddie-ui/usr/share/pixmaps/eddie-ui.png"  "$pkgdir/usr/share/pixmaps/eddie-ui.png"
  fi 

  
  # Unknown if this is need today, 2023-12-12
  if [ "ui" = "ui" ]; then
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
  fi
}

