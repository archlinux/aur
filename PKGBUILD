pkgname=monodevelop-git-nuget3
_pkgname=monodevelop
pkgver=r48043
_branch="master"
pkgrel=2
pkgdesc="An IDE primarily designed for C# and other .NET languages - built from git sources. WARNING: building this package will require you to download >500 MB worth of data."
arch=('any')
url="http://www.monodevelop.com"
license=('GPL')
depends=('mono>=4.0.1' 'mono-addins>=0.6.2' 'gtk-sharp-2' 'hicolor-icon-theme' 'http-parser' 'curl' 'fsharp')
makedepends=('rsync' 'cmake' 'git' 'nuget3' 'mono-pcl')
options=(!makeflags)
optdepends=('xsp: To run ASP.NET pages directly from monodevelop')
provides=('monodevelop')
conflicts=('monodevelop' 'monodevelop-stable' 'monodevelop-git')
source=("git://github.com/mono/monodevelop.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _REV=$(git rev-list --count ${_branch})
  printf "r${_REV}"
}

prepare() {
  cd $srcdir/$_pkgname

  sed -i -e "s/MonoDevelop.FSharp.Shared.ToolTip /MonoDevelop.FSharp.Shared.ToolTips.ToolTip /" main/external/fsharpbinding/MonoDevelop.FSharpBinding/FSharpTextEditorCompletion.fs
  sed -i -e "s/MonoDevelop.FSharp.Shared.EmptyTip /MonoDevelop.FSharp.Shared.ToolTips.EmptyTip /" main/external/fsharpbinding/MonoDevelop.FSharpBinding/FSharpTextEditorCompletion.fs
}

build() {
  export MONO_SHARED_DIR=$srcdir/src/.wabi
  mkdir -p $MONO_SHARED_DIR

  cd $srcdir/$_pkgname
  git submodule update --init --recursive || return 1
  git clean -dfx

  ./configure --prefix=/usr
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
