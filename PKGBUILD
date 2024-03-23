# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Yosef Langer (vasilevich1234 dot gmail dot ...)

pkgname=nginxbeautifier
pkgver=1.0.19
pkgrel=3
pkgdesc='nginx config file formatter and beautifier'
arch=(any)
url='https://github.com/vasilevich/nginxbeautifier'
license=(Apache-2.0)
depends=(nodejs)
makedepends=(git npm)
_commit=734ff631f254d8f17661d81e43927ba68e69f545
source=("$pkgname::git+https://github.com/vasilevich/nginxbeautifier.git#commit=${_commit}")
b2sums=('SKIP')

build() {
  cd $pkgname

  # we create a taball of the project as "npm installing" (see package()) the directory itself only creates symlinks
  npm pack
}

package() {
  cd $pkgname

  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # remove ide stuff
  rm -r "$pkgdir"/usr/lib/node_modules/nginxbeautifier/.idea

  install -d "$pkgdir"/usr/share/doc/$pkgname
  ln -s /usr/lib/node_modules/$pkgname/README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}

# vim:set ts=2 sw=2 et:
