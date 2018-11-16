# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=pwclient-git
pkgver=r1446.2209369
pkgrel=1
pkgdesc="Command-line client for patchwork"
url='https://patchwork.ozlabs.org/help/pwclient/'
arch=('any')
license=('GPL')
source=("https://github.com/getpatchwork/patchwork/raw/master/patchwork/bin/pwclient")
sha256sums=('SKIP')
makedepends=('curl' 'jq')

pkgver() {
  api='https://api.github.com/repos/getpatchwork/patchwork'
  first='c561ebe710d6e6a43aa4afc6c2036a215378ce87'
  last_json=$(curl -s "$api/commits?per_page=1")
  last=$(echo "$last_json" | jq -r '.[0].sha')
  compare_json=$(curl -s "$api/compare/${first}...${last}")
  ahead_by=$(echo "$compare_json" | jq -r '.ahead_by')
  num=$((ahead_by+1))
  printf "r%d.%s" $num "${last:0:7}"
}

package() {
  install -Dm755 "${srcdir}"/pwclient "${pkgdir}"/usr/bin/pwclient
}
