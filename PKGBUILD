# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: ml <>

pkgname=helm-secrets
pkgver=4.7.8
pkgrel=1
pkgdesc="Helm plugin to manage secrets with Git workflow and store them anywhere"
arch=(any)
url=https://github.com/jkroepke/helm-secrets
license=(Apache-2.0)
install=helm-secrets.install
depends=(bash helm)
optdepends=(
  'sops: secret driver'
  'vault: secret driver'
)
source=(https://github.com/jkroepke/helm-secrets/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('4943f9ada525059310970f9ab051bd909a49ee9f1759b0697030ccce7ed0c9a2')

package() {
  cd "${pkgname}-${pkgver}"
  local _dest="${pkgdir}/usr/lib/helm/plugins/${pkgname##helm-}"

  # helm 4 requires multiple plugins for multiple capabilities so install
  # each one individually... note the scripts are shared amongst all plugins
  # same as upstream repo (plugins/*/scripts is a symlink)
  # https://github.com/jkroepke/helm-secrets/wiki/Installation
  for plugin in cli getter post-renderer; do
    install -Dvm0644 plugins/${pkgname}-${plugin}/plugin.yaml \
      -t "${_dest}-${plugin}"
    cp -avr scripts/ -t "${_dest}-${plugin}"
  done

  install -Dvm0644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/"

  # NB after the above because there is an empty README.md in the docs/ folder
  install -Dvm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dvm0644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

# vim: set ts=2 sw=2 et:
