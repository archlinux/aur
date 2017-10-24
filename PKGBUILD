# $Id: PKGBUILD 289219 2017-02-18 19:06:17Z arojas $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=monodevelop
pkgver=6.2.0.1778
pkgrel=2
pkgdesc="An IDE primarily designed for C# and other .NET languages"
arch=('x86_64' 'i686')
url="http://www.monodevelop.com"
license=('GPL')
depends=('mono>=4.0.1' 'mono-addins>=0.6.2' 'gtk-sharp-2' 'referenceassemblies-pcl' 'fsharp' 'libssh2' 'curl')
makedepends=('rsync' 'cmake' 'git' 'nuget')
replaces=('monodevelop-debugger-gdb')
provides=('monodevelop-debugger-gdb')
options=(!makeflags)
optdepends=('xsp: To run ASP.NET pages directly from monodevelop')
source=(git://github.com/mono/monodevelop.git#tag=monodevelop-$pkgver)
md5sums=('SKIP')

prepare() {
  cd $pkgname
  git submodule update --init --recursive || return 1
  git checkout tags/$pkgname-$pkgver
  git clean -dfx
}

build() {
  cd $pkgname
  
  ./configure --prefix=/usr --profile=stable 
  XDG_CONFIG_HOME="$srcdir"/config LD_PRELOAD="" make
}

package() {
  cd $pkgname
  
  XDG_CONFIG_HOME="$srcdir"/config LD_PRELOAD="" make DESTDIR="$pkgdir" install
  # delete conflicting files
  find "$pkgdir"/usr/share/mime/ -type f -delete

  # NuGet.exe is missing somehow, fixed FS#43423
  #install -Dm755 "${srcdir}"/monodevelop/main/external/nuget-binary/NuGet.exe "${pkgdir}"/usr/lib/monodevelop/AddIns/MonoDevelop.PackageManagement/NuGet.exe
}

