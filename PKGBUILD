# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Github Contributor: ahmubashir <https://github.com/amubashir>

pkgname=heroku-cli-bin
pkgver=7.51.0
pkgrel=1
_builddir=cli-$pkgver-$pkgrel
pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/SampsonCrowley/heroku-cli-bin/raw/v$pkgver-$pkgrel/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
sha256sums=('e09a29b7321348006f094a7bac557540bfb51f9c30f6fa456b3567f52c9864c9')
sha512sums=('306f7c1ef80cb2802eeff12fbf5682a2ffa31bc3bd86d3b171f169f0b875f14f88f3075176d2c9601e565d1da110f4cc389b77bcd63def160974ed07d078c74e')
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
    case $foundherokufile in
         (*/plugin-autocomplete/autocomplete/bash/*.bash)
              _complete_target="${foundherokufile##*/}"
              install -Dm644 "$foundherokufile" "$pkgdir/usr/share/bash-completion/completions/${_complete_target%.*}"
              unset _complete_target;;
         (*/plugin-autocomplete/autocomplete/zsh/_*)
              install -Dm644 "$foundherokufile" "$pkgdir/usr/share/zsh/site-functions/${foundherokufile##*/}";;
     esac
  done

  ln -sf "../../../lib/heroku/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "../../lib/heroku/bin/run" "$pkgdir/usr/bin/heroku"
}
