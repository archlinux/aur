# Maintainer:

## options
: ${_install_path=usr/lib}

_pkgname="avaloniailspy"
pkgname="$_pkgname-git"
pkgver=7.2rc.r10.gbc00df4
pkgrel=3
pkgdesc="Avalonia-based .NET Decompiler (port of ILSpy)"
url="https://github.com/icsharpcode/AvaloniaILSpy"
license=('MIT' 'LGPL-2.1-only' 'MS-PL')
arch=("any")

depends=(
  'dotnet-runtime'
)
makedepends=(
  'dotnet-sdk'
  'git'
  'libicns'
  'optipng'
)
optdepends=(
  'noto-fonts: prevent missing font error'
  'ttf-caladea: prevent missing font error'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed -E 's/^v//;s/-(rc)/\1/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  icns2png -x "$_pkgsrc/ILSpy/ILSpy.icns"
  optipng ILSpy_256x256x32.png

  cd "$_pkgsrc"
  dotnet tool restore
  dotnet cake
}

package() {
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  cp -r "$_pkgsrc/artifacts/linux-x64"/* "$pkgdir/$_install_path/$_pkgname/"

  # icon
  install -Dm644 "ILSpy_256x256x32.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=AvaloniaILSpy
Comment=$pkgdesc
Exec=$_pkgname %u
Icon=$_pkgname
Terminal=false
StartupNotify=true
Categories=Development;
END

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec "/$_install_path/$_pkgname/ILSpy" "\$@"
END

  # licenses
  install -Dm644 "$_pkgsrc/doc/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
  install -Dm644 "$_pkgsrc/doc/LGPL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL-2.1"
  install -Dm644 "$_pkgsrc/doc/MS-PL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MS-PL"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
