# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rekordfix-bin
_pkgname=Rekordfix
pkgver=0.16.0
_electronversion=36
pkgrel=1
pkgdesc="GUI tool for missing functionality to manage a Rekordbox collection.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/rzuppur/rekordfix"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
   "electron${_electronversion}"
)
source=(
   "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
   "LICENSE-${pkgver}::https://raw.githubusercontent.com/rzuppur/rekordfix/v${pkgver}/LICENSE"
   "${pkgname%-bin}.sh"
)
sha256sums=('80673c1053cadd22c69c16fef4a510fd0aad26bc4593727bd22d5856db01b39d'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_get_app_dir() {
   find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
   echo "Verifying Electron version..."
   local _app_dir=$(_get_app_dir)
   local _main_exe=""
   if [[ -n "${_app_dir}" ]]; then
      _main_exe=$(find "${_app_dir}" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
   fi
   if [[ -n "${_main_exe}" ]]; then
      local _elec_ver=$(strings "${_main_exe}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1 | head -n 1)
      if [[ -n "${_elec_ver}" ]]; then
         if [[ "${_elec_ver}" != "${_electronversion}" ]]; then
            echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m"
         else
            echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
         fi
      fi
      else
         echo -e "\033[1;33mNote: Could not find Electron binary for version verification.\033[0m"
   fi
}
prepare() {
   sed -i -e "
      s/@electronversion@/${_electronversion}/g
      s/@appname@/${pkgname%-bin}/g
      s/@runname@/app.asar/g
      s/@cfgdirname@/${pkgname%-bin}/g
   " "${srcdir}/${pkgname%-bin}.sh"
   bsdtar -xf "${srcdir}/data."*
   _check_electron_version
   sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
   find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
      _extension="${_i##*.}"
      _icon_path="${_i#*share/icons/}"
      _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
      install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
   done
   install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
