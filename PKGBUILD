# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
pkgver=11.4.0
pkgrel=1
pkgdesc="Audible audiobook manager: liberate your Library"
arch=('x86_64')
url="https://github.com/rmcrackan/Libation"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'lttng-ust2.12' 'zlib')
makedepends=('dotnet-sdk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('83e31e6dbe201d4ea47d02a9619dd8853f0bbb44e6e4ce842fabbfd5ea077f6d')

build() {
  cd "${pkgname^}-${pkgver}"
  dotnet publish -c Release -o build Source/LibationCli/LibationCli.csproj -p:PublishProfile=Source/LibationCli/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o build Source/LibationAvalonia/LibationAvalonia.csproj -p:PublishProfile=Source/LibationAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o build Source/HangoverAvalonia/HangoverAvalonia.csproj -p:PublishProfile=Source/HangoverAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o build Source/LoadByOS/LinuxConfigApp/LinuxConfigApp.csproj -p:PublishProfile=LoadByOS/Properties/LinuxConfigApp/PublishProfiles/LinuxProfile.pubxml
}

package() {
  cd "${pkgname^}-${pkgver}"
  install -Dm755 build/* -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 Source/LoadByOS/LinuxConfigApp/Libation.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 Images/libation_glass.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Libation" "${pkgdir}/usr/bin/libation"
  ln -s "/usr/lib/${pkgname}/Hangover" "${pkgdir}/usr/bin/hangover"
  ln -s "/usr/lib/${pkgname}/LibationCli" "${pkgdir}/usr/bin/libationcli"
}
