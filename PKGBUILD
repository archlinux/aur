# Maintainer: robertfoster
pkgname=omniphony-studio-egui-bin
_pkgname="${pkgname%-bin}"
pkgver=0.6.0 # renovate: datasource=github-releases depName=mgth/Omniphony extractVersion=^v(?<version>\d.+)$
pkgrel=1
pkgdesc="Omniphony Studio native (egui) control and 3D visualization UI for the orender spatial audio engine (binary release)"
arch=('x86_64')
url="https://github.com/mgth/Omniphony"
license=('GPL-3.0-only')
# the release archive bundles its own orender (built from the same commit);
# it links libpipewire. wgpu/winit dlopen() the graphics stack: Vulkan (or EGL
# as fallback) for rendering, Wayland or X11 for the window system, and
# xkbcommon for keyboard handling
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'pipewire'
  'libglvnd' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxkbcommon'
  'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
optdepends=('harletty-bridge: decode compressed/object-audio formats via the orender bridge plugin'
  'noto-fonts-cjk: Japanese and Chinese labels'
  'vulkan-driver: GPU rendering through Vulkan (otherwise wgpu falls back to OpenGL/EGL)'
  'xdg-desktop-portal: native file dialogs (layout import and export)')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${CARCH}.tar.gz"
  "${_pkgname}-${pkgver}.png::https://raw.githubusercontent.com/mgth/Omniphony/v${pkgver}/omniphony-studio/src-tauri/icons/128x128.png"
  "${_pkgname}.desktop")

package() {
  cd "${_pkgname}-v${pkgver}-linux-${CARCH}"

  # Studio finds orender, layouts/ and assets/ next to its own executable
  # (core/src/host/bundle.rs, core/src/host/commands/orender.rs), via
  # current_exe(): /proc/self/exe resolves the /usr/bin symlink, so the whole
  # bundle lives under /opt and /usr/bin/orender stays free for other packages
  local _opt="${pkgdir}/opt/${_pkgname}"
  install -Dm755 -t "${_opt}" "${_pkgname}" orender
  install -Dm644 -t "${_opt}/assets" assets/*
  install -Dm644 -t "${_opt}/layouts" layouts/*.yaml
  install -Dm644 -t "${_opt}/layouts/legacy" layouts/legacy/*.yaml

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('bc668e4874da739bcbd0efd613f9205514a0d913514f76e932163e7ca6b6e803'
            'fceeadfb485429ccb5c2ec55b65c2106fe8f47d31c9af6f00f576ac6999a6aec'
            '5295612dab098d9d5b4749aaddd18adf2ec3a7f4bc31f0102b3b77db1e090e03')
