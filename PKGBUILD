# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=matrix-dimension
pkgname=dimension
pkgver=r528.9e2393c
pkgrel=1

pkgdesc="An open source integrations manager for matrix clients, like Riot."
url="https://github.com/turt2live/matrix-dimension"
arch=('any')
license=('GPL3')

depends=('nodejs' 'libvips' 'sqlite')
makedepends=('npm' 'python2')
backup=('etc/dimension/production.yaml')

source=("git+https://github.com/turt2live/matrix-dimension#commit=9e2393cecac3aabdc3d6d7236a4c139d6fe9ff6d"
	"${pkgname}.service")

sha256sums=('SKIP'
            'e51e15b65ff47d22f51bcbecb8c74b6d947b603f1ebe3ecb0eb607e17d56d3ae')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  sed -i -e 's/"sharp": "^0.21.1"/"sharp": "^0.25.4"/' -e 's/node-sass": "^4.12.0/node-sass": "^4.14.1/'  package.json
}

build() {
  cd $_pkgname
  npm install --build-from-source --sass-binary-site=http://localhost:0 --sqlite=/usr
  npm audit fix
  npm run build
  rm -rf node_modules
  npm install --production --build-from-source --sass-binary-site=http://localhost:0 --sqlite=/usr
}

package() {
  install -Dm644 ${pkgname}.service "$pkgdir"/usr/lib/systemd/system/${pkgname}.service
  cd $_pkgname
  install -dm755 "${pkgdir}"/usr/share/webapps/"${pkgname}"
  cp -r {node_modules,build,package.json} "${pkgdir}"/usr/share/webapps/"${pkgname}"/
  install -dm755 -o 198 -g 198 "$pkgdir"/etc/$pkgname
  install -Dm644 config/default.yaml "$pkgdir"/etc/$pkgname/production.yaml
}

