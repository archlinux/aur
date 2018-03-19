# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Salamandar <felix at piedallu dot me>

_pkgname=beaker
pkgname=beaker-browser
pkgver=0.7.11
pkgrel=1
pkgdesc="Peer-to-peer web browser with tools to create and host websites"
arch=(x86_64)
url="https://github.com/beakerbrowser/beaker"
license=('MIT')
depends=(
  'electron'
)
makedepends=(
  'git'
  'npm'
  'python2'
)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/beakerbrowser/${_pkgname}/archive/${pkgver}.tar.gz"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
)
sha256sums=(
  '5e3541868ffbf4a9085fb12e863192b682c84e7bb02899b3e7a4bd7125f505e8'
  '23ea9820de249cb65d319e943d200940d929a3c8261b5d978848ddc44554728f'
  'f6ac7e3d7d8d729afc32b804bab9b6f1b5ae0f0b8d350c17c8f6efba222b6165'
)

options=(!strip)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  npm install
  #see https://github.com/electron/electron/issues/5851
  sed -i "s|--target=[^ ]* |--target=$(</usr/lib/electron/version) |" tasks/rebuild.js
  sed -i 's|python|python2|' app/node_modules/sqlite3/deps/sqlite3.gyp
  rm -r app/node_modules/*-native/prebuilds

  npm run rebuild
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/"{lib,share/pixmaps}

  install -Dm755 "${_pkgname}.sh"                             "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop"                        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -dm755                                              "${pkgdir}/usr/share/licenses/${_pkgname}"
  sed -n '/## License/,$p' "${_pkgname}-${pkgver}/README.md" >"${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  ln -s "../../lib/${_pkgname}/assets/img/logo.png"           "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  cp -r "${_pkgname}-${pkgver}/app"                           "${pkgdir}/usr/lib/${_pkgname}"

  # Clean up
  find "${pkgdir}/usr/lib/${_pkgname}/node_modules" -name "package.json" \
    -exec sed -e "s|${srcdir}/${_pkgname}|/usr/lib/${_pkgname}|" -i {} \; \

  find "${pkgdir}/usr/lib/${_pkgname}/node_modules" \
    \(  -name ".*" \
    -or -name "*.gyp" \
    -or -name "*.gypi" \
    -or -name "*.mk" \
    -or -name "*Makefile" \
    -or -name "bin" \
    -or -name "deps" \
    -or -name "doc" \
    -or -name "example" \
    -or -name "man" \
    -or -name "nan" \
    -or -name "obj.target" \
    -or -name "script" \
    -or -name "test" \
    -or -name "tmp" \
    \) -prune -exec rm -r '{}' \;
}
