# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>
pkgname=wireview-linux
pkgver=1.0.3.2
pkgrel=1
pkgdesc="Unofficial Linux port of the Thermal Grizzly WireView Pro II desktop application"
arch=('x86_64')
url="https://github.com/emaspa/wireview-linux"
license=('custom')
depends=('glibc' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libx11')
makedepends=('dotnet-sdk' 'git' 'imagemagick')
options=('!strip')
source=(
  "git+$url.git#tag=v$pkgver"
  "$pkgname.desktop"
)
sha256sums=('8974a95c8f0aa210aa983a755d5fa502f8b76b54bbeb9f26ec5a9cab4840da18'
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
}

package() {
  cd "$pkgname"
  
  # Install the compiled application to /opt
  install -d "$pkgdir/opt/$pkgname"
  cp -a out/* "$pkgdir/opt/$pkgname/"
  
  # Set correct permissions for the executable
  chmod +x "$pkgdir/opt/$pkgname/WireView2"
  
  # Create a symlink in /usr/bin to launch from terminal
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/WireView2" "$pkgdir/usr/bin/$pkgname"
  
  # Install udev rules for device permissions (grants plugdev/dialout access to the device)
  install -Dm644 udev/99-wireview.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  
  # Convert the .ico to .png using ImageMagick (extracting the first/highest quality frame [0])
  install -d "$pkgdir/usr/share/pixmaps"
  magick WireView2/Assets/Icons/bear.ico[0] "$pkgdir/usr/share/pixmaps/$pkgname.png"
  
  # Install the desktop file from the source array
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
