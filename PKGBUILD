# Maintainer: Magus <packaging@example.com>
pkgname=magelab-bin
pkgver=0.7.5
pkgrel=1
pkgdesc="Mage Lab is a user-centric AI interface with local reasoning and tools"
arch=('x86_64')
url="https://github.com/majesticio/magelab"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('magelab')
conflicts=('magelab')
options=('!strip' '!emptydirs')
source=("LICENSE::https://raw.githubusercontent.com/majesticio/magelab/refs/heads/main/LICENSE")
source_x86_64=("magelab_${pkgver}_amd64.deb::https://cdn.crabnebula.app/asset/01K7618MCV5R1H3GEJTRRQ6GWM")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('276754480a1b103c5f764f05652fda8368ad545348f5ecfa7a8241cee8f7c47e')

prepare() {
  cd "${srcdir}"
  bsdtar -xf "magelab_${pkgver}_amd64.deb"
}

package() {
  cd "${srcdir}"
  local data_tar
  data_tar=$(find "${PWD}" -maxdepth 1 -name 'data.tar.*' -print -quit)
  bsdtar -xf "${data_tar}" -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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
}
