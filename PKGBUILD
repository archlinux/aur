# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname='opensearch-dashboards-gantt-chart-plugin'
_pluginname='gantt-chart-dashboards-plugin'
pkgver=2.14.0.0
_dashboardsver=2.14.0
pkgrel=1
pkgdesc='OpenSearch Dashboards Gantt Chart Plugin'
url='https://opensearch.org/docs/latest/dashboards/gantt/'
arch=('x86_64')
license=('Apache-2.0')
depends=("opensearch-dashboards=${_dashboardsver}")
makedepends=('yarn' 'npm' 'python' 'git')
options=('!strip' 'emptydirs')
source=(
  "git+https://github.com/opensearch-project/dashboards-visualizations.git#tag=${pkgver}"
  "git+https://github.com/opensearch-project/OpenSearch-Dashboards.git#tag=${_dashboardsver}"
)
sha256sums=('eaa252e9bb2138156862ceffa7d57ee7d09ef0bf3a63017d2882b94b124fe4ea'
            'e3d995e418239f5fcf4eb1bfa14d30a17c7b42fbed275abf887646e6d1ca1cf9')

prepare() {
  nodeVersion="$(node -v)"
  # Yes, you support this version. You just don't know it yet.
  sed -i "s/    \"node\": \"[0-9\.]*\",/    \"node\": \"${nodeVersion:1}\",/" "OpenSearch-Dashboards/package.json"
}

build() {
  mv "dashboards-visualizations" "OpenSearch-Dashboards/plugins/${_pluginname}"
  cd "OpenSearch-Dashboards/plugins/${_pluginname}"
  yarn osd bootstrap
  yarn plugin-helpers build --skip-archive # `yarn build` will always create the ZIP
}

check() {
  cd "OpenSearch-Dashboards/plugins/${_pluginname}"
  yarn test
}

package() {
  install -Dm644 "${srcdir}/OpenSearch-Dashboards/plugins/${_pluginname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/share/opensearch-dashboards/plugins/"

  cp -r "${srcdir}/OpenSearch-Dashboards/plugins/${_pluginname}/build/opensearch-dashboards/"* "${pkgdir}/usr/share/opensearch-dashboards/plugins/"

  find "${pkgdir}/usr/share/opensearch-dashboards/plugins" -type d -empty -delete
}

# vim: ts=2 sw=2 et:
