# Maintainer: Magus <packaging@example.com>
pkgname=magelab-bin
pkgver=0.11.6
pkgrel=1
pkgdesc="Mage Lab is a user-centric AI interface with local reasoning and tools"
arch=('x86_64')
url="https://github.com/majesticio/magelab"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'libayatana-appindicator-glib')
provides=('magelab')
conflicts=('magelab')
options=('!strip' '!emptydirs')
source=("LICENSE::https://raw.githubusercontent.com/majesticio/magelab/refs/heads/main/LICENSE")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

_magelab_zst_asset="magelab-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
_magelab_zst_url="https://cdn.crabnebula.app/asset/01KVF988124203AGWJS5FYW68N"
_magelab_zst_sha256='90de083ebc38b5d04fbc3b1f7043997a54557f9e46747f3e0a6fef250a8e1376'
_magelab_deb_asset="magelab_${pkgver}_amd64.deb"
_magelab_deb_url="https://cdn.crabnebula.app/asset/01KVF8KMHKDZNWQTESFZHC6VM1"
_magelab_deb_sha256='429587834847a0d87b9d88c70428492b9ae160144d304a62b751909ea457d0ff'

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
