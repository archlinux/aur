# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: tardo <tardo@nagi-fanboi.net>

# fuck this shit, git tags seem to be rocket science
_gitcommit=3eaec13cfc886a70ed5ff84c228d3f3bce442620
pkgname=mono-addins
pkgver=1.3.3
pkgrel=4
pkgdesc='Generic framework for creating extensible applications'
url='https://www.mono-project.com/Mono.Addins'
arch=('any')
license=('MIT')
depends=('gtk-sharp-2' 'mono')
source=(https://github.com/mono/mono-addins/archive/${pkgname}-${pkgver}.tar.gz
        https://github.com/Microsoft/msbuild/releases/download/mono-hosted-msbuild-v0.03/mono_msbuild_d25dd923839404bd64cc63f420e75acf96fc75c4.zip)
sha256sums=('254539d14e71789814a4fd37ed444dd33fc8ddb5fc082b1bf8e93f3d5d840b14'
            '9e992cb8e5526024eeae1cd9dea7f32c0158c2c8d94c9a7a310a146f14eef417')
sha512sums=('0574f177c7ef9029dc70e0bbece3edfb832ae0c3fde2987dc0199700618c145f68cfb263512b8c1f39ddb0f906acd7021ff03740495adf9c48f06eec83f85396'
            '4b7a2ede40d4659725c833fb987ec73358959668171f0e1255417e662de0d0efdc538560d84e96a23e8cf3417f5b198bc0947bbc2a6300f506f17d75000103e4')

build() {
  local msbuild="${srcdir}/msbuild/MSBuild.exe"

  cd ${pkgname}-${pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr --enable-gui
  make

  mono "${msbuild}" Mono.Addins/Mono.Addins.csproj /p:WarningLevel=0;Configuration=Release
  mono "${msbuild}" Mono.Addins.CecilReflector/Mono.Addins.CecilReflector.csproj /p:WarningLevel=0;Configuration=Release
  mono "${msbuild}" Mono.Addins.Gui/Mono.Addins.Gui.csproj /p:WarningLevel=0;Configuration=Release
  mono "${msbuild}" Mono.Addins.MSBuild/Mono.Addins.MSBuild.csproj /p:WarningLevel=0;Configuration=Release
  mono "${msbuild}" Mono.Addins.Setup/Mono.Addins.Setup.csproj /p:WarningLevel=0;Configuration=Release
}

package() {
  cd ${pkgname}-${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
