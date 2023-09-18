# Maintainer: xiota / aur.chaotic.cx
# Contributor: necklace <ns@nsz.no>

_pkgname="avaloniailspy"
pkgname="$_pkgname-git"
pkgver=7.2.rc.r10.gbc00df4
pkgrel=1
url="https://github.com/icsharpcode/AvaloniaILSpy"
pkgdesc="Avalonia-based .NET Decompiler (port of ILSpy)"
arch=("any")
license=(
  'LGPL2.1'
  'MIT'
  'Ms-PL'
)

depends=(
  'dotnet-runtime'
)
makedepends=(
  'dotnet-sdk'
  'libicns'
  'git'
  'mono'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("avaloniailspy")
  conflicts=("avaloniailspy")
fi

_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+$url"
  "$_pkgname.desktop"
)
sha256sums=(
  "SKIP"
  "64135778bb5780ebcf2343cfa69b3518d4cb12e043febc9ae42d4fa93dc10d87"
)

pkgver() {
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgsrc"
  icns2png -x ILSpy/ILSpy.icns
}

build() {
  cd "$srcdir/$_pkgsrc"

  dotnet tool restore
  dotnet cake
}

package() {
  mkdir -p "$pkgdir/usr/share/"
  cp -r "$srcdir/$_pkgsrc/artifacts/linux-x64/" "$pkgdir/usr/share/$_pkgname"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s "/usr/share/$_pkgname/ILSpy" "$pkgdir/usr/bin/$_pkgname"

  # Licenses
  install -Dm644 "$srcdir/$_pkgsrc/doc/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgsrc/doc/LGPL.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL-2.1"
  install -Dm644 "$srcdir/$_pkgsrc/doc/MS-PL.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MSPL"

  # Icon for .desktop
  install -Dm644 "$srcdir/$_pkgsrc/ILSpy_256x256x32.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # .desktop
  install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
