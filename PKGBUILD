# Maintainer: Enamul Hasan Abid <enamulhabid@gmail.com>

_pkgname=8188eu
pkgname="${_pkgname}-dkms-git"
_pkgver=5.2.2.4
pkgver=5.2.2.4.r838.f42fc9c
pkgrel=1
pkgdesc='Standalone driver for Realtek RTL8188EUS (RTL8188EUS, RTL8188ETV) WLAN'
arch=('any')
url="https://github.com/lwfinger/rtl8188eu"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${_pkgname}::git+${url}#branch=v${_pkgver}"
        blacklist-r8188eu.conf
        blacklist-rtl8xxxu.conf
        dkms.conf)
sha256sums=('SKIP'
            'edaeafe28410017fabb742d6ccdf060a945150fb56e41084adb7b9dd66739e2b'
            'dc6a9bfc6a796461da2219accc7a6ae755ea13253737630e1538f3d98aa7aff5'
            '70db4a4d738e77952dd063fc066f961932112786d796dcdb4508f4ec9c5ef844')
provides=('8188eu-dkms')
conflicts=('8188eu-dkms')

pkgver() {
  cd "${_pkgname}"

  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Blacklist r8188eu
  install -Dm644 blacklist-r8188eu.conf \
    "${pkgdir}/etc/modprobe.d/blacklist-r8188eu.conf"

  # Blacklist rtl8xxxu
  install -Dm644 blacklist-rtl8xxxu.conf \
    "${pkgdir}/etc/modprobe.d/blacklist-rtl8xxxu.conf"

  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  # Copy sources
  cd "${_pkgname}"

  for f in $(find . -type f); do
      install -Dm644 "$f" "${install_dir}/$f"
  done

  install -m644 "Makefile" "${install_dir}/Makefile"
}
