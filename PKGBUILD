# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=ima2-gen
pkgver=2.0.2
pkgrel=1
pkgdesc='Local OAuth image generation studio for GPT Image 2 workflows'
arch=('x86_64')
url='https://lidge-jun.github.io/ima2-gen/'
license=('MIT')
depends=('nodejs>=20' 'gcc-libs' 'glibc')
makedepends=('npm')
optdepends=(
  'python: ComfyUI bridge support'
  'python-numpy: ComfyUI bridge support'
  'python-pillow: ComfyUI bridge support'
  'python-pytorch: ComfyUI bridge support'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('278f7bc64980af79bd84aeae84f328ada12b5bc99d4c448d9f9ded62b59658d9')
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
