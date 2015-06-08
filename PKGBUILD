# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=lockee-git
_gitname=Lockee
pkgver=1.0.0.r0.ge2ba3b0
pkgrel=1
pkgdesc="Temporary encrypted file lockers on the web"
arch=('any')
url="https://github.com/hbons/Lockee"
license=('AGPL3')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('lockee')
conflicts=('lockee')
options=(!emptydirs)
source=('git://github.com/hbons/Lockee.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Bumping sqlite3 dependencie to 3.0.x 
  sed -i 's/2.1.1/3.0.x/g' package.json

  # Fix path in service file
  sed -i 's|share/lockee|lib/node_modules/Lockee|g' lockee.service
}

package() {
  cd "${srcdir}/${_gitname}"

  npm install --user root -g --prefix "${pkgdir}/usr"
  install -Dm644 "${_gitname,}.service" -t "${pkgdir}/usr/lib/systemd/system" 
}

# vim:set ts=2 sw=2 et:
