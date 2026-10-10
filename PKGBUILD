# Maintainer: doudou <951028382@qq.com>

pkgname=easycliproxyapi-bin
pkgver=0.3.31
pkgrel=1
pkgdesc='Cross-platform GUI desktop management client for CLIProxyAPI (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/router-for-me/EasyCLIProxyAPI'
license=('MIT')
depends=(
  'bash'
  'cairo'
  'coreutils'
  'dbus'
  'diffutils'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libsoup3'
  'util-linux'
  'webkit2gtk-4.1'
)
provides=('easycliproxyapi')
conflicts=('easycliproxyapi' 'easycliproxyapi-git')

_gh='https://github.com/router-for-me/EasyCLIProxyAPI'

source=(
  'easycliproxyapi.sh'
  'easycliproxyapi.desktop'
  "${_gh}/raw/v${pkgver}/src-tauri/icons/icon.png"
  "${_gh}/raw/v${pkgver}/LICENSE"
)
source_x86_64=(
  "${_gh}/releases/download/v${pkgver}/EasyCLIProxyAPI-v${pkgver}-Linux-amd64.tar.gz"
)
source_aarch64=(
  "${_gh}/releases/download/v${pkgver}/EasyCLIProxyAPI-v${pkgver}-Linux-aarch64.tar.gz"
)
sha256sums=('609a5432ce3ded66168c2017b3ece1442215de5925d9c3eea33940915d448cfe'
            '6b46832343f2db8f6c1513fead0ff47a7a3ec539efcecdbc478cdd218be1222e'
            '93ef8519c69bb9d8a9ddab07156a832a11fefd89680cc5db638cd34adce44c9d'
            '6bd5d3c4fb6a34c0b83e91acd53a52fb8fd1ae9e19ba55b23788ec1dc52dbac7')
sha256sums_x86_64=('d379c88c927937eb8dc4fc0718be5f5ff183c14a925255919f4ff2fa9f363446')
sha256sums_aarch64=('6efc5bf9ba0e1d9291d39352b5133c9a91556a4147e7959cf3d10c983e131639')

_release_arch() {
  case "$CARCH" in
    x86_64) printf '%s\n' amd64 ;;
    aarch64) printf '%s\n' aarch64 ;;
    *) printf 'Unsupported architecture: %s\n' "$CARCH" >&2; return 1 ;;
  esac
}

package() {
  local _arch _release_dir
  _arch=$(_release_arch)
  _release_dir="EasyCLIProxyAPI-v${pkgver}-Linux-${_arch}"

  # Install main binary and data files
  install -dm755 "${pkgdir}/usr/lib/easycliproxyapi"
  install -Dm755 "${_release_dir}/EasyCLIProxyAPI" "${pkgdir}/usr/lib/easycliproxyapi/EasyCLIProxyAPI"
  install -Dm644 "${_release_dir}/core-version.txt" "${pkgdir}/usr/lib/easycliproxyapi/core-version.txt"
  install -Dm644 "${_release_dir}/portable-app.json" "${pkgdir}/usr/lib/easycliproxyapi/portable-app.json"

  # Install bundled cpa-core
  install -dm755 "${pkgdir}/usr/lib/easycliproxyapi/cpa-core"
  for f in "${_release_dir}"/cpa-core/*; do
    [[ -f "$f" ]] || continue
    install -Dm644 "$f" "${pkgdir}/usr/lib/easycliproxyapi/cpa-core/${f##*/}"
  done

  # Install launcher script and symlinks
  install -Dm755 "${srcdir}/easycliproxyapi.sh" "${pkgdir}/usr/bin/easycliproxyapi"
  ln -sf easycliproxyapi "${pkgdir}/usr/bin/EasyCLIProxyAPI"

  # Install desktop entry
  install -Dm644 "${srcdir}/easycliproxyapi.desktop" "${pkgdir}/usr/share/applications/easycliproxyapi.desktop"

  # Install icon
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/easycliproxyapi.png"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/easycliproxyapi.png"

  # Install license
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
