# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributor: Michael Herold <https://github.com/michaelherold>

pkgname=heroku-cli
pkgver=7.43.0
pkgrel=1
_builddir=cli-$pkgver-$pkgrel
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
# makedepends=('npm')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://storage.googleapis.com/arch-package-files/heroku-cli-v$pkgver-$pkgrel.tar.xz")
sha256sums=('e81708573d106d3a5a3a769ae8fdb75f3752ead3cfdb45f1bc445fa24b88e168')
sha512sums=('4e4fc0b8ac7c550f505bbc56ba0dc1bd2f3d9a66d0690dad297bebeed5e1af95900e5f3a807fe2b3ce863741484cb12627c02c00d3c2e495c91356353a4b5165')
options=('!strip')
provides=('heroku' 'heroku-cli')

prepare() {
  # remove packaged node binary and fall back to whatever node is on the PATH
  rm -f "$srcdir/heroku/bin/heroku"
  rm -f "$srcdir/heroku/bin/heroku.cmd"
  rm -f "$srcdir/heroku/bin/node"
}

package() {
  # https://cli-assets.heroku.com/linux-arm
  # https://cli-assets.heroku.com/linux-x64

  install -dm755 "$pkgdir/usr/lib/heroku"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

  herokulibdir="$pkgdir/usr/lib"
  for foundherokudir in $(find "$srcdir/heroku" -mindepth 1 -type d) ; do
    herokuinstalldir="${foundherokudir/$srcdir/$herokulibdir}"
    install -dm755 "$herokuinstalldir"
  done

  for foundherokufile in $(find "$srcdir/heroku" -mindepth 1 -type f) ; do
    herokuinstallperm=$(stat -c "%a" "$foundherokufile")
    herokuinstallfile="${foundherokufile/$srcdir/$herokulibdir}"
    install -Dm$herokuinstallperm "$foundherokufile" "$herokuinstallfile"
  done

  ln -sf "../../../lib/heroku/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "../../lib/heroku/bin/run" "$pkgdir/usr/bin/heroku"
}
