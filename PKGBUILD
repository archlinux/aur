# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

pkgname='opensearch-dashboards-gantt-chart-plugin'
_pluginname='gantt-chart-dashboards-plugin'
pkgver=2.19.0.0
_dashboardsver=2.19.0
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
sha256sums=('7be060d321c468896af7433a3ad5c33981ab72eaaa49e590fd7b386dc041cf8d'
            '9cc3248ad281286e74699e7c9ebd5855cf0dae4c5ffcf6b4d789596b01cda4e4'
            'c7eab88eb06f034b0e57348d4615c86c87ea8e55da06d9ac839452317299304e')

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
