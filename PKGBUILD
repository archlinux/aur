# Maintainer: Pink Pixel <admin@pinkpixel.dev>
pkgname=flikka
_npmname=@pinkpixel/flikka
pkgver=0.2.0
pkgrel=1
pkgdesc='Screen recorder and video editor for AI agents on Linux: record browsers, terminals and desktops, then edit, narrate and render from the CLI'
arch=('x86_64')
url='https://github.com/pinkpixel-dev/flikka'
license=('Apache-2.0')
depends=('nodejs' 'ffmpeg' 'gpu-screen-recorder' 'uv' 'python' 'zsh' 'curl' 'xdg-utils' 'glib2')
makedepends=('npm' 'jq')
optdepends=('chromium: browser recordings (Google Chrome, Brave, Edge or Vivaldi work too)'
            'slurp: drag out a region to record on Wayland'
            'wl-clipboard: copy finished videos to the clipboard on Wayland'
            'xclip: copy finished videos to the clipboard on X11')
source=("https://registry.npmjs.org/${_npmname}/-/${pkgname}-${pkgver}.tgz"
        'flikka.desktop'
        'flikka.png')
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('64e653223bd59e455fc8c92946057f90888fa960ea77df7a9493b16418bdb0a0'
            '3b37f8674b8ff59d756a557a90d119c0f9ff2b97a0d14e483c4bb917f3d34d82'
            'cccf5481d81f8ce7c58e4888518d6e063b68df349049046c6d71601c6d19d7f5')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm leaves build paths in package.json files; they aren't used (see the Arch Node.js package guidelines).
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local pkgjson="${pkgdir}/usr/lib/node_modules/${_npmname}/package.json"
  local tmppackage="$(mktemp)"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"

  # esbuild's install step hard-links its binary across folders; packages shouldn't, so make them plain copies.
  find "${pkgdir}" -type f -links +1 -print0 | while IFS= read -r -d '' file; do
    cp -p "${file}" "${file}.copy" && mv -f "${file}.copy" "${file}"
  done

  install -Dm644 "${srcdir}/flikka.desktop" "${pkgdir}/usr/share/applications/flikka.desktop"
  install -Dm644 "${srcdir}/flikka.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/flikka.png"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
