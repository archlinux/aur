# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>

pkgname=heroku-cli-bin
pkgver=7.45.0
pkgrel=1
_builddir=cli-$pkgver-$pkgrel
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
makedepends=('npm')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/SampsonCrowley/heroku-cli-bin/raw/v$pkgver-$pkgrel/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
sha256sums=('17e46cf47271d3c043e3d06f3eb5b5c7bc0a4ffc3cc183a1d2f2aa6a6ffc5c41')
sha512sums=('1db75e945986bc2f006f6efe532634e59a0f513c5fef5bc397e312517da0a8e56daaa51e49ea9802617b94e06d4df3491cf0f7b5a8c87a0dcc9dea52bb235a7b')
options=('!strip')
provides=('heroku' 'heroku-cli')


package() {
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
