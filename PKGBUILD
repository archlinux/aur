# Maintainer: Senya <senya@riseup.net>
# Contributor: Jonian Guveli <https://github.com/jonian/>
pkgname=devdocsgjs-git
pkgver=r2928.ac8ae363
pkgrel=1
pkgdesc="API Documentation Browser (with GJS/GIR support)"
arch=("any")
url="https://gitlab.gnome.org/GNOME/devdocsgjs"
license=("MPL")
depends=("ruby" "ruby-bundler" "curl" "nodejs" "coffee-script")
makedepends=("git")
provides=("devdocs-git")
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/devdocsgjs.git#branch=gnome"
         "devdocs-server.sh"
         "devdocs-cli.sh"
         "devdocs.service"
         "0001-Don-t-require-pry-by-default.patch")
md5sums=('SKIP'
         '6f2d514aa412c9b4d0165d35aaa48544'
         'd4a2ceec03f265cc60f3091b30eced5c'
         '2ef3b5bc9519e6929355d49063c1132c'
         'ef9bece544b2f2e713e54479257d4c82')

install=devdocsgjs-git.install

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 --forward --strip=1 --input="${srcdir}/0001-Don-t-require-pry-by-default.patch"
}

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
  cp "$srcdir/devdocs.service" "$pkgdir/usr/lib/systemd/system/devdocsgjs.service"

  ln -s "/opt/$pkgname/devdocs-server.sh" "$pkgdir/usr/bin/devdocsgjs-server"
  ln -s "/opt/$pkgname/devdocs-cli.sh" "$pkgdir/usr/bin/devdocsgjs-cli"

  mkdir -p "$pkgdir/opt/$pkgname/tmp"

  chown -R http:wheel "$pkgdir/opt/$pkgname/public"
  chown -R http:wheel "$pkgdir/opt/$pkgname/tmp"

  chmod -R g+w "$pkgdir/opt/$pkgname/public"
  chmod -R g+w "$pkgdir/opt/$pkgname/tmp"

  env -iC "$pkgdir/opt/$pkgname" sh -lc "bundle install --path .bundle"
  env -iC "$pkgdir/opt/$pkgname" sh -lc "bundle exec thor assets:clean && bundle exec thor assets:compile"
}
