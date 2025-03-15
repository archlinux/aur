# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname='opensearch-dashboards-gantt-chart-plugin'
_pluginname='gantt-chart-dashboards-plugin'
pkgver=2.19.1.0
_dashboardsver=2.19.1
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
  # Switch to NodeJS LTS 22 "Jod"
  "https://github.com/hashworks/OpenSearch-Dashboards/commit/1a602a8e117f735154230cc5199153a57ec5bbb6.patch"
)
sha256sums=('a369d95697815939fa16c34301c5ecfaa31aeb8dc76368998e6aa0aae8dd0a5e'
            'd9e3acfeb25ce8c021c20d55f25d1f20fd5f524de81147f4154ab9fad7a8b786'
            'e916c1dd34871372ff4e7ca71e66cb14c472ca94c9143e6b6da28dbef1b25738')

prepare() {
  nodeVersion="$(node -v)"
  # Yes, you support this version. You just don't know it yet.
  sed -i "s/    \"node\": \"[0-9\.]*\",/    \"node\": \"${nodeVersion:1}\",/" "OpenSearch-Dashboards/package.json"
  cd "OpenSearch-Dashboards"
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      patch -p1 -N -l -i "$srcdir/${filename##*/}"
    fi
  done
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
