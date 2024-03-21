# Maintainer:
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
pkgver=11.3.6
pkgrel=1
pkgdesc="Audible audiobook manager: liberate your Library"
arch=('x86_64')
url="https://github.com/rmcrackan/Libation"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'lttng-ust2.12' 'zlib')
makedepends=('dotnet-sdk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc8d83d15c8d4402b85d2af00adab19b44f4988d026b5236cd11e2fafc9ccecb')

build() {
  cd "${pkgname^}-${pkgver}"
  dotnet publish -c Release -o build Source/LibationCli/LibationCli.csproj -p:PublishProfile=Source/LibationCli/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o build Source/LibationAvalonia/LibationAvalonia.csproj -p:PublishProfile=Source/LibationAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o build Source/HangoverAvalonia/HangoverAvalonia.csproj -p:PublishProfile=Source/HangoverAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o build Source/LoadByOS/LinuxConfigApp/LinuxConfigApp.csproj -p:PublishProfile=LoadByOS/Properties/LinuxConfigApp/PublishProfiles/LinuxProfile.pubxml
}

package() {
  cd "${pkgname^}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" build/*
  install -Dm644 -t "${pkgdir}/usr/share/applications" Source/LoadByOS/LinuxConfigApp/Libation.desktop
  install -Dm644 Images/libation_glass.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/libation.svg"

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Libation" "${pkgdir}/usr/bin/libation"
  ln -s "/usr/lib/${pkgname}/Hangover" "${pkgdir}/usr/bin/hangover"
  ln -s "/usr/lib/${pkgname}/LibationCli" "${pkgdir}/usr/bin/libationcli"
}
