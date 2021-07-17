# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://gitlab.com/thann/pingg
# Upstream: https://gitlab.com/thann/pingg

pkgname=pingg-git
pkgver=0.0.12.1.g22a7f0b
pkgrel=1
pkgdesc='Ping latency graphical CLI.'
arch=('any')
url='http://gitlab.com/thann/pingg/'
license=('UNLICENSE')
depends=('nodejs' 'traceroute')
makedepends=('git' 'npm' 'python2' 'gcc')
provides=('pingg')
conflicts=('pingg')
source=("$pkgname::git+https://gitlab.com/thann/pingg.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$pkgname"
  #npm install -g --prefix "$pkgdir"/usr --user root --unsafe-perm
  ## NOTE: npm broke both the --prefix and --root arguments =/
  npm install --production

  # copy files
  find * -exec install -D -m644 "{}" "$pkgdir/usr/lib/node_modules/pingg/{}" \;
  chmod +x "$pkgdir/usr/lib/node_modules/pingg/pingg"
  mkdir "$pkgdir/usr/bin/"
  ln -st "$pkgdir/usr/bin/" "/usr/lib/node_modules/pingg/pingg"

  # install desktop file and icon
  install -D -m644 thann.pingg.desktop "$pkgdir/usr/share/applications/thann.pingg.desktop"
  install -D -m644 icon.pingg.png "$pkgdir/usr/share/pixmaps/icon.pingg.png"

  # install license link
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -st "$pkgdir/usr/share/licenses/$pkgname/" "/usr/lib/node_modules/pingg/LICENSE"

  #HACK: remove references to $srcdir & $pkgdir (if you care)
  # npm install -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
  # "$pkgdir"/usr/bin/removeNPMAbsolutePaths "$pkgdir"/usr
  # npm uninstall -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
}
