# Maintainer: Rijnder Wever <rien334 at gmail dot com>

_npmname="readability"
pkgname=nodejs-$_npmname-git
pkgver=0.4.1.r11.g28843b6
pkgrel=1
pkgdesc="A standalone version of the readability library used for Firefox Reader View"
arch=('any')
url="https://github.com/mozilla/readability"
license=('Apache')
depends=('nodejs')
makedepends=('git' 'npm')
source=("$_npmname::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_npmname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_npmname"
  npm install -g --prefix "${pkgdir}/usr" git+file://"$(pwd)"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
