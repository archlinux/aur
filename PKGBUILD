# Maintainer: AnonymerNiklasistanonym <niklas.mikeler@gmail.com>
pkgname=marktex
pkgver=1.0.0
pkgrel=1
pkgdesc='Web service for files that support advanced Markdown commands mixed with LaTeX sections'
arch=('x86_64')
url='https://github.com/AnonymerNiklasistanonym/MarkTeX'
license=('MIT')
depends=('nodejs' 'inkscape-git' 'pandoc' 'texlive-core')
provides=("$pkgname")
conflicts=("$pkgname")
_gitname="$pkgname.git"
source=("$_gitname::git+$url#branch=master")
sha1sums=('SKIP')

build() {
  cd "$_gitname"
  npm install
  npm run build
  rm -rf node_modules
  npm install --prod
}

package() {
  cd "$_gitname"
  install -Dd "$pkgdir/opt/$pkgname"
  find node_modules -exec install -D {} "$pkgdir/opt/$pkgname/"{} \;
  find dist -exec install -D {} "$pkgdir/opt/$pkgname/"{} \;

  echo "DATABASE_PATH=\"~/.$pkgname/database.db" > .env
  install -D .env "$pkgdir/opt/$pkgname/.env"

  echo -e "\
#!/usr/bin/env bash\n\
mkdir -p \"\$HOME/.$pkgname\"\n\
cd \"/opt/$pkgname\"\n\
node dist/index.js $@\n" > "$pkgname"

  install -Dd "$pkgdir/usr/bin"
  install -Dm 777 "$pkgname" "$pkgdir/usr/bin"
}
