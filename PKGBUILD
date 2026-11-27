# Maintainer: duanluan <duanluan@outlook.com>

pkgname=so-novel-bin
_pkgname=so-novel
_appdir=sonovel
pkgver=1.12.1
pkgrel=1
pkgdesc='Universal web content extraction and ebook export tool (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/freeok/so-novel'
license=('AGPL-3.0-only')
depends=('glibc')
provides=('so-novel' 'sonovel')
conflicts=('so-novel' 'sonovel')
options=('!strip')
source_x86_64=("sonovel-linux_x64-${pkgver}.tar.gz::https://github.com/freeok/so-novel/releases/download/v${pkgver}/sonovel-linux_x64.tar.gz")
source_aarch64=("sonovel-linux_arm64-${pkgver}.tar.gz::https://github.com/freeok/so-novel/releases/download/v${pkgver}/sonovel-linux_arm64.tar.gz")
sha256sums_x86_64=('533ef9d892564b9a6470ab7bb624c668e3c76b3e008d4a56cc8244a5619f2a29')
sha256sums_aarch64=('50d8b2b001a65673513a53a2886941e04b9ecab8b02f3af47660f840bb835b5a')

package() {
  local bundle_dir

  case "${CARCH}" in
    x86_64)
      bundle_dir="${srcdir}/sonovel-linux_x64"
      ;;
    aarch64)
      bundle_dir="${srcdir}/sonovel-linux_arm64"
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  install -dm755 "${pkgdir}/opt/${_appdir}" "${pkgdir}/usr/bin"
  cp -a "${bundle_dir}/." "${pkgdir}/opt/${_appdir}/"

  find "${pkgdir}/opt/${_appdir}" -type d -exec chmod 755 '{}' +
  find "${pkgdir}/opt/${_appdir}" -type f -exec chmod 644 '{}' +
  chmod 755 "${pkgdir}/opt/${_appdir}/run-linux.sh"
  chmod 755 "${pkgdir}/opt/${_appdir}/runtime/bin/"*
  find "${pkgdir}/opt/${_appdir}/runtime/lib" -type f -name '*.so' -exec chmod 755 '{}' +

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'SCRIPT'
#!/bin/sh
set -eu

app_dir=/opt/sonovel
data_dir="${XDG_DATA_HOME:-${HOME}/.local/share}/sonovel"
config_file="${XDG_CONFIG_HOME:-${HOME}/.config}/sonovel/config.ini"
config_dir=$(dirname "${config_file}")

mkdir -p "${data_dir}" "${config_dir}"

if [ ! -f "${config_file}" ]; then
  cp "${app_dir}/config.ini" "${config_file}"
fi

if [ ! -d "${data_dir}/rules" ]; then
  cp -a "${app_dir}/rules" "${data_dir}/rules"
fi

cd "${data_dir}"
exec "${app_dir}/runtime/bin/java" \
  -XX:+UseZGC \
  -XX:+ZGenerational \
  -Dconfig.file="${config_file}" \
  -Dmode="${SONOVEL_MODE:-tui}" \
  -jar "${app_dir}/app.jar" "$@"
SCRIPT

  ln -s "${_pkgname}" "${pkgdir}/usr/bin/sonovel"
}
