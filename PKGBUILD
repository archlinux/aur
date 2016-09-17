# $Id$
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Malah <malah at neuf dot fr>
# Contributor: Daniel Isenmann <daniel at archlinux dot org>
# Contributor: arojas
# Contributor: Timm Preetz <timm at preetz dot us>
# Contributor: Giovanni Scafora <giovanni at archlinux dot org>

pkgname=monodevelop-git
_pkgname=monodevelop
pkgver=6.1.0.5441.445
_pkgver=6.1.0.5441
pkgrel=1
pkgdesc="An IDE primarily designed for C# and other .NET languages - built from git sources. WARNING: building this package will require you to download >500 MB worth of data."
arch=('any')
url="http://www.monodevelop.com"
license=('GPL')
depends=('mono>=4.0.1' 'mono-addins>=0.6.2' 'gnome-sharp' 'hicolor-icon-theme' 'http-parser' 'curl')
makedepends=('rsync' 'cmake' 'git' 'nuget' 'mono-pcl')
options=(!makeflags)
optdepends=('xsp: To run ASP.NET pages directly from monodevelop')
provides=('monodevelop')
conflicts=('monodevelop' 'monodevelop-stable')
source=("git://github.com/mono/monodevelop.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _REV=$(git rev-list --count monodevelop-${_pkgver}..HEAD)
  printf "${_pkgver}.${_REV}"
}

build() {
  export MONO_SHARED_DIR=$srcdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$_pkgname
  git submodule update --init --recursive || return 1
  git clean -dfx

  ./configure --prefix=/usr --profile=stable
  XDG_CONFIG_HOME="$srcdir"/config LD_PRELOAD="" make
}

package() {
  cd $srcdir/$_pkgname

  XDG_CONFIG_HOME="$srcdir"/config LD_PRELOAD="" make DESTDIR=$pkgdir install
  # delete conflicting files
  rm -r $(find $pkgdir/usr/share/mime/ -type f | grep -v "packages")
  rm -r $MONO_SHARED_DIR

  # NuGet.exe is missing somehow, fixed FS#43423
  install -Dm755 "${srcdir}"/monodevelop/main/external/nuget-binary/nuget.exe "${pkgdir}"/usr/lib/monodevelop/AddIns/MonoDevelop.PackageManagement/NuGet.exe
}
