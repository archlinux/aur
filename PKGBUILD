# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
# Co-Maintainer: Emanuele Sparvoli <sparvoli@gmail.com>
pkgname=wireview-linux
pkgver=1.4.0.0
pkgrel=1
pkgdesc="Unofficial Linux port of the Thermal Grizzly WireView Pro II desktop application, with WireView Mini"
arch=('x86_64')
url="https://github.com/emaspa/wireview-linux"
license=('custom')
depends=('glibc' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libx11' 'dfu-util')
optdepends=('wireview-hwmon: hwmon + daemon mode (1.8.1 or later takes the LAN port back from WireView Mini)')
# clang: WireView Mini is compiled ahead of time (NativeAOT).
makedepends=('dotnet-sdk' 'git' 'clang')
options=('!strip')
source=(
  "git+$url.git#tag=v$pkgver"
  "$pkgname.desktop"
)
sha256sums=('SKIP'
            'f9336a2a0dc5f6b959ef2ae83d228f68d269f4a84d9651b318d669888d73f646')

build() {
  cd "$pkgname"

  # Set environment variables for a clean .NET build
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export DOTNET_NOLOGO=1

  # Publish the app as a self-contained, single-file executable
  dotnet publish WireView2/WireView2.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --self-contained true \
    -p:PublishSingleFile=true \
    --output out

  # WireView Mini: one native executable (NativeAOT), with the serial port
  # library and the firmware image and factory artwork it reads next to itself
  dotnet publish WireViewMini/WireViewMini.csproj \
    --configuration Release \
    --framework net8.0 \
    --runtime linux-x64 \
    --output out-mini
}

package() {
  cd "$pkgname"

  # Install the compiled application to /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -a out/* "$pkgdir/opt/$pkgname/"

  # Set correct permissions for the executable
  chmod +x "$pkgdir/opt/$pkgname/WireView2"

  # WireView Mini next to the app. It finds its files through the symlink's
  # real path; the three companions are the same files the app ships.
  install -m755 out-mini/wireview-mini "$pkgdir/opt/$pkgname/wireview-mini"
  install -m644 out-mini/libSystem.IO.Ports.Native.so out-mini/TG-WV-PRO2-FW.hex out-mini/ext_flash.bin \
    "$pkgdir/opt/$pkgname/"

  # Create symlinks in /usr/bin to launch from terminal
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/WireView2" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$pkgname/wireview-mini" "$pkgdir/usr/bin/wireview-mini"

  # udev rule (USB serial access). Arch has no dialout group, its serial group
  # is uucp. The serial port gets uucp from Arch's default rules; the DFU
  # bootloader line names dialout, which udev would drop with a log message.
  # The grep fails the build if a future rule stops matching the substitution.
  install -Dm644 udev/99-wireview.rules "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"
  sed -i 's/GROUP="dialout"/GROUP="uucp"/g' "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"
  grep -q 'GROUP="uucp"' "$pkgdir/usr/lib/udev/rules.d/99-wireview.rules"

  # Install the 128x128 icon shipped by upstream for the AUR
  install -Dm644 aur/wireview-linux.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  # Install the desktop file from the source array
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
