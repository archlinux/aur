# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-bin
_pkgname=rebased
pkgver=1.1.8
pkgrel=2
pkgdesc='Standalone JetBrains-based Git client (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('fontconfig' 'giflib' 'hicolor-icon-theme' 'libdbusmenu-glib' 'ttf-font')
optdepends=('xdg-utils: open URLs from IDE')
provides=('rebased')
conflicts=('rebased')
options=('!strip')
source=("${_pkgname}.sh" "${_pkgname}.desktop")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/DetachHead/rebased/releases/download/${pkgver}/rebased.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/DetachHead/rebased/releases/download/${pkgver}/rebased-aarch64.tar.gz")
sha256sums=('e152fc59d093764f826b990c04a64db48d43f1ee8708b265155c16888a9e54bf'
            'c9ca95ac0578c7ad1db358afce473475d9d82010676018e157bbdfaaeb256cae')
sha256sums_x86_64=('75d8faaf77f62d1d723675cb517d425a46566f818f1c5f1b311e5b60988ab803')
sha256sums_aarch64=('6f6914fcbd8ece8524dc2ffb34f7d2b9951b9d2018ccfb2b8f6f40f310ccee5f')

package() {
  local app_dir
  local icon_png
  local icon_svg
  local install_root="${pkgdir}/opt/${_pkgname}"

  app_dir="$(find "${srcdir}" -mindepth 1 -maxdepth 1 -type d -name 'Rebased*' | sort | head -n1)"
  [[ -n "${app_dir}" ]] || app_dir="$(find "${srcdir}" -mindepth 1 -maxdepth 1 -type d -name 'idea-IC-*' | sort | head -n1)"
  [[ -n "${app_dir}" ]] || app_dir="$(find "${srcdir}" -mindepth 1 -maxdepth 2 -type f -name product-info.json -printf '%h\n' | sort | head -n1)"
  if [[ -z "${app_dir}" ]]; then
    printf 'failed to find extracted Rebased application directory\n' >&2
    return 1
  fi

  install -dm755 "${install_root}"
  cp -a "${app_dir}/." "${install_root}/"

  if [[ ! -e "${install_root}/bin/rebased" ]]; then
    if [[ -x "${install_root}/bin/idea" ]]; then
      ln -s idea "${install_root}/bin/rebased"
    elif [[ -x "${install_root}/bin/idea.sh" ]]; then
      ln -s idea.sh "${install_root}/bin/rebased"
    else
      printf 'failed to find Rebased launcher in %s/bin\n' "${app_dir}" >&2
      return 1
    fi
  fi

  icon_svg="${app_dir}/bin/rebased.svg"
  [[ -f "${icon_svg}" ]] || icon_svg="${app_dir}/bin/idea.svg"
  if [[ -f "${icon_svg}" ]]; then
    install -Dm644 "${icon_svg}" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rebased.svg"
  else
    printf 'failed to find Rebased SVG icon in %s/bin\n' "${app_dir}" >&2
    return 1
  fi

  icon_png="${app_dir}/bin/rebased.png"
  [[ -f "${icon_png}" ]] || icon_png="${app_dir}/bin/idea.png"
  if [[ -f "${icon_png}" ]]; then
    install -Dm644 "${icon_png}" "${pkgdir}/usr/share/pixmaps/rebased.png"
  fi

  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${app_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
