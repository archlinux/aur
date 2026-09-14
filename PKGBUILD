pkgname=socket
pkgver=1.1.171
pkgrel=1
pkgdesc='Command-line interface for socket.dev security analysis, compiled from source'
arch=('x86_64' 'aarch64')
url='https://github.com/SocketDev/socket-cli'
license=('MIT')
depends=('nodejs')
makedepends=('pnpm')
conflicts=(
  'socket-cli'
  'socket-cli-bin'
  'socket-cli-git'
  'socket-bin'
  'socket-git'
)
provides=('socket-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1bf55683b16b63888dbbdd7041a418d03a052b41adb07b01345693f57d879fd')

build() {
  cd "${srcdir}/socket-cli-${pkgver}"

  pnpm install --frozen-lockfile --ignore-scripts
  pnpm run build
  pnpm prune --prod --ignore-scripts
}

package() {
  local node_modules_dir="${pkgdir}/usr/lib/node_modules/socket"

  cd "${srcdir}/socket-cli-${pkgver}"

  install -d "${node_modules_dir}"
  install -d "${pkgdir}/usr/bin"

  cp -a bin dist external shadow-bin node_modules "${node_modules_dir}/"
  install -Dm644 package.json "${node_modules_dir}/package.json"
  install -Dm644 requirements.json "${node_modules_dir}/requirements.json"
  install -Dm644 translations.json "${node_modules_dir}/translations.json"
  install -Dm644 CHANGELOG.md "${node_modules_dir}/CHANGELOG.md"
  install -Dm644 DISCLOSURE "${node_modules_dir}/DISCLOSURE"

  ln -s '/usr/lib/node_modules/socket/bin/cli.js' "${pkgdir}/usr/bin/socket"
  ln -s '/usr/lib/node_modules/socket/bin/npm-cli.js' "${pkgdir}/usr/bin/socket-npm"
  ln -s '/usr/lib/node_modules/socket/bin/npx-cli.js' "${pkgdir}/usr/bin/socket-npx"
  ln -s '/usr/lib/node_modules/socket/bin/pnpm-cli.js' "${pkgdir}/usr/bin/socket-pnpm"
  ln -s '/usr/lib/node_modules/socket/bin/yarn-cli.js' "${pkgdir}/usr/bin/socket-yarn"
}
