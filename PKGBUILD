# Maintainer: ml <>
pkgname=helm-secrets
pkgver=3.3.5
pkgrel=3
pkgdesc='Helm plugin to manage secrets with Git workflow and store them anywhere'
arch=('any')
url='https://github.com/jkroepke/helm-secrets'
license=('Apache')
install=helm-secrets.install
depends=('bash' 'helm')
optdepends=(
  'sops: secret driver'
  'vault: secret driver'
)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a08b5554af5c199b9db4c42454a488e1b99bc30402cd06ecbb6fc66be2a3661a')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '/platformCommand:/,+2 d' plugin.yaml
}

# check(): Go tests require special test environment

package() {
  cd "${pkgname}-${pkgver}"
  local _dest="${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"
  install -Dm644 plugin.yaml -t "$_dest"
  # copy whole scripts directory but remove the install script
  cp -ar scripts/ -t "$_dest"
  rm -f "$_dest/install.sh"
}
