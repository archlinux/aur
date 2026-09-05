# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>

pkgname=open-design-desktop
pkgver=0.21.1
pkgrel=1
_tag="open-design-v${pkgver}"
pkgdesc='Local-first design product: native desktop app & canvas for coding agents (the open-source Claude Design alternative)'
arch=('x86_64')
url='https://github.com/nexu-io/open-design'
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
makedepends=(
  'git'
  'nodejs'
  'npm'
  'python'
  'make'
  'gcc'
)
provides=('open-design' 'open-design-desktop')
conflicts=('open-design' 'open-design-git')
options=('!strip' '!debug')

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz"
  "open-design-desktop.sh"
  "open-design-desktop.desktop"
)
sha256sums=(
  'f6cc90f03b3c135fb4e1c853de7f4630a338a7dbd9a53f9a58cb294aba21fca7'
  '5ae2dfc1943cd7ec376a5c42086cb76b618f14e10c7e92ecbf901f376b6eea6e'
  '7f86112fce365ab0bc6cc5f7cd415b4bace62c1c2d6252584100b7580290ddd6'
)

_sourcedir="open-design-${_tag}"

build() {
  cd "${srcdir}/${_sourcedir}"

  _pnpm() { npx --yes pnpm@10.33.2 "$@"; }

  _pnpm install --frozen-lockfile
  _pnpm tools-pack linux build --to appimage --namespace aur --portable --dir "${srcdir}/tools-pack"
}

package() {
  cd "${srcdir}/${_sourcedir}"

  local _appimage _extract_dir
  _appimage="$(find "${srcdir}/tools-pack/out/linux/namespaces/aur/builder" -maxdepth 1 -type f -name '*.AppImage' -print -quit)"
  if [[ -z "${_appimage}" ]]; then
    echo "Error: no AppImage found under ${srcdir}/tools-pack/out/linux/namespaces/aur/builder" >&2
    return 1
  fi

  _extract_dir="${srcdir}/open-design-appdir"
  rm -rf "${_extract_dir}"
  mkdir -p "${_extract_dir}"
  (cd "${_extract_dir}" && "${_appimage}" --appimage-extract > /dev/null)

  mkdir -p "${pkgdir}/opt/${pkgname}/appdir"
  cp -a "${_extract_dir}/squashfs-root/." "${pkgdir}/opt/${pkgname}/appdir/"
  chmod -R u+rwX,go+rX "${pkgdir}/opt/${pkgname}/appdir"

  # Binaries
  install -Dm755 "${srcdir}/open-design-desktop.sh" "${pkgdir}/usr/bin/open-design-desktop"
  ln -sf "open-design-desktop" "${pkgdir}/usr/bin/open-design"

  # Desktop entry & Icon
  install -Dm644 "${srcdir}/open-design-desktop.desktop" "${pkgdir}/usr/share/applications/open-design-desktop.desktop"
  install -Dm644 tools/pack/resources/linux/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/open-design.png"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
