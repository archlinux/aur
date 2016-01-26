# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=haste-server-git
_gitname=haste-server
pkgver=r238.45e19bc
pkgrel=1
pkgdesc="Prettiest, easiest to use pastebin ever made"
arch=('any')
url="https://github.com/seejohnrun/haste-server"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('haste-server')
conflicts=('haste-server')
options=(!emptydirs)
source=('git://github.com/seejohnrun/haste-server.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Set the current working directory
  sed -i '1i process.chdir(__dirname)' server.js

  # Adding missing files to package.json
  sed -i '39i "config.js","about.md",' package.json

  # Changing defaut storage to file
  sed -i '27,31c "path": "./data","type": "file"' config.js

  # Unable to run haste from /usr/bin, so removing it
  sed -i '33,35d' package.json
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 "../../${_gitname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  npm install --user root -g --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
