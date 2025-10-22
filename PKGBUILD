# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: arraen
# Contributor: thadah

_electron=38
_Name="Synergy"
pkgname="${_Name,,}"
pkgver=3.4.0
pkgrel=2
pkgdesc="Share one mouse and keyboard between multiple computers"
arch=(
  'aarch64'
  'x86_64'
)
url="https://symless.com/synergy"
license=('custom:Proprietary')
depends=(
  'bash'
  "electron${_electron}"
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libappindicator-gtk3'
  'libayatana-appindicator'
  'libei'
  'libnotify'
  'libxkbfile'
  'openssl'
  'qt6-base'
)
makedepends=(
  'curl'
  'ostree'
  'patchelf'
)
optdepends=(
  'gdm: login service'
  'pugixml'
)
backup=(
  "etc/${pkgname}.conf"
  "etc/${_Name}/loginInfo"
)
install="${pkgname}.install"
_pkgsrc="${pkgname}-${pkgver}"
_landing_html="$(curl -s "${url}/download/package/synergy-personal-v3/flatpak/${_pkgsrc}-linux-noble-${CARCH}.flatpak")"
_token="$(grep -oP '(?<=\\"token\\":\\")[^\\"]+' <<< "${_landing_html}" | head -n1)"
source=("electron-common.sh")
source_aarch64=("${_pkgsrc}-aarch64.flatpak::${url}/api/download/${_pkgsrc}-linux-noble-aarch64.flatpak?token=${_token}")
source_x86_64=("${_pkgsrc}-x86_64.flatpak::${url}/api/download/${_pkgsrc}-linux-noble-x86_64.flatpak?token=${_token}")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('fdfcc99b9a24833ce9a7323786cb34c6bb1cfb039e1bd47e1306378c54199138')
sha256sums_x86_64=('91f683385aa12e4da6f16bb0bb6d2df5a9b0865c981dce7df5001ddf951c0b7f')

prepare() {
  cd "${srcdir}"
  sed -e "s/@electronversion@/${_electron}/g" \
      -e "s/@appname@/${pkgname}/g" \
      -e "s/@runname@/app.asar/g" \
      -e "s/@cfgdirname@/${pkgname}/g" \
      -e "s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g" \
      -i "electron-common.sh"

  rm -rf "${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.ostree"
  ostree init --repo="${_pkgsrc}-${CARCH}.ostree" --mode=bare-user
  ostree static-delta apply-offline --repo="${_pkgsrc}-${CARCH}.ostree" "${_pkgsrc}-${CARCH}.flatpak"
  ostree checkout --repo="${_pkgsrc}-${CARCH}.ostree" -U \
    $(basename $(echo "${_pkgsrc}-${CARCH}.ostree"/objects/*/*.commit | cut -d/ -f3- --output-delimiter='' | tr -d '\0') .commit) "${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}"
  find . -type f -exec \
    sed -i "s|/opt/${_Name}|/usr/lib/${pkgname}|g" "{}" +

  sed -i "s/^Exec=.*/Exec=${pkgname}/g" 'export/share/applications/com.symless.synergy.desktop'

  cd "files/lib/com.symless.synergy"
  find . -maxdepth 1 -type f -executable -exec \
    patchelf --remove-rpath "{}" \;
}

package() {
  cd "${srcdir}"
  install -vDm755 "electron-common.sh" "${pkgdir}/usr/bin/${pkgname}"
  
  cd "${_pkgsrc}-${CARCH}"
  install -vd "${pkgdir}/usr"
  cp -vaT --no-preserve=ownership "export" "${pkgdir}/usr"

  cd "files/lib/com.symless.synergy"
  install -vDm644 "resources/services/global/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
  install -vDm644 "resources/services/system/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}-login.service"
  find . -type f -name '*.service' -delete

  install -vd "${pkgdir}/usr/lib/${pkgname}"
  cp -vaT --no-preserve=ownership "resources" "${pkgdir}/usr/lib/${pkgname}"
  find . -maxdepth 1 -type f -executable -name "${pkgname}-*" -exec \
    cp -va --no-preserve=ownership "{}" -t "${pkgdir}/usr/lib/${pkgname}" \;

  cd "${pkgdir}"
  install -vd "etc/${_Name}"
  : > "etc/${pkgname}.conf"
  : > "etc/${_Name}/loginInfo"

  cd "usr"
  install -vd "bin"
  find "lib/${pkgname}" -maxdepth 1 -type f -executable -exec \
    ln -vsf "/usr/{}" "bin/" \;
}
