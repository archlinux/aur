# Maintainer: Sumith Emmadi <sumithemmadi244@gmail.com>

pkgname=beefproject-git
_pkgname=beef
pkgver=v0.5.1.0.r271.g7b948b8d
pkgrel=1
epoch=1
pkgdesc='The Browser Exploitation Framework that focuses on the web browser.'
arch=('any')
url='http://beefproject.com/'
install="$pkgname.install"
license=('Apache')
makedepends=('git')
depends=('git' 'ruby' 'ruby-bundler' 'sqlite' 'python' 'libxslt' 'nodejs' 'ruby-eventmachine')
conflicts=('beef' 'beef-git' 'beef-xss' 'beefproject')
source=("git+https://github.com/beefproject/beef.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$_pkgname"

  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/opt/$_pkgname"

  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname" README.md VERSION INSTALL.txt
  install -Dm 644 doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm -rf doc README.md VERSION INSTALL.txt install

  cp -a * "$pkgdir/opt/$_pkgname/"

  cat >"$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
cd /opt/$_pkgname
exec ruby $_pkgname "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/$_pkgname"
}
