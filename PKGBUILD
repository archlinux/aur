# Maintainer: NickeyGod <niklass.schaeffer@gmail.com>

pkgname=open-design-desktop
pkgver=0.24.1
pkgrel=2
_tag="open-design-v${pkgver}"
# Upstream's pack step copies the node binary that runs the build into the
# package. Arch's node links against system libraries (libsimdjson etc.), so
# that copy breaks on their next soname bump. The official build is
# self-contained, and upstream requires Node 24 anyway.
_nodever=24.21.0
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
  "https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.xz"
)
sha256sums=('7b9491a9b4e291209853c90a1224d02ea0d13802d208d40bd1f70f3b8d939fae'
            '5ae2dfc1943cd7ec376a5c42086cb76b618f14e10c7e92ecbf901f376b6eea6e'
            '7f86112fce365ab0bc6cc5f7cd415b4bace62c1c2d6252584100b7580290ddd6'
            'fd8e59d5a511510f6a298afb548f18c7d2b1be404d8b4a27d94fbe49f56cb2d6')

_sourcedir="open-design-${_tag}"

build() {
  cd "${srcdir}/${_sourcedir}"

  export PATH="${srcdir}/node-v${_nodever}-linux-x64/bin:${PATH}"

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

  # The bundled node must not depend on libraries outside glibc/libstdc++.
  # readelf instead of ldd: fakeroot preloads libfakeroot.so into ldd's output.
  local _node="${pkgdir}/opt/${pkgname}/appdir/resources/open-design/bin/node"
  if readelf -d "${_node}" | grep NEEDED | grep -Ev '(ld-linux-x86-64|lib(c|m|dl|pthread|stdc\+\+|gcc_s|atomic))\.so' | grep -q .; then
    echo "Error: bundled node links against system libraries:" >&2
    readelf -d "${_node}" | grep NEEDED >&2
    return 1
  fi

  # Binaries
  install -Dm755 "${srcdir}/open-design-desktop.sh" "${pkgdir}/usr/bin/open-design-desktop"
  ln -sf "open-design-desktop" "${pkgdir}/usr/bin/open-design"

  # Desktop entry & Icon
  install -Dm644 "${srcdir}/open-design-desktop.desktop" "${pkgdir}/usr/share/applications/open-design-desktop.desktop"
  install -Dm644 tools/pack/resources/linux/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/open-design.png"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
