# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=devdocs-git
pkgver=r1002.de1c879
pkgrel=1
pkgdesc="API Documentation Browser"
arch=('any')
url="http://devdocs.io"
license=('GPL')
groups=()
depends=('ruby' 'ruby-bundler' 'curl' 'nodejs' 'coffee-script')
makedepends=('git')
optdepends=()
provides=('devdocs-git')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname::git+https://github.com/Thibaut/devdocs devdocs-server devdocs-cli devdocs.service)
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/systemd/system"

  cp -a "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"
  sed -i "/ruby /d" "$pkgdir/opt/$pkgname/Gemfile"
  
  cp -a "$srcdir/devdocs-server" "$pkgdir/usr/bin/devdocs-server"
  cp -a "$srcdir/devdocs-cli" "$pkgdir/usr/bin/devdocs-cli"
  cp -a "$srcdir/devdocs.service" "$pkgdir/usr/lib/systemd/system/devdocs.service"
  
  cd "$pkgdir/opt/$pkgname" && bundle install --path .bundle
  cd "$pkgdir/opt/$pkgname" && thor assets:clean && thor assets:compile
  
  mkdir -p "$pkgdir/opt/$pkgname/tmp"
  
  chown -R http:wheel "$pkgdir/opt/$pkgname/public"
  chown -R http:wheel "$pkgdir/opt/$pkgname/tmp"
  
  chmod -R g+w "$pkgdir/opt/$pkgname/public"
  chmod -R g+w "$pkgdir/opt/$pkgname/tmp"
}

