# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=capri-desktop
pkgver=0.8.8
pkgrel=1
pkgdesc="Unofficial Capri desktop companion: she sits on your windows, chats and does things for you"
arch=('x86_64')
url="https://github.com/lachydotmcg/capri-desktop"
license=('PolyForm-Noncommercial-1.0.0')
# Framework-dependent build on Arch's .NET runtime. The rest are the system
# libraries Avalonia and Skia load.
depends=('dotnet-runtime-10.0' 'glibc' 'libgcc' 'libstdc++' 'fontconfig'
         'libx11' 'libice' 'libsm' 'libxcursor' 'libxext' 'libxfixes' 'libxi'
         'libxrandr' 'hicolor-icon-theme')
makedepends=('dotnet-sdk-10.0')
# She calls these tools when they are there.
optdepends=('ollama: her brain on this computer'
            'wmctrl: switch and close windows on X11'
            'xdotool: minimise windows and close tabs on X11'
            'xorg-xprop: see the active window on X11'
            'libpulse: set the volume'
            'xclip: copy to the clipboard on X11'
            'wl-clipboard: copy to the clipboard on Wayland'
            'spectacle: screenshots on KDE Plasma'
            'gnome-screenshot: screenshots on GNOME'
            'grim: screenshots on other Wayland desktops'
            'scrot: screenshots on X11')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41e0314312dbabedc4e8f2379d665435974a397eff60fc0034e728479fba2329')

prepare() {
  cd "${pkgname}-${pkgver}"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  # keep NuGet's cache inside the build tree instead of ~/.nuget
  export NUGET_PACKAGES="$srcdir/nuget"
  dotnet restore cross/Capri.Cross.csproj -r linux-x64
}

build() {
  cd "${pkgname}-${pkgver}"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1 DOTNET_NOLOGO=1
  export NUGET_PACKAGES="$srcdir/nuget"
  # Upstream's Linux build from .github/workflows/mac-linux.yml, but not
  # self-contained and not a single file.
  dotnet publish cross/Capri.Cross.csproj -c Release -r linux-x64 \
    --self-contained false --no-restore -p:DebugType=none -o "$srcdir/publish"
}

package() {
  install -d "$pkgdir/opt/capri-desktop" "$pkgdir/usr/bin"
  cp -a "$srcdir/publish/." "$pkgdir/opt/capri-desktop/"
  ln -s /opt/capri-desktop/Capri "$pkgdir/usr/bin/capri-desktop"

  cd "${pkgname}-${pkgver}"

  # upstream's entry, with the command of this package
  sed 's/^Exec=Capri$/Exec=capri-desktop/' cross/linux/capri-desktop.desktop \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/capri-desktop.desktop"
  install -Dm644 cross/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/capri-desktop.png"

  install -Dm644 LICENSE.md THIRD-PARTY-NOTICES.md assets/fonts/Barlow-OFL.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname"
}
