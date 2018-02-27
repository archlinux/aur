# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=devdocs-git
pkgver=r1033.ddf87bb
pkgrel=2
pkgdesc="API Documentation Browser"
arch=("any")
url="http://devdocs.io"
license=("MPL")
depends=("ruby" "ruby-bundler" "curl" "nodejs" "coffee-script")
makedepends=("git")
provides=("devdocs-git")
source=("$pkgname::git+https://github.com/Thibaut/devdocs" "devdocs-server.sh" "devdocs-cli.sh" "devdocs.service")
md5sums=("SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed "s/\([^-]*-g\)/r\1/;s/-/./g" ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/systemd/system"

  cp -a "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"
  sed -i "/ruby /d" "$pkgdir/opt/$pkgname/Gemfile"

  cp "$srcdir/devdocs-server.sh" "$pkgdir/opt/$pkgname/devdocs-server.sh"
  cp "$srcdir/devdocs-cli.sh" "$pkgdir/opt/$pkgname/devdocs-cli.sh"
  cp "$srcdir/devdocs.service" "$pkgdir/usr/lib/systemd/system/devdocs.service"

  ln -s "/opt/$pkgname/devdocs-server.sh" "$pkgdir/usr/bin/devdocs-server"
  ln -s "/opt/$pkgname/devdocs-cli.sh" "$pkgdir/usr/bin/devdocs-cli"

  mkdir -p "$pkgdir/opt/$pkgname/tmp"

  chown -R http:wheel "$pkgdir/opt/$pkgname/public"
  chown -R http:wheel "$pkgdir/opt/$pkgname/tmp"

  chmod -R g+w "$pkgdir/opt/$pkgname/public"
  chmod -R g+w "$pkgdir/opt/$pkgname/tmp"

  cd "$pkgdir/opt/$pkgname" && bundle install --path .bundle
  cd "$pkgdir/opt/$pkgname" && bundle exec thor assets:clean && bundle exec thor assets:compile
}
