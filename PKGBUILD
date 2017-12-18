# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=mono-addins
pkgver=1.3.3
pkgrel=1
pkgdesc="A generic framework for creating extensible applications and for creating libraries which extend those applications"
arch=('x86_64')
url="http://www.mono-project.com/Mono.Addins"
license=('MIT')
depends=('gtk-sharp-2' 'gtk-sharp-3' 'mono')
source=(https://github.com/mono/mono-addins/archive/${pkgname}-${pkgver}.tar.gz
        https://github.com/Microsoft/msbuild/releases/download/mono-hosted-msbuild-v0.03/mono_msbuild_d25dd923839404bd64cc63f420e75acf96fc75c4.zip)
md5sums=('7ac27ffa4616fd03dc299749f16bce2a'
         '14345c2f2dc53aa902a89419e234d2d4')

build() {
  local msbuild="$srcdir/msbuild/MSBuild.exe"

  cd ${pkgname}-${pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr --enable-gui
  make

  mono "$msbuild" Mono.Addins/Mono.Addins.csproj /p:WarningLevel=0;Configuration=Release
  mono "$msbuild" Mono.Addins.CecilReflector/Mono.Addins.CecilReflector.csproj /p:WarningLevel=0;Configuration=Release
  mono "$msbuild" Mono.Addins.Gui/Mono.Addins.Gui.csproj /p:WarningLevel=0;Configuration=Release
  mono "$msbuild" Mono.Addins.GuiGtk3/Mono.Addins.GuiGtk3.csproj /p:WarningLevel=0;Configuration=Release
  mono "$msbuild" Mono.Addins.MSBuild/Mono.Addins.MSBuild.csproj /p:WarningLevel=0;Configuration=Release
  mono "$msbuild" Mono.Addins.Setup/Mono.Addins.Setup.csproj /p:WarningLevel=0;Configuration=Release
} 

package() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
