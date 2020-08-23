# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=matrix-dimension
pkgname=dimension
pkgver=r530.db22981
pkgrel=2

pkgdesc="An open source integrations manager for matrix clients, like Riot."
url="https://github.com/turt2live/matrix-dimension"
arch=('x86_64')
license=('GPL3')

depends=('nodejs' 'libvips' 'sqlite')
makedepends=('npm' 'python2' 'git')
backup=('etc/dimension/production.yaml')

source=("git+https://github.com/turt2live/matrix-dimension#commit=db2298172f8379972567fd298cee1cc1a6e0ae82"
	"${pkgname}.service")

sha256sums=('SKIP'
            '5da286eab86577a78aa370693894f51ea1faa070d2c41b92abe308cab6ba7a89')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  # Bump sharp and node-sass to make dimension compatible with node12 and node14
  # ref: https://github.com/turt2live/matrix-dimension/pull/352
  sed -i -e 's/"sharp": "^0.21.1"/"sharp": "^0.25.4"/' -e 's/node-sass": "^4.12.0/node-sass": "^4.14.1/'  package.json

}

build() {
  cd $_pkgname
  # make angular run production mode
  sed -i -e 's/process.env.ENV === "build"/true/' web/main.ts
  npm install --build-from-source --sass-binary-site=http://localhost:0 --sqlite=/usr
  npm run build
  # development dependencies are required for building the front and backend but we don't want this to end up in the package 
  # where we need to package the whole node_modules directory
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
