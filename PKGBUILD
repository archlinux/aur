# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>

pkgname=heroku-cli-bin
pkgver=7.47.2
pkgrel=3
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
sha256sums=('fbac0e4fb2fc66017313572ef1fdf105fc08f593abc4608d2417a22029e3ed68')
sha512sums=('f94a6d7c308a0dd6393928ab5a8dd84518ea911685f62e4be9b9ff5305e75d12cfd5c36f77bf59a85daed23a85618ebc3e89b806332ca92041d411506df48c61')
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
