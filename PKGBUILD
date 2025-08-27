# Maintainer: Manuel Thalmann <m@nuth.ch>
_projname="Polyversal"
_pkgname="$(echo "$_projname" | tr "P" "p")-patcher"
pkgname="$_pkgname-bin"
pkgver=2.3.0
_pkgver="$(echo "$pkgver" | tr "." "_")"
_repo="CommitteeOfZero/polyversal-coz-linux-patcher"
_archive="$_projname-v$_pkgver"
pkgrel=1
_identifier="$_archive-$pkgrel"
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
  "Polyversal.desktop"
  "$_identifier.tar.gz::https://github.com/$_repo/releases/download/$pkgver/$_archive.tar.gz"
  "$_identifier.svg::https://raw.githubusercontent.com/$_repo/$pkgver/assets/logo-square.svg"
)
sha256sums=(
  "208ffdea36943ced42487427edf5c7fd638348b92e8b61bc0a7dc4bfc5eb3326"
  "7cf294d6c1f9d5ee9ce6f531e90e7a4879873d6cab7d6dba9dc4c80c9365ed1c"
  "62f3a79c1446932e1ce1d4a56991113739c7d7c6d8b4a8d9c994b62468229960"
)

pkgver() {
  curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
    jq -r .tag_name # Get tag name
}

package() {
  _binDir="$pkgdir/usr/bin";
  _docDir="$pkgdir/usr/share/doc/$_pkgname"
  _desktopDir="$pkgdir/usr/share/applications"
  _iconDir="$pkgdir/usr/share/icons/hicolor/scalable/apps"
  _binFile="$_archive/polyversal"

  sed -i \
    -e 's/\(DATADIR=\).*$/\1"$HOME\/.cache\/polyversal-patcher"/' \
    "$_binFile"

  install -dm755 "$_binDir" "$_desktopDir" "$_iconDir" "$_docDir"
  install -Dm755 "$_binFile" "$_binDir"
  install -Dm644 "$_identifier.svg" "$_iconDir/$_pkgname.svg"
  install -Dm644 "$srcdir/Polyversal.desktop" "$_desktopDir"
  install -Dm644 "$_archive"/{README.md,docs/*} "$_docDir"
  install -Dm644 "$_archive/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
