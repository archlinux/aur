# Maintainer: Drew DeVault <sir@cmpwn.com>

pkgname=roslyn-git
_pkgname=roslyn
pkgver=0.0.0.a999eac
pkgrel=1
pkgdesc="Microsoft's C# compiler and compiler libraries"
arch=(any)
license=('custom:MITX11')
url="https://github.com/dotnet/roslyn"
depends=('mono' 'mono-pcl')
install="roslyn.install"
makedepends=('git')
provides=('roslyn')
conflicts=('roslyn')
source=(git://github.com/mono/roslyn
        'csc'
        'Microsoft.Net.ToolsetCompilers.prop'
        'roslyn.install')
md5sums=('SKIP'
         'c83e208e99cf04dfe753dfe097f69f7d'
         '143e8273dbc5a34f27a8d3925870fdba'
         '9131a3bff4ba28c322d6f8f41c3941c9')

pkgver() {
	cd ${srcdir}/${_pkgname}
        echo -n "0.0.0."
        git show HEAD --format=%h
}

build() {
  cd "${srcdir}"/${_pkgname}

  mono Src/.nuget/NuGet.exe restore Src/Roslyn.sln

  cp "${srcdir}"/Microsoft.Net.ToolsetCompilers.prop \
    packages/Microsoft.Net.ToolsetCompilers.1.0.0-beta2-20141216-04/build/Microsoft.Net.ToolsetCompilers.props

  xbuild /p:Configuration=Release Src/Tools/Source/FakeSign/FakeSign.csproj
  xbuild /p:Configuration=Release Src/Compilers/CSharp/csc/csc.csproj
}

package() {
  cd "${srcdir}"/${_pkgname}
  for file in `find Binaries/Release/ -name '*.dll'`; do
    install -Dm644 $file "$pkgdir/usr/lib/roslyn/$(basename "$file")"
  done
  for file in `find Binaries/Release/ -name '*.exe'`; do
    install -Dm755 $file "$pkgdir/usr/lib/roslyn/$(basename "$file")"
  done
  install -Dm644 License.txt "$pkgdir/usr/share/licenses/roslyn/License.txt"
  install -Dm775 "${srcdir}"/csc "$pkgdir/usr/bin/csc"
}
