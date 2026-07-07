# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=clyocloud-git
_commit=ab15e9f475f53b76dce86b4ca4cf156629c4bb9d
pkgver=2.3.0.r${_commit:0:7}
pkgrel=1
pkgdesc="A sleek personal cloud storage and media streaming server built with Nuxt (git version)"
arch=('any')
url="https://code.weexnes.dev/ClyoCloud"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=('clyocloud')
conflicts=('clyocloud')
options=('!strip')
install=clyocloud.install
source=("${pkgname}-${_commit}.tar.gz::https://code.weexnes.dev/~downloads/projects/23/archives?revision=${_commit}&format=tgz"
        "clyocloud.service")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir"
  # Install all dependencies for build
  npm install
  # Build the Nuxt application
  npm run build
  # Prune devDependencies to keep package size minimal
  npm prune --omit=dev
}

package() {
  # Install build output
  install -d "$pkgdir/opt/clyocloud"
  cp -r "$srcdir/.output/"* "$pkgdir/opt/clyocloud/"

  # Replace the symlinked node_modules with the real production node_modules
  rm -rf "$pkgdir/opt/clyocloud/server/node_modules"
  cp -r "$srcdir/node_modules" "$pkgdir/opt/clyocloud/server/"

  # Install systemd service
  install -Dm644 "$srcdir/clyocloud.service" "$pkgdir/usr/lib/systemd/system/clyocloud.service"
}
