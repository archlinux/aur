# Maintainer: Lck0427 <lck0427 at hotmail dot com>
# Contributor: Lck0427 <lck0427 at hotmail dot com>
pkgname=comfyui-desktop-2-beta
pkgver=0.6.2
pkgrel=1
pkgdesc="ComfyUI Desktop 2.0 – Electron desktop app for ComfyUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/ComfyUI-Desktop-2.0-Beta"
license=('MIT')
options=('!strip' '!debug')
depends=(
  'glibc'
  'libstdc++'
  'libgcc'
  'gtk3'
  'glib2'
  'libx11'
  'libxext'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxrandr'
  'libxkbcommon'
  'systemd-libs'
  'python'
  'libxtst'
  'libxss'
  'nss'
  'alsa-lib'
  'libdrm'
  'mesa'
  'cairo'
  'dbus'
  'expat'
  'pango'
  'hicolor-icon-theme'
  'nspr'
  'bash'
  'python-pygit2'
)
optdepends=(
  'libcups: printing support'
  'at-spi2-core: accessibility support'
)
makedepends=(
  'nodejs>=22'
  'pnpm>=10'
  'git'
  'python'
  'gcc'
)
source=(
  "${pkgname}::git+https://github.com/Comfy-Org/ComfyUI-Desktop-2.0-Beta#tag=v${pkgver}"
  "comfyui-desktop-2.desktop"
)
sha256sums=('6c39d3b4a4e4481488d834450f8f71431bb608eac5d8f515f2cb544819607ab0'
            'b818d04a3e4943d5f74fc12d14cf8b9d7a1496ccf6aa3268af23bfa88e7e34e6')
build() {
  cd "${srcdir}/${pkgname}"
  # Install dependencies
  pnpm install --frozen-lockfile
  # Build the app for Linux
  pnpm run build:linux
}
package() {
  cd "${srcdir}/${pkgname}"
  local _builddir="dist/linux-unpacked"
  if [[ ! -d "$_builddir" ]]; then
    echo "Error: Could not find expected build output directory: ${_builddir}" >&2
    return 1
  fi
  #Install built binaries
  install -d "${pkgdir}/opt"
  cp -a "${_builddir}" "${pkgdir}/opt/comfyui-desktop-2"
  # Cleanup unused 7zip binaries
  local _7zip_dir="${pkgdir}/opt/comfyui-desktop-2/resources/app.asar.unpacked/node_modules/7zip-bin"
  rm -rf ${_7zip_dir}/mac
  local _keep_folder=""
  case "$CARCH" in
    x86_64)  _keep_folder="x64" ;;
    aarch64) _keep_folder="arm64" ;;
    *)
      echo "Warning: Unsupported architecture '$CARCH'. You may need to handle 7zip modules yourself."
      return 1
      ;;
  esac
  if [[ -d "${_7zip_dir}/linux" ]]; then
    plain "Cleaning up 7zip binaries for $CARCH (keeping ${_keep_folder})..."
    find "${_7zip_dir}/linux" -mindepth 1 -maxdepth 1 -type d ! -name "$_keep_folder" -exec rm -rf {} +
  fi
  # Make binary link
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/comfyui-desktop-2/comfyui-desktop-2" "${pkgdir}/usr/bin/comfyui-desktop-2"
  # Install icons
  local _icon
  for _icon in "${srcdir}/${pkgname}/assets"/Comfy_Logo_x*.png; do
    local _size
    _size=$(basename "${_icon}" .png)
    _size="${_size#Comfy_Logo_x}"
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/comfyui-desktop-2.png"
  done
  # Install .desktop file
  install -Dm644 "${srcdir}/comfyui-desktop-2.desktop" "${pkgdir}/usr/share/applications/comfyui-desktop-2.desktop"
  # Install LICENSE file
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
