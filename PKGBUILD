# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname='opensearch-dashboards-gantt-chart-plugin'
_pluginname='gantt-chart-dashboards-plugin'
pkgver=2.8.0.0
_dashboardsver=2.8.0
pkgrel=1
pkgdesc='OpenSearch Dashboards Gantt Chart Plugin'
url='https://opensearch.org/docs/latest/dashboards/gantt/'
arch=('x86_64')
license=('Apache')
depends=("opensearch-dashboards=${_dashboardsver}")
makedepends=('yarn' 'npm' 'python' 'git')
options=('!strip' 'emptydirs')
source=(
  "git+https://github.com/opensearch-project/dashboards-visualizations.git#tag=${pkgver}"
  "git+https://github.com/opensearch-project/OpenSearch-Dashboards.git#tag=${_dashboardsver}"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
  nodeVersion="$(node -v)"
  # Yes, you support this version. You just don't know it yet.
  sed -i "s/    \"node\": \"[0-9\.]*\",/    \"node\": \"${nodeVersion:1}\",/" "OpenSearch-Dashboards/package.json"

  # https://github.com/opensearch-project/dashboards-visualizations/issues/146
  sed -i "s/  \"opensearchDashboardsVersion\": \"2.4.0\",/  \"opensearchDashboardsVersion\": \"2.8.0\",/" "dashboards-visualizations/gantt-chart/opensearch_dashboards.json"
  # https://github.com/opensearch-project/OpenSearch-Dashboards/issues/4260
  cd "OpenSearch-Dashboards"
  git cherry-pick -n -m1 "986eb8c82a6be22bfb838a7dc1db997905737c88"
}

build() {
  mv "dashboards-visualizations/gantt-chart" "OpenSearch-Dashboards/plugins/${_pluginname}"
  cd "OpenSearch-Dashboards/plugins/${_pluginname}"
  yarn osd bootstrap
  yarn plugin-helpers build --skip-archive # `yarn build` will always create the ZIP
}

check() {
  cd "OpenSearch-Dashboards/plugins/${_pluginname}"
  yarn test
}

package() {
  install -Dm644 "${srcdir}/dashboards-visualizations/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/share/opensearch-dashboards/plugins/"

  cp -r "${srcdir}/OpenSearch-Dashboards/plugins/${_pluginname}/build/opensearch-dashboards/"* "${pkgdir}/usr/share/opensearch-dashboards/plugins/"

  find "${pkgdir}/usr/share/opensearch-dashboards/plugins" -type d -empty -delete
}

# vim: ts=2 sw=2 et:
