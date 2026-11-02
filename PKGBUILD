# Maintainer: agony <27015 at riseup dot net>
# Contributor: eNV25 <env252525@gmail.com>

pkgname=webtorrent-mpv-hook
pkgver=1.4.7
pkgrel=1
_ndcver=0.32.3
pkgdesc="Hook that allows mpv to stream torrents"
arch=('x86_64' 'aarch64')
url="https://github.com/mrxdst/webtorrent-mpv-hook"
license=('Unlicense')
depends=('glibc' 'mpv' 'nodejs')
depends_x86_64=('libstdc++')
makedepends=('jq' 'npm')
_ndcurl="https://github.com/murat-dogan/node-datachannel/releases/download/v${_ndcver}/node-datachannel-v${_ndcver}-napi-v8"
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
source_x86_64=("${_ndcurl}-linux-x64.tar.gz")
source_aarch64=("${_ndcurl}-linux-arm64.tar.gz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('a38530ef6623be4ee6eff99fbc82c3fcc2491099c59337e4715810531fc3dac1')
sha256sums_x86_64=('4092afc9cd594a3326eb1bd823da452b227b742ea8222689b2cea6f7344cf67a')
sha256sums_aarch64=('4bdbd80aeb11fb0a903318defe663a833a1f0af2615450fe10dab75c81723445')

package() {
  npm install -g --prefix "${pkgdir}/usr" --cache "${srcdir}/npm-cache" --ignore-scripts --no-audit --no-fund "${srcdir}/${pkgname}-${pkgver}.tgz"
  local mod="${pkgdir}/usr/lib/node_modules/${pkgname}"

  # The install script of node-datachannel downloads this binary unchecked; take the release asset instead
  local ndc="${mod}/node_modules/node-datachannel" found
  found=$(jq -r .version "${ndc}/package.json")
  if [[ ${found} != "${_ndcver}" ]]; then
    echo "npm installed node-datachannel ${found}, _ndcver is ${_ndcver}" >&2
    return 1
  fi
  install -Dm755 build/Release/node_datachannel.node -t "${ndc}/build/Release"

  # Keep only the glibc prebuilds for this architecture
  local plat
  case "${CARCH}" in
    x86_64) plat=linux-x64 ;;
    aarch64) plat=linux-arm64 ;;
  esac
  find "${mod}/node_modules" -type d -path '*/prebuilds/*' -prune ! -name "${plat}" -exec rm -r {} +
  find "${mod}/node_modules" -path '*/prebuilds/*' -name '*.musl.node' -delete
  find "${mod}/node_modules" -type d -name prebuilds -empty -delete

  install -d "${pkgdir}/etc/mpv/scripts"
  ln -s "/usr/lib/node_modules/${pkgname}/build/webtorrent.js" "${pkgdir}/etc/mpv/scripts/webtorrent.js"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
