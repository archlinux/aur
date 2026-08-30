# Maintainer: igorvisi <igorvisi@icloud.com>

pkgname=todoist-cli
pkgver=5.1.2
pkgrel=1
pkgdesc="Command-line interface for Todoist"
arch=('any')
url="https://github.com/Doist/todoist-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=(
  'libsecret: OS credential storage via Secret Service (Linux)'
)
provides=('todoist-cli')
conflicts=('todoist-cli-git')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@doist/todoist-cli/-/todoist-cli-$pkgver.tgz")
sha256sums=('ac2a6849a4072910f337fe63cfc7b131220c221884653e256422eda15b6f83a9')
noextract=("$pkgname-$pkgver.tgz")
options=('!strip')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  # Remove references to $pkgdir and $srcdir
  find "${pkgdir}" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d" || true

  local _pkgjson="${pkgdir}/usr/lib/node_modules/@doist/todoist-cli/package.json"
  if [[ -f "${_pkgjson}" ]]; then
    local _tmp
    _tmp="$(mktemp)"
    jq 'with_entries(select(.key | test("^_") | not))' "${_pkgjson}" > "${_tmp}"
    mv "${_tmp}" "${_pkgjson}"
    chmod 644 "${_pkgjson}"
  fi

  # Fix permissions
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of all files to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Remove empty etc directory if npm created it
  [[ -d "${pkgdir}/usr/etc" ]] && rm -rf "${pkgdir}/usr/etc"

  # License
  install -Dm644 "${pkgdir}/usr/lib/node_modules/@doist/todoist-cli/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
