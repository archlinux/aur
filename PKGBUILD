# Maintainer: duanluan <duanluan@outlook.com>

pkgname=codeg-bin
_pkgname=codeg
pkgver=0.26.1
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
sha256sums_x86_64=('904cbaad258c4be3a4a6e7b620880f88350d2ed433da8683e785d2a8059e0307')
sha256sums_aarch64=('d7c09ff27433a5ef7b56df2c7e4f92e238f0a45dfa596207d7d6a30450b26ca6')

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
