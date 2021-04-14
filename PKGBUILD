# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : stoneo


pkgname=rdcli-git
_name="${pkgname%-git}"

pkgver() {
  cd "$_name"
  printf '%s.r%s.%s' \
    "$(git tag -l | grep -P '.+\..+\.\d+' | sed -r 's/v?([0-9\.]+)(-.+)?/\1/g' | sort -Vr | sed 1q)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=1.5.1.r121.d7b64c1
pkgrel=3

pkgdesc='Simple CLI tool to unrestrict links with real-debrid.com'
arch=('any')
url="https://github.com/stoneo/$_name"
license=('GPL3')

provides=("$_name")
conflicts=("$_name")

makedepends=('git' 'npm' 'jq')
depends=('nodejs')

source=("git+$url.git")
sha256sums=('SKIP')


package() {
  cd "$_name"
  npm install -g --prefix "$pkgdir/usr" "$_name"

  # Npm gives ownership of ALL FILES to build user
  chown -R root:root "$pkgdir"

  # Remove references to $pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i "/_where/d;s|$pkgdir||g"

  # Remove references to $srcdir
  cd "$pkgdir/usr/lib/node_modules/$_name"
  jq '.|=with_entries(select(.key|test("_.+")|not))' <package.json |
    install -m644 /dev/stdin package.json
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
