# Maintainer: Brenton Horne <brentonhorne77@gmail.com>
# Contributor: Malah <malah@neuf.fr>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: arojas
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=monodevelop-beta
_pkgname=monodevelop
pkgver=6.2.0.1358
pkgrel=1
pkgdesc="An IDE primarily designed for C# and other .NET languages - Beta channel. WARNING: this package requires over 500 MB worth of data to be downloaded."
arch=('any')
url="http://www.monodevelop.com"
license=('GPL')
depends=('mono>=4.0.1' 'mono-addins>=0.6.2' 'gnome-sharp' 'hicolor-icon-theme' 'fsharp')
makedepends=('rsync' 'cmake' 'git' 'nuget' 'fsharp' 'mono-pcl')
options=(!makeflags)
optdepends=('xsp: To run ASP.NET pages directly from monodevelop')
provides=('monodevelop')
conflicts=('monodevelop')
source=(git://github.com/mono/monodevelop.git#tag=${_pkgname}-$pkgver)
md5sums=('SKIP')

build() {
  export MONO_SHARED_DIR=$srcdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$_pkgname
  git submodule update --init --recursive || return 1
  git checkout tags/$_pkgname-$pkgver
  git clean -dfx

  ./configure --prefix=/usr --profile=stable
  
  # fix MonoDevelop.FSharp.Shared.ToolTips
  # tips https://bugzilla.xamarin.com/show_bug.cgi?id=43657#c13
  # source https://github.com/mono/monodevelop/commit/e4037243e8ba2d78136d033578efd9b48a5a3fa3
  sed -i -e "s/MonoDevelop.FSharp.Shared.ToolTip /MonoDevelop.FSharp.Shared.ToolTips.ToolTip /" "${srcdir}/${_pkgname}"/main/external/fsharpbinding/MonoDevelop.FSharpBinding/FSharpTextEditorCompletion.fs
  sed -i -e "s/MonoDevelop.FSharp.Shared.EmptyTip /MonoDevelop.FSharp.Shared.ToolTips.EmptyTip /" "${srcdir}/${_pkgname}"/main/external/fsharpbinding/MonoDevelop.FSharpBinding/FSharpTextEditorCompletion.fs
  
  XDG_CONFIG_HOME="$srcdir"/config LD_PRELOAD="" make
}

package() {
  cd $srcdir/$_pkgname

  XDG_CONFIG_HOME="$srcdir"/config LD_PRELOAD="" make DESTDIR=$pkgdir install
  # delete conflicting files
  rm -r $(find $pkgdir/usr/share/mime/ -type f | grep -v "packages")
  rm -r $MONO_SHARED_DIR

  # nuget.exe is missing somehow, fixed FS#43423
  install -Dm755 "${srcdir}"/monodevelop/main/external/nuget-binary/nuget.exe "${pkgdir}"/usr/lib/monodevelop/AddIns/MonoDevelop.PackageManagement/nuget.exe
}
