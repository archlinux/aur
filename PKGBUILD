# Maintainer: Lck0427 <lck0427 at hotmail dot com>
# Contributor: Lck0427 <lck0427 at hotmail dot com>
pkgname=comfy-desktop
pkgver=1.0.20
pkgrel=1
pkgdesc="Comfy Desktop is the official desktop application for ComfyUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Comfy-Org/Comfy-Desktop"
license=('MIT')
options=('!strip')
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
  'nss'
  'alsa-lib'
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
makedepends=(
  'nodejs>=22'
  'pnpm>=10'
  'git'
  'python'
  'gcc'
)
conflicts=('comfyui-desktop-2-beta')
replaces=('comfyui-desktop-2-beta')
source=(
  "${pkgname}::git+${url}#tag=v${pkgver}"
  "comfy-desktop.desktop"
)
sha256sums=('5535ba4a2acc822204795c7a98c62ae88eb715f8879030a0a3b430b8daefc939'
            '6b7dcfbe0897075d288e844e01f42039158806c50c6ba9f7bf87f315d7cc9c4b')
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
  cp -a "${_builddir}" "${pkgdir}/opt/${pkgname}"
  # Cleanup unused 7zip binaries
  local _7zip_dir="${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/node_modules/7zip-bin"
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
  ln -s "/opt/${pkgname}/comfyui-desktop-2" "${pkgdir}/usr/bin/${pkgname}"
  # Install icons
  local _icon
  for _icon in "${srcdir}/${pkgname}/assets"/Comfy_Logo_x*.png; do
    local _size
    _size=$(basename "${_icon}" .png)
    _size="${_size#Comfy_Logo_x}"
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/comfyui-desktop-2.png"
  done
  # Install .desktop file
  install -Dm644 "${srcdir}/comfy-desktop.desktop" "${pkgdir}/usr/share/applications/comfy-desktop.desktop"
  # Install LICENSE file
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
