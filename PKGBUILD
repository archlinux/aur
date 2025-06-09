# Maintainer: glassiguana
pkgname=mextool
pkgver=1.1.0
pkgrel=1
pkgdesc="Super Smash Bros. Melee modding tool (runs with Wine)"
arch=("x86_64")
url="https://github.com/akaneia/mexTool"
license=('custom:none')
depends=('wine' 'winetricks' 'mono' 'unzip')
makedepends=('mono-msbuild' 'wget')
source=("git+https://github.com/akaneia/mexTool.git"
        "mextool.desktop"
        "mextool.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/mexTool"

  # Restore dependencies
  mkdir -p .nuget
  wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -O .nuget/NuGet.exe
  mono .nuget/NuGet.exe restore mexTool.sln

  # Remove broken icon references
  sed -i '/<data name=".*Icon.*"/,/data>/d' mexTool/GUI/*.resx
  sed -i '/<data name=".*Icon.*"/,/data>/d' mexTool/MxDtWindow.resx

  # Build
  msbuild mexTool.sln /p:Configuration=Release
}

package() {
  install -d "$pkgdir/opt/mextool"
  cp -r "$srcdir/mexTool/mexTool/bin/Release"/* "$pkgdir/opt/mextool/"

  # Desktop entry
  install -Dm644 "$srcdir/mextool.desktop" "$pkgdir/usr/share/applications/mextool.desktop"

  # Icon
  install -Dm644 "$srcdir/mextool.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/mextool.png"

  # Wrapper script to run in user space
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/mextool" <<'EOF'
#!/bin/bash
APPDIR="$HOME/.local/share/mextool"

if [ ! -d "$APPDIR" ]; then
  mkdir -p "$APPDIR"
  cp -r /opt/mextool/* "$APPDIR"
fi

wine "$APPDIR/mexTool.exe"
EOF
}
