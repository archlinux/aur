# Maintainer: Manuel Thalmann <m@nuth.ch>
_projname="Polyversal"
_pkgname="$(echo "$_projname" | tr "P" "p")-patcher"
pkgname="$_pkgname-bin"
pkgver=2.1.3
_pkgver="$(echo "$pkgver" | tr "." "_")"
_repo="CommitteeOfZero/polyversal-coz-linux-patcher"
_archive="$_projname-v$_pkgver"
pkgrel=1
pkgdesc="The Polyversal Linux Steam Patcher for the Committee of Zero's Science Adventure Steam Patches on Linux"
arch=("any")
url="https://github.com/$_repo"
license=("MIT")
groups=()
depends=()
makedepends=("curl" "jq" "sed")
optdepends=(
  "protontricks: Tool required for running the patcher"
  "flatpak: Allows automatic installation of \`protontricks\` from Flathub"
  "zenity: Required for using Polyversal Patcher as a GUI"
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"

source=(
  "$_pkgname.tar.gz::https://github.com/$_repo/releases/download/$pkgver/$_archive.tar.gz"
  "$_pkgname.svg::https://raw.githubusercontent.com/$_repo/$pkgver/assets/logo-square.svg"
)
sha256sums=(
  "0577797679182b4b3a8f0e9632517723717d68c249458b0961f18be1d91c96de"
  "62f3a79c1446932e1ce1d4a56991113739c7d7c6d8b4a8d9c994b62468229960"
)

pkgver() {
  curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
    jq -r .tag_name # Get tag name
}

package() {
  _binDir="$pkgdir/usr/bin";
  _desktopDir="$pkgdir/usr/share/applications"
  _iconDir="$pkgdir/usr/share/icons/hicolor/scalable/apps"
  _binFile="$_archive/polyversal"
  _desktopFile="$_archive/Polyversal.desktop"

  sed -i \
    -e 's/\(DATADIR=\).*$/\1"$HOME\/.cache\/polyversal-patcher"/' \
    "$_binFile"

  sed -i \
    -e "s/\(Exec=\).*\/\(polyversal\( .*\)\?\)\$/\1\2/" \
    -e "\$a Icon=$_pkgname" \
    "$_desktopFile"

  install -dm755 "$_binDir" "$_desktopDir" "$_iconDir"
  install -Dm755 "$_binFile" "$_binDir"
  install -Dm644 "$_pkgname.svg" "$_iconDir"
  install -Dm644 "$_desktopFile" "$_desktopDir"
  install -Dm644 "$_archive/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
