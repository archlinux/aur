# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>

pkgname=heroku-cli-bin
pkgver=7.47.7
pkgrel=1
_builddir=cli-$pkgver-$pkgrel
pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
makedepends=('npm')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/SampsonCrowley/heroku-cli-bin/raw/v$pkgver-$pkgrel/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
sha256sums=('68262a8d5511a602d200cc8088ef2f5bac330aacb8270a877ff8af22ff02d573')
sha512sums=('34310f76241f6982ab81f24150d0bde6b8dac2a52fd628daecacb45dfc5354dad38391f6d0962ed22afa0da3f8568568bc21a79ba47b66b2892cf69a8967164e')
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
