# Maintainer: Guillaume Ausset <guillaume+arch@ausset.me>

_pkgname=obsidian-headless
pkgname=${_pkgname}-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="Headless client for Obsidian services"
arch=('x86_64' 'aarch64')
url="https://www.npmjs.com/package/${_pkgname}"
license=('custom:UNLICENSED')
depends=('gcc-libs' 'nodejs>=22')
makedepends=('node-gyp' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_better_sqlite3_ver=12.6.2
_commander_ver=14.0.3
_bindings_ver=1.5.0
_file_uri_to_path_ver=1.0.0

source=(
  "${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz"
  "better-sqlite3-${_better_sqlite3_ver}.tgz::https://registry.npmjs.org/better-sqlite3/-/better-sqlite3-${_better_sqlite3_ver}.tgz"
  "commander-${_commander_ver}.tgz::https://registry.npmjs.org/commander/-/commander-${_commander_ver}.tgz"
  "bindings-${_bindings_ver}.tgz::https://registry.npmjs.org/bindings/-/bindings-${_bindings_ver}.tgz"
  "file-uri-to-path-${_file_uri_to_path_ver}.tgz::https://registry.npmjs.org/file-uri-to-path/-/file-uri-to-path-${_file_uri_to_path_ver}.tgz"
)
noextract=(
  "${_pkgname}-${pkgver}.tgz"
  "better-sqlite3-${_better_sqlite3_ver}.tgz"
  "commander-${_commander_ver}.tgz"
  "bindings-${_bindings_ver}.tgz"
  "file-uri-to-path-${_file_uri_to_path_ver}.tgz"
)
sha256sums=('f9f83ab6bebdffb9fbdca86527101be2e8cc3af1fae212f022dffa31e02236d5'
            'ac3bfaa50b31d1fc878f84b64b3fa7ec1b5b6603b9be089b0501f8f5900ac7e7'
            '5849703c500e0f324eb01340d8bda1f9ec48fc37bb7be9712eb0dd52aad92f6c'
            'd77781178c5bd89a91b1f6c5556acd511b1b5927eb13e2ad8189cac29eeb0907'
            '5440cdf67e75ab96f36a6be63c1d4c3d54255b1d0970273710fecfebfab06fb3')

_extract_npm_tarball() {
  local tarball="$1"
  local dest="$2"

  rm -rf "${srcdir}/${dest}"
  mkdir -p "${srcdir}/${dest}"
  bsdtar -xf "${srcdir}/${tarball}" -C "${srcdir}/${dest}" --strip-components=1
}

prepare() {
  _extract_npm_tarball "${_pkgname}-${pkgver}.tgz" "${_pkgname}"
  _extract_npm_tarball "better-sqlite3-${_better_sqlite3_ver}.tgz" "better-sqlite3"
  _extract_npm_tarball "commander-${_commander_ver}.tgz" "commander"
  _extract_npm_tarball "bindings-${_bindings_ver}.tgz" "bindings"
  _extract_npm_tarball "file-uri-to-path-${_file_uri_to_path_ver}.tgz" "file-uri-to-path"

  rm -rf "${srcdir}/${_pkgname}/btime"/darwin-* "${srcdir}/${_pkgname}/btime"/win32-*
}

build() {
  cd "${srcdir}/${_pkgname}"

  rm -rf node_modules
  mkdir -p node_modules

  cp -a "${srcdir}/better-sqlite3" node_modules/
  cp -a "${srcdir}/commander" node_modules/
  cp -a "${srcdir}/bindings" node_modules/
  cp -a "${srcdir}/file-uri-to-path" node_modules/

  pushd node_modules/better-sqlite3 >/dev/null
  # Use distro-provided Node headers to avoid any network access during the build.
  npm_config_nodedir=/usr node-gyp rebuild --release
  find build -mindepth 1 -maxdepth 1 ! -name 'Release' -exec rm -rf {} +
  find build/Release -mindepth 1 ! -name 'better_sqlite3.node' -exec rm -rf {} +
  popd >/dev/null
}

check() {
  cd "${srcdir}/${_pkgname}"
  node ./cli.js --help >/dev/null
}

package() {
  install -dm755 "${pkgdir}/usr/lib/${_pkgname}" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/${_pkgname}/." "${pkgdir}/usr/lib/${_pkgname}/"
  ln -s "../lib/${_pkgname}/cli.js" "${pkgdir}/usr/bin/ob"

  install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/third-party"
  printf '%s\n' \
    'Upstream declares this package as "UNLICENSED" in package.json and does not ship a license file.' \
    'Bundled third-party dependency licenses are installed in third-party/.' \
    > "${pkgdir}/usr/share/licenses/${pkgname}/UPSTREAM-LICENSING"
  install -Dm644 "${srcdir}/better-sqlite3/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/third-party/better-sqlite3-LICENSE"
  install -Dm644 "${srcdir}/commander/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/third-party/commander-LICENSE"
  install -Dm644 "${srcdir}/bindings/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/third-party/bindings-LICENSE.md"
  install -Dm644 "${srcdir}/file-uri-to-path/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/third-party/file-uri-to-path-LICENSE"
}
