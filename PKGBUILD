# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
pkgname=vscode-eslint-language-server
pkgver=2.2.6
pkgrel=1
pkgdesc='Language Server for ESLint, extracted from the official VSCode extension'
arch=('any')
url='https://github.com/Microsoft/vscode-eslint'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/release/${pkgver}.tar.gz")
sha256sums=('611b88c72f97d293fb94374839976b752759524e620022408f7c99b9fca3000a')

build() {
  cd "${srcdir}/vscode-eslint-release-${pkgver}"
  local _dir; for _dir in . client server; do
    (
      cd "$_dir"
      npm clean-install --no-audit --no-fund --ignore-scripts
    )
  done
  npm run vscode:prepublish
}

package() {
  cd "${srcdir}/vscode-eslint-release-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "License.txt"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
  install -d "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cd server
  cp -r package.json out "${pkgdir}/usr/lib/node_modules/${pkgname}"
  cat >"main.js" <<EOF
#!/usr/bin/env node
require('/usr/lib/node_modules/${pkgname}/out/eslintServer.js');
EOF
  install -Dm755 -T "main.js" "${pkgdir}/usr/bin/${pkgname}"
}
