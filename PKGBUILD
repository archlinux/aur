# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
_pkgname=Libation
pkgver=10.3.3
pkgrel=1
pkgdesc="Audible Audiobook Manager: Liberate your Library"
arch=("any")
url="https://github.com/rmcrackan/Libation"
license=("GPL-3.0")
makedepends=("dotnet-sdk")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("11161f28ce04a5a5e66129ec69f367d73c6bee30481d8f05041ae1171b15457e")

build() {
  cd $_pkgname-$pkgver
  dotnet publish -c Release -o ./build ./Source/LibationCli/LibationCli.csproj -p:PublishProfile=./Source/LibationCli/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o ./build ./Source/LibationAvalonia/LibationAvalonia.csproj -p:PublishProfile=./Source/LibationAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
  dotnet publish -c Release -o ./build ./Source/HangoverAvalonia/HangoverAvalonia.csproj -p:PublishProfile=./Source/HangoverAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
}

package() {
  cd $_pkgname-$pkgver

  mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/bin"

  cp -v Images/libation_glass.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/libation.svg"
  cp -v Source/LoadByOS/LinuxConfigApp/Libation.desktop "$pkgdir/usr/share/applications/Libation.desktop"
  mv -v build "$pkgdir/usr/lib/libation"

  chmod +666 "$pkgdir/usr/share/icons/hicolor/scalable/apps/libation.svg"
  ln -s "/usr/lib/libation/Libation" "$pkgdir/usr/bin/Libation"
  ln -s "/usr/lib/libation/Libation" "$pkgdir/usr/bin/libation"
  ln -s "/usr/lib/libation/Hangover" "$pkgdir/usr/bin/Hangover"
  ln -s "/usr/lib/libation/LibationCli" "$pkgdir/usr/bin/LibationCli"
  ln -s "/usr/lib/libation/LibationCli" "$pkgdir/usr/bin/libationcli"

  # workaround until this file is moved to the user's home directory
  touch "$pkgdir/usr/lib/libation/appsettings.json"
  chmod 666 "$pkgdir/usr/lib/libation/appsettings.json"
}
