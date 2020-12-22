pkgname=receptor-git
_pkgname=receptor
pkgver=r149.6255f9f
provides=('synapse')
conflicts=('synapse')
pkgrel=1
pkgdesc='Web frontend for the synapse bittorrent client'
arch=('any')
url='https://git.sr.ht/~sircmpwn/receptor'
license=('BSD')
makedepends=('git' 'npm')
source=(git+https://git.sr.ht/~sircmpwn/receptor)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  npm install --cache "${srcdir}/npm-cache"
  npm run build:production
}

package() {
  cd "$srcdir"/"$_pkgname"
  _instdir="$pkgdir"/usr/share/webapps/"$_pkgname"
  mkdir -p "$_instdir" "$_instdir"/dist
  install -Dm 644 index.html "$_instdir"
  install -Dm 644 dist/* "$_instdir"/dist
}
