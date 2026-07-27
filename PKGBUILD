# Maintainer: duanluan <duanluan@outlook.com>

pkgname=wuyou-docs-bin
_pkgname=wuyou-docs
pkgver=0.7.0
pkgrel=1
pkgdesc='Local-first desktop document workspace (prebuilt binary)'
arch=('x86_64')
url='https://github.com/duanluan/wuyou-docs-releases'
license=('unknown')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('wuyou-docs')
conflicts=('wuyou-docs')
options=('!strip')
source=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/duanluan/wuyou-docs-releases/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('7372cb7ea56380dd96e3dacea12fa36fbd023756416997d913dd1fc3d548990a')

package() {
  local _app_dir _app_source _desktop_dir _desktop_file _desktop_source _extractdir
  _extractdir="$(mktemp -d)"
  trap 'rm -rf "${_extractdir}"' EXIT

  bsdtar -C "${_extractdir}" -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb"
  bsdtar -C "${pkgdir}" -xf "${_extractdir}/data.tar.gz"

  _app_dir="${pkgdir}/usr/lib/wuyou-docs"
  if [[ ! -d "${_app_dir}" ]]; then
    _app_source="$(find "${pkgdir}/usr/lib" -mindepth 1 -maxdepth 1 -type d -print -quit)"
    if [[ -z "${_app_source}" ]]; then
      printf 'wuyou-docs app directory not found\n' >&2
      return 1
    fi
    mv "${_app_source}" "${_app_dir}"
  fi

  _desktop_dir="${pkgdir}/usr/share/applications"
  _desktop_file="${_desktop_dir}/wuyou-docs.desktop"
  if [[ ! -f "${_desktop_file}" ]]; then
    _desktop_source="$(find "${_desktop_dir}" -maxdepth 1 -type f -name '*.desktop' -print -quit)"
    if [[ -z "${_desktop_source}" ]]; then
      printf 'wuyou-docs desktop entry not found\n' >&2
      return 1
    fi
    mv "${_desktop_source}" "${_desktop_file}"
  fi

  sed -i     -e 's/^Name=.*/Name=Wuyou Docs/'     -e '/^Name\[en\]=/d'     -e '/^Name\[en_US\]=/d'     -e '/^Name\[zh\]=/d'     -e '/^Name\[zh_CN\]=/d'     -e '/^Name\[zh_HK\]=/d'     -e '/^Name\[zh_MO\]=/d'     -e '/^Name\[zh_TW\]=/d'     -e 's/^Comment=.*/Comment=Local-first desktop document workspace/'     -e 's/^Categories=.*/Categories=Office;WordProcessor;/'     "${_desktop_file}"
  sed -i '/^Name=/a Name[en]=Wuyou Docs\nName[en_US]=Wuyou Docs\nName[zh]=无尤文档\nName[zh_CN]=无尤文档\nName[zh_HK]=無尤文檔\nName[zh_MO]=無尤文檔\nName[zh_TW]=無尤文檔' "${_desktop_file}"
}
