# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgname=dotdevelop-git
pkgrel=1
pkgver=r65276.7dc1f75236
pkgdesc="Gtk# based IDE for .NET"
arch=('any')
url="https://github.com/dotdevelop"
license=('LGPLv2 and MIT')
depends=('gtk-sharp-2' 'gnome-sharp' 'glade-sharp' 'hicolor-icon-theme')
makedepends=('cmake' 'clang' 'intltool' 'wget' 'curl' 'nuget' 'mono' 'mono-msbuild' 'fsharp-mono-bin' 'dotnet-sdk-6.0')
options=(!makeflags)
conflicts=('monodevelop')
source=('dotdevelop::git+https://github.com/dotdevelop/dotdevelop.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd "dotdevelop"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "dotdevelop"

    git submodule update --init --recursive

    export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
    export MSBuildEnableWorkloadResolver=false
}

build() {
  cd "dotdevelop"

  ./configure --profile=gnome --enable-release --prefix=/usr
  make
}

package() {
  cd "dotdevelop"

  make install DESTDIR=$pkgdir

  cp -r main/build/AddIns "$pkgdir/usr/lib/monodevelop/"
  cp -r main/build/bin "$pkgdir/usr/lib/monodevelop/"
  cp -r main/build/data "$pkgdir/usr/lib/monodevelop/"
  cp -r main/build/locale "$pkgdir/usr/lib/monodevelop/"
}
