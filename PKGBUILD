# Maintainer: Vincent Nascone <vincent@arch.nascone.net>

pkgname='miniflux-git'
pkgver='r1081.9056c8d'
pkgrel=1
pkgdesc='Minimalist web RSS reader (Git version)'
arch=('any')
url='https://miniflux.net/'
license=('AGPL3')
depends=('php'
         'php-sqlite')
conflicts=('miniflux')
provides=('miniflux')
optdepends=('postgresql: for non-sqlite db'
            'php-pgsql: for non-sqlite db')
makedepends=('git')
options=('!strip')
install=miniflux.install
source=('git+https://github.com/miniflux/miniflux.git')
sha256sums=('SKIP')

pkgver() {
  cd miniflux
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd miniflux
  _instdir="$pkgdir"/usr/share/webapps/miniflux

  install -o http -g http -d "$_instdir"
  install -o http -g http -d "$pkgdir"/var/lib/miniflux

  cp -ra * "$_instdir/"

  rm -rf "$_instdir"/data # remove data from instdir
  cp -r data/* "$pkgdir"/var/lib/miniflux # move data to /var/lib
  #ln -s /var/lib/miniflux "$_instdir"/data # and link it back where the app expects:wq


  # TODO: systemd timer
}
