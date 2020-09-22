# Maintainer: Sampson Crowley <sampsonsprojects@gmail.com>
# Contributor: Rhys Kenwell <redrield+aur@gmail.com>
# Github Contributor: Michael Herold <https://github.com/michaelherold>

pkgname=heroku-cli
pkgver=7.43.2
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
sha256sums=('b9884a5d6ea653221adbc888890b642e63681cb2937a1343a99d36934f0d5909')
sha512sums=('d1e6e93b471613331f6bc19bcb1230b582d71a99bf4d94bbf20a25ace0f289a3858095d0f5ec3511385db7a30011fb61ae597cc5ee320a54739bc297e3e47f66')
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
