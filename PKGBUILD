# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Github Contributor: ahmubashir <https://github.com/amubashir>

pkgname=heroku-cli-bin
pkgver=7.54.0
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
sha256sums=('a7f9bc32bf5c4c3a99ae4feef785c1fb9ced36d02998eae35742567df23100b9')
sha512sums=('e109014508cd45d6bd06cc644725cdcd53a2338397406614d493abebf30984adff45b5b300ab6c43cc8cb2b36f0046d81da493efc4a6dc60e8cb9368be80ec3c')
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
