# Maintainer: Luong The Minh Quang <luci at devel.faith>
_name=ttycast
pkgname="nodejs-$_name-git"
pkgdesc='Broadcast your tty to the world! Stream your live terminal session online'
pkgrel=1
pkgver=v0.4.0.r9.g8631416
arch=('x86_64')
url='http://me.dt.in.th/page/ttycast'
license=('Apache')
optdepends=('ttyrec' 'ovh-ttyrec')
makedepends=('npm' 'git' 'jq')
source=("git+https://github.com/dtinth/ttycast#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"
  npm pack
}

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_name/"*.tgz
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

  # Remove references to $srcdir
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_name/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
