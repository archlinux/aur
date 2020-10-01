# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributor: Michael Herold <https://github.com/michaelherold>

pkgname=heroku-cli
pkgver=7.44.0
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
sha256sums=('a9692ac7ec94388d21e12348363dc596d09a8f1d6301b6d23961bbd22ee03941')
sha512sums=('ee1356f1fb845a055a932e3f23be86006e814e0a8444c3845f8496caa2bdd91b8e63aca6432c3439a71023ecd9b0eba99f73ec59949b87e39b2d34e42f0da4b0')
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
