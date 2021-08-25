# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Github Contributor: ahmubashir <https://github.com/amubashir>

pkgname=heroku-cli-bin
pkgver=7.59.0
pkgrel=1
_commit_id="643e73442ec7568ed5bd5a59d86633aea2abf976"
_builddir="cli-$pkgver-$pkgrel"
pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/SampsonCrowley/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
sha256sums=('75d1ed9e0ae7d934e7e1954a1e044af43e864414590f8366b7f796afa725cfd7')
sha512sums=('5f64774fdb927e2926e4abf1bf280cba6800971d01397cc89dc78f86fb284d2873db0ac94a5d0cf5d4cafe5bff75af9645ef6ceb3439f858d2f59c457f38df00')
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
