# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Archeb <archebasic@hotmail.com>

pkgname=opentrace-bin
pkgver=1.5.1
pkgrel=5
pkgdesc="A cross-platform GUI wrapper for NextTrace. Bringing you the familiar traceroute experience."
arch=('x86_64' 'aarch64')
url="https://github.com/Archeb/opentrace"
license=('GPL-3.0-only')
options=('!debug')
depends=('nexttrace' 'webkit2gtk-4.1')

provides=('opentrace')
conflicts=('opentrace')
source=(
        "opentrace.desktop::https://raw.githubusercontent.com/Archeb/opentrace/master/opentrace.desktop"
        "logo.png::https://raw.githubusercontent.com/nxtrace/Ntrace-core/main/assets/logo.png"
)
sha256sums=('69f8c4799f6db03bf17cd78b1de7a18d939ec5e282190942172dbe13e39c2075'
            '93cf17802f2691d63e29a7020afb0c7c39782c85212ce4b795cc8486f36c758d')
sha256sums_x86_64=('acfc08a3285218444d1ed9d127de699b5666118a666059990bb131d6dfaa6104')
sha256sums_aarch64=('e7ed208467daedd2a365448e212b72337743b878bd3a3d3f0d329dd348ace70f')
source_x86_64=("$pkgname-$pkgver::https://github.com/Archeb/opentrace/releases/download/v$pkgver/linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver::https://github.com/Archeb/opentrace/releases/download/v$pkgver/linux-arm64.tar.gz")

latestver() {
  gh api --paginate repos/Archeb/opentrace/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "linux-x64.tar.gz") and any(.assets[]; .name == "linux-arm64.tar.gz")) | .tag_name' |
  head -1 | sed -E 's/^v//'
}

package() {
  # Create target directory
  install -dm755 "${pkgdir}/opt/${pkgname}"

  # Copy only the extracted app payload, not helper sources or downloaded archives.
  local _item
  for _item in "${srcdir}"/*; do
    case "${_item##*/}" in
      opentrace.desktop|logo.png|"${pkgname}-${pkgver}")
        continue
        ;;
    esac
    cp -r "${_item}" "${pkgdir}/opt/${pkgname}"
  done

  # Remove bundled NextTrace to use system dependency
  rm -f "${pkgdir}/opt/${pkgname}/nexttrace"

  # Launch from the install directory so .NET can resolve its bundled assemblies.
  install -dm755 "${pkgdir}/usr/bin"
  printf '%s\n' '#!/bin/sh' "cd /opt/${pkgname} || exit 1" 'exec ./OpenTrace "$@"' > "${pkgdir}/usr/bin/opentrace"
  chmod 755 "${pkgdir}/usr/bin/opentrace"
  
  # Install desktop file and icon
  install -Dm644 "opentrace.desktop" "${pkgdir}/usr/share/applications/opentrace.desktop"
  install -Dm644 "logo.png" "${pkgdir}/usr/share/pixmaps/opentrace.png"
}
