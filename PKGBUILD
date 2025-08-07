# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_electron=25
_Name="ZenVPN"
pkgname="${_Name,,}"
pkgver=1.2.26
pkgrel=1
pkgdesc="ZenVPN client"
arch=('x86_64')
url="https://zenvpn.net"
license=('custom:Proprietary')
depends=("electron${_electron}" 'glibc' 'iproute2' 'libpcap' 'sh')
makedepends=('dpkg')
source=("${pkgname}.sh")
source_x86_64=("${pkgname}-x86_64.deb::https://app.zenvpn.net/downloads/linux/amd64/latest/")
noextract=("${source_x86_64[@]%%::*}")
sha256sums=('f38be1d4f732d1dcf1b9705431de6f3eaae0e1616e81bc4f9cf7b566416545ca')
sha256sums_x86_64=('SKIP')

prepare() {
  cd "${srcdir}"
  sed -e "s/@electronversion@/${_electron}/g" \
      -e "s/@appname@/${pkgname}/g" \
      -e "s/@runname@/app.asar/g" \
      -e "s/@cfgdirname@/${_Name}/g" \
      -e "s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g" \
      -i "${pkgname}.sh"

  local _pkgver="$(dpkg-deb --show --showformat='${Version}' "${pkgname}-${CARCH}.deb" | tr - _)"
  dpkg-deb --extract "${pkgname}-${CARCH}.deb" "${pkgname}-${_pkgver}-${CARCH}"

  cd "${pkgname}-${_pkgver}-${CARCH}/usr/lib/${pkgname}"
  local target_electron="$(cat version)"
  if [[ "${target_electron%%.*}" != "${_electron}" ]]; then
    echo "  ==> ERROR: Electron version mismatch! Expected: '${_electron}', actual: '${target_electron%%.*}'" >&2
    exit 1
  fi

  patchelf --replace-needed 'libpcap.so.0.8' 'libpcap.so' "zenvpnd"
}

pkgver() {
  cd "${srcdir}"
  # shellcheck disable=SC2016
  dpkg-deb --show --showformat='${Version}' "${pkgname}-${CARCH}.deb" | tr - _
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}/usr/lib"
  find "systemd" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/lib/{}" \;

  cd "${pkgname}"
  find "resources/app.asar.unpacked/node_modules" -type d \( -name 'darwin-*' -o -name 'win32-*' \) -exec \
    rm -rf "{}" +
  find . -type f -name '*.bash' -delete

  install -vDm755 "zenvpnd" "${pkgdir}/usr/lib/${pkgname}/zenvpnd"
  cp -vrL "resources"/* "${pkgdir}/usr/lib/${pkgname}"

  # not used?
  # cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}/usr/local"
  # find "bin" -type f -exec \
  #   install -vDm755 "{}" "${pkgdir}/usr/{}" \;

  cd "${srcdir}/${pkgname}-${pkgver}-${CARCH}/usr/share"
  rm -rf "doc" "lintian"
  find . -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/{}" \;

  cd "${pkgdir}/usr/lib/${pkgname}/assets"
  ln -vsf "${_Name}.png" "${pkgname}.png"
}
