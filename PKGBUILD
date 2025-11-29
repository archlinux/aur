# Maintainer: Magus <packaging@example.com>
pkgname=magelab-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="Mage Lab is a user-centric AI interface with local reasoning and tools"
arch=('x86_64')
url="https://github.com/majesticio/magelab"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('magelab')
conflicts=('magelab')
options=('!strip' '!emptydirs')
source=("LICENSE::https://raw.githubusercontent.com/majesticio/magelab/refs/heads/main/LICENSE")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

_magelab_zst_asset="magelab-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
_magelab_zst_url="https://cdn.crabnebula.app/asset/01KB78VGBKG7ZDM6MMV15V7C5R"
_magelab_zst_sha256='f7ff92a2c8a36f062e83ed7b846e1d7a7dd028cc5d2e8326152de688bf73f985'
_magelab_deb_asset="magelab_${pkgver}_amd64.deb"
_magelab_deb_url="https://cdn.crabnebula.app/asset/01KA7YQAT9XXAF9JK9FVTWRA1K"
_magelab_deb_sha256='dee860dbc948b85f5c136f0cf3073e55fbbad81a550278a51655e8860aef9b16'

if [[ ${MAGELAB_BUILD_FROM_DEB:-0} != 0 ]]; then
  _magelab_source_type='deb'
  source_x86_64=("${_magelab_deb_asset}::${MAGELAB_DEB_URL:-${_magelab_deb_url}}")
  sha256sums_x86_64=("${MAGELAB_DEB_SHA256:-${_magelab_deb_sha256}}")
else
  _magelab_source_type='pkg'
  source_x86_64=("${_magelab_zst_asset}::${MAGELAB_ZST_URL:-${_magelab_zst_url}}")
  sha256sums_x86_64=("${MAGELAB_ZST_SHA256:-${_magelab_zst_sha256}}")
  noextract=("${_magelab_zst_asset}")
fi

prepare() {
  cd "${srcdir}"
  if [[ "${_magelab_source_type}" == 'deb' ]]; then
    bsdtar -xf "${_magelab_deb_asset}"
  fi
}

package() {
  cd "${srcdir}"

  if [[ "${_magelab_source_type}" == 'pkg' ]]; then
    local pkgroot="${srcdir}/pkgroot"
    rm -rf "${pkgroot}"
    mkdir -p "${pkgroot}"
    bsdtar -xf "${_magelab_zst_asset}" -C "${pkgroot}" \
      --exclude='.PKGINFO' \
      --exclude='.BUILDINFO' \
      --exclude='.MTREE' \
      --exclude='.INSTALL' \
      --exclude='.CHANGELOG'
    cp -a "${pkgroot}/." "${pkgdir}/"
  else
    local data_tar
    data_tar=$(find "${PWD}" -maxdepth 1 -name 'data.tar.*' -print -quit)
    bsdtar -xf "${data_tar}" -C "${pkgdir}"

    install -d "${pkgdir}/usr/lib/${pkgname}"
    mv "${pkgdir}/usr/bin/magelab" "${pkgdir}/usr/lib/${pkgname}/magelab.real"
    ln -s ../magelab/bin "${pkgdir}/usr/lib/${pkgname}/bin"
    install -Dm755 "${pkgdir}/usr/bin/run" "${pkgdir}/usr/lib/${pkgname}/run"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/magelab" <<'WRAPPER'
#!/bin/bash
set -uo pipefail
REAL_BIN="/usr/lib/magelab-bin/magelab.real"
APP_BIN_DIR="/usr/lib/magelab-bin"
APP_RES_DIR="/usr/lib/magelab"

export PATH="${APP_BIN_DIR}:${PATH}"
export APPDIR="${APP_RES_DIR}"

if [[ -z "${MAGELAB_ENABLE_DMABUF:-}" ]]; then
  if [[ -n "${WAYLAND_DISPLAY:-}" || "${XDG_SESSION_TYPE:-}" == "wayland" ]]; then
    if [[ -z "${WEBKIT_DISABLE_DMABUF_RENDERER:-}" ]]; then
      export WEBKIT_DISABLE_DMABUF_RENDERER=1
    fi
  fi
fi

if [[ -n "${MAGELAB_SKIP_DMABUF_FALLBACK:-}" || -n "${WEBKIT_DISABLE_DMABUF_RENDERER:-}" ]]; then
  exec -a magelab "${REAL_BIN}" "$@"
fi

if ( exec -a magelab "${REAL_BIN}" "$@" ); then
  exit 0
fi
status=$?

if [[ ${status} -eq 139 && -z "${MAGELAB_DMABUF_RETRY:-}" ]]; then
  export MAGELAB_DMABUF_RETRY=1
  export WEBKIT_DISABLE_DMABUF_RENDERER=1
  exec -a magelab "${REAL_BIN}" "$@"
fi

exit ${status}
WRAPPER
  fi

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
