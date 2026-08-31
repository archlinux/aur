# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ima2-gen
pkgver=3.12.3
pkgrel=1
pkgdesc='Local OAuth image generation studio for GPT Image 2 workflows'
arch=('x86_64')
url='https://lidge-jun.github.io/ima2-gen/'
license=('MIT')
depends=('nodejs>=20' 'gcc-libs' 'glibc' 'ncurses')
makedepends=('npm')
optdepends=(
  'python: ComfyUI bridge support'
  'python-numpy: ComfyUI bridge support'
  'python-pillow: ComfyUI bridge support'
  'python-pytorch: ComfyUI bridge support'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('4c22f440bc1cca726c1b6cd4554354b2e5ff476fbed364e2f0d2a20fbb0d63dd')
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

  # better-sqlite3 >=13 ships a prebuilt linux-x64.node in its npm tarball
  # (lib/binding.js loads it directly), so no native build is needed here.
  local sqlite_dir="${node_root}/node_modules/better-sqlite3"
  [[ -f "${sqlite_dir}/prebuilds/linux-x64.node" ]] || return 1

  find "${node_root}" -type f -name '*.node' \
    \( -name '*darwin*' -o -name '*win32*' -o -name '*win64*' -o -name '*android*' -o -name '*freebsd*' -o -name '*arm64*' -o -name '*armv7*' -o -name '*armhf*' -o -name '*linux-arm*' -o -name '*musl*' \) \
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
}
