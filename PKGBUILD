# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codeg-bin
_pkgname=codeg
pkgver=0.29.0
pkgrel=1
pkgdesc='Collaborative multi-agent AI coding workspace (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/xintaofei/codeg'
license=('Apache-2.0')
depends=(
  'dbus'
  'gcc-libs'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'openssl'
  'webkit2gtk-4.1'
  'xz'
)
provides=('codeg')
conflicts=('codeg')
options=('!strip')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/xintaofei/codeg/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::https://github.com/xintaofei/codeg/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::https://github.com/xintaofei/codeg/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb" "${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('b84ded6d97885814c69b93bf8a29768ffcbf9aa46da0816baf9b8618ad76e7a3')
sha256sums_aarch64=('65fb3ffc750d0a7c44f8ce129384638635b7a299f94793bb1563968e46678b73')

package() {
  local deb_arch
  local extract_dir="${srcdir}/deb-extract-${CARCH}"

  case "${CARCH}" in
    x86_64) deb_arch='amd64' ;;
    aarch64) deb_arch='arm64' ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"
  bsdtar -C "${extract_dir}" -xf "${srcdir}/${_pkgname}_${pkgver}_${deb_arch}.deb"
  bsdtar -C "${pkgdir}" -xf "${extract_dir}/data.tar.gz"

  mv "${pkgdir}/usr/bin/${_pkgname}" \
    "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  mv "${pkgdir}/usr/bin/${_pkgname}-server" \
    "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}-server"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'SCRIPT'
#!/bin/sh
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
exec /usr/lib/codeg/codeg "$@"
SCRIPT
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}-server" <<'SCRIPT'
#!/bin/sh
export CODEG_STATIC_DIR="${CODEG_STATIC_DIR:-/usr/lib/codeg/web}"
exec /usr/lib/codeg/codeg-server "$@"
SCRIPT

  sed -i \
    -e 's/^Categories=.*/Categories=Development;IDE;/' \
    -e 's/^Comment=.*/Comment=Collaborative multi-agent AI coding workspace/' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
