# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ima2-gen
pkgver=3.0.5
pkgrel=1
pkgdesc='Local OAuth image generation studio for GPT Image 2 workflows'
arch=('x86_64')
url='https://lidge-jun.github.io/ima2-gen/'
license=('MIT')
depends=('nodejs>=20' 'gcc-libs' 'glibc' 'ncurses')
makedepends=('npm' 'node-gyp' 'python')
optdepends=(
  'python: ComfyUI bridge support'
  'python-numpy: ComfyUI bridge support'
  'python-pillow: ComfyUI bridge support'
  'python-pytorch: ComfyUI bridge support'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('125fd0a3becb5a642aea12dd5ed272fdbfa5640ef39b480fc790c14ed8a2f222')
noextract=("${pkgname}-${pkgver}.tgz")

latestver() {
  npm view "${pkgname}" dist-tags.latest
}

package() {
  npm install --cache "${srcdir}/npm-cache" \
    --prefix "${pkgdir}/usr" \
    --global \
    "${srcdir}/${pkgname}-${pkgver}.tgz"

  local node_root="${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -Dm644 "${node_root}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # npm 12 refuses to run install scripts unless the package is listed in
  # allow-scripts, and only warns when it skips them, so better-sqlite3's
  # native binding is silently absent. Build it here from the amalgamation
  # shipped in the tarball, against the headers from the nodejs package.
  local sqlite_dir="${node_root}/node_modules/better-sqlite3"
  ( cd "${sqlite_dir}" && npm_config_nodedir=/usr node-gyp rebuild --release )
  [[ -f "${sqlite_dir}/build/Release/better_sqlite3.node" ]] || return 1
  rm -f "${sqlite_dir}/build/Release/test_extension.node"

  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*android*' -o -name '*freebsd*' -o -name '*arm64*' -o -name '*armv7*' -o -name '*armhf*' -o -name '*linux-arm*' -o -name '*-musl*' \) \
    -delete 2>/dev/null || true

  rm -rf "${node_root}/node_modules/@img/sharp-linuxmusl-x64" \
         "${node_root}/node_modules/@img/sharp-linux-arm64" \
         "${node_root}/node_modules/@img/sharp-linuxmusl-arm64" \
         "${node_root}/node_modules/@img/sharp-wasm32" \
         "${node_root}/node_modules/@img/sharp-libvips-linuxmusl-x64" \
         "${node_root}/node_modules/@img/sharp-libvips-linux-arm64" \
         "${node_root}/node_modules/@img/sharp-libvips-linuxmusl-arm64" \
         "${node_root}/node_modules/@img/sharp-libvips-linux-arm" \
         "${node_root}/node_modules/@img/sharp-libvips-linuxmusl-arm"

  rm -f "${node_root}/node_modules/trash/lib/macos-trash" \
        "${node_root}/node_modules/trash/lib/macos.js" \
        "${node_root}/node_modules/trash/lib/windows-trash.exe" \
        "${node_root}/node_modules/trash/lib/windows.js" \
        "${node_root}/node_modules/trash/lib/wsl.js"

  rm -rf "${node_root}/node_modules/better-sqlite3/build/Release/obj.target"
  find "${node_root}/node_modules/better-sqlite3/build" -type f ! -name '*.node' -delete 2>/dev/null || true
  find "${node_root}/node_modules/better-sqlite3/build" -type d -empty -delete 2>/dev/null || true
}
