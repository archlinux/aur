# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Github Contributor: ahmubashir <https://github.com/amubashir>

pkgname=heroku-cli-bin
pkgver=7.53.1
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
sha256sums=('7cc33badff585772969de0f6a15b8b9525f9677564ed88e42da3d77a0319691e')
sha512sums=('49d4da7944fa27416b9bcf19989b02114caf51934f3c539b83dd67964514d50aab51b27ea3cb0f7eea56e59ea03c30057362ee4a252f00d9130d5cff0ed0474a')
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

  # Remove empty directories
  find "${pkgdir}" -type d -empty -delete
}
