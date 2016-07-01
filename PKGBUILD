# $Id$
# Maintainer: Malah <malah@neuf.fr>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=monodevelop-stable
_pkgname=monodevelop
pkgver=6.0.1.9
pkgrel=1
pkgdesc="An IDE primarily designed for C# and other .NET languages"
arch=('any')
url="http://www.monodevelop.com"
license=('GPL')
depends=('mono>=4.0.1' 'mono-addins>=0.6.2' 'gnome-sharp' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('rsync' 'cmake' 'git' 'nuget' 'mono-pcl')
options=(!makeflags)
optdepends=('xsp: To run ASP.NET pages directly from monodevelop')
provides=('monodevelop')
conflicts=('monodevelop')
install=${_pkgname}.install
source=(git://github.com/mono/${_pkgname}.git)
md5sums=('SKIP')

build() {
  export MONO_SHARED_DIR=$srcdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$_pkgname
  git submodule update --init --recursive || return 1
  git checkout tags/$_pkgname-$pkgver
  git clean -dfx
  
  ./configure --prefix=/usr --profile=stable 
  LD_PRELOAD="" make
}

package() {
  cd $srcdir/$_pkgname
  
  LD_PRELOAD="" make DESTDIR=$pkgdir install
  # delete conflicting files
  rm -rf $(find $pkgdir/usr/share/mime/ -type f | grep -v "packages")
  rm -r $MONO_SHARED_DIR
  
  # NuGet.exe is missing somehow, fixed FS#43423
  install -Dm755 "${srcdir}"/monodevelop/main/external/nuget-binary/NuGet.exe "${pkgdir}"/usr/lib/monodevelop/AddIns/MonoDevelop.PackageManagement/NuGet.exe
}
