# Maintainer: WeeXnes <weexnes@weexnes.dev>

pkgname=controlcenter
pkgver=1.9.0
pkgrel=1
pkgdesc="ControlCenter Web Interface built with Nuxt (stable version)"
arch=('any')
url="https://code.weexnes.dev/ControlCenter"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
provides=('controlcenter')
conflicts=('controlcenter-git')
options=('!strip')
install=controlcenter.install
source=("${pkgname}-${pkgver}.tar.gz::https://code.weexnes.dev/~downloads/projects/73/archives?revision=${pkgver}&format=tgz"
        "controlcenter.service")
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
  install -d "$pkgdir/opt/controlcenter"
  cp -r "$srcdir/.output/"* "$pkgdir/opt/controlcenter/"

  # Replace the symlinked node_modules with the real production node_modules
  rm -rf "$pkgdir/opt/controlcenter/server/node_modules"
  cp -r "$srcdir/node_modules" "$pkgdir/opt/controlcenter/server/"

  # Install systemd service
  install -Dm644 "$srcdir/controlcenter.service" "$pkgdir/usr/lib/systemd/system/controlcenter.service"
}
