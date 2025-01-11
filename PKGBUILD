# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=stabilitymatrix-git
_pkgname=StabilityMatrix
pkgver=2.13.1+r5629+ga35338643
_pkgver=${pkgver%%+*}
_pkgver=${_pkgver/+/.} #reduce to 2.13.1.r5629
pkgrel=1
pkgdesc='Multi-Platform Package Manager for Stable Diffusion'
arch=('x86_64')
url='https://github.com/LykosAI/StabilityMatrix'
license=('AGPL-3.0-or-later')
depends=('dotnet-runtime-9.0' 'libxcrypt-compat')
makedepends=('dotnet-sdk-9.0' 'git')
provides=('stabilitymatrix')
conflicts=('stabilitymatrix')
source=(
  'git+https://github.com/LykosAI/StabilityMatrix.git'
  stabilitymatrix.tmpfiles
  zone.lykos.stabilitymatrix.desktop)
sha256sums=('SKIP'
            '79865c79c2e7cfaf7b11c17b1d5a95683f114cd8208b13d7ec62533e03586d63'
            '03c37b3ac476740cf2163849532996816a738b722e5d0a752f3364b9b790803a')

pkgver() {
  cd $_pkgname
  _version=$(git describe --tags --abbrev=0)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

prepare() {
  # excessive debugging toasts in the UI - see CHANGELOG.md in reference to Unobserved Exceptions
  sed -i '/Logger\.Error(ex, "Unobserved Task Exception");/s/^/\/\//g' "$_pkgname"/StabilityMatrix.Avalonia/Program.cs
  sed -i '/originException.Message");/s/^/\/\//g' "$_pkgname"/StabilityMatrix.Avalonia/App.axaml.cs
}

build() {
  dotnet publish "$_pkgname/StabilityMatrix.Avalonia/StabilityMatrix.Avalonia.csproj" --no-self-contained -p:DebugSymbols=true -o out -c Release -r linux-x64 -p:Version=${_pkgver}
}

package() {
  install -dm755 ${pkgdir}/opt
  cp -r out "${pkgdir}/opt/${_pkgname,,}"
  install -Dm644 stabilitymatrix.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/stabilitymatrix.conf"
  install -Dm644 "zone.lykos.stabilitymatrix.desktop" "${pkgdir}/usr/share/applications/zone.lykos.stabilitymatrix.desktop"
  install -Dm644 "${_pkgname}/"StabilityMatrix.Avalonia/Assets/Icon.512x512.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zone.lykos.stabilitymatrix.png"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/stabilitymatrix/StabilityMatrix.Avalonia "${pkgdir}/usr/bin/stabilitymatrix"
}
# vim:set ts=2 sw=2 et:
