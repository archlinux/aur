# Maintainer: AnonymerNiklasistanonym <niklas.mikeler@gmail.com>
pkgname=marktex
pkgver=1.0.1
pkgrel=6
pkgdesc='Web service for files that support advanced Markdown commands mixed with LaTeX sections'
arch=('x86_64')
url='https://github.com/AnonymerNiklasistanonym/MarkTeX'
license=('MIT')
depends=('nodejs' 'inkscape' 'pandoc' 'texlive-core')
makedepends=('node-prune')
provides=("$pkgname")
conflicts=("$pkgname")
_gitname="$pkgname.git"
source=("$_gitname::git+$url#branch=master")
sha1sums=('SKIP')

build() {
  cd "$_gitname" || exit 1
  npm install
  npm run build
  # Remove dev depdencies and only install production depdencies for deployment
  rm -rf node_modules
  npm install --only=production
  # Remove unnecessary files from node_modules
  node-prune
}

package() {
  cd "$_gitname" || exit 1
  install -Dd "$pkgdir/opt/$pkgname"
  find node_modules -exec install -D {} "$pkgdir/opt/$pkgname/"{} \;
  find dist -exec install -D {} "$pkgdir/opt/$pkgname/"{} \;

  echo -e "\
#!/usr/bin/env bash\n\
mkdir -p \"\$HOME/.$pkgname\"\n\
export DATABASE_PATH=\"\${DATABASE_PATH:-\$HOME/.$pkgname/database.db}\"\n\
cd \"/opt/$pkgname\"\n\
node dist/index.js \$@\n" > "$pkgname"

  install -Dd "$pkgdir/usr/bin"
  install -Dm 777 "$pkgname" "$pkgdir/usr/bin"
}
