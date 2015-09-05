# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=swagger-editor-git
pkgver=20150904
pkgrel=1
pkgdesc="Swagger Editor"
arch=('i686' 'x86_64')
depends=('darkhttpd' 'nodejs')
makedepends=('git' 'nodejs-bower' 'nodejs-grunt-cli' 'npm')
url="https://github.com/swagger-api/swagger-editor"
license=('Apache')
source=(git+https://github.com/swagger-api/swagger-editor
        swagger-editor.service)
sha256sums=('SKIP'
            '8988d97fe76124e0563c80842e0b7841b8fe3c24ca0c66c55af22b12746c5a34')
provides=('swagger-editor')
conflicts=('swagger-editor')
options=('!strip')
install=swagger-editor.install

pkgver() {
  cd ${pkgname%%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%%-git}

  msg2 'Fetching NPM dependencies...'
  npm install --python=python2

  msg2 'Fetching Web assets...'
  bower install --allow-root --config.interactive=false

  msg2 'Compiling Web assets...'
  grunt build
}

package() {
  cd ${pkgname%%-git}

  msg2 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/swagger-editor/README.md"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/swagger-editor"
  find . -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/swagger-editor" \;

  msg2 'Installing swagger-editor.service...'
  install -Dm 644 "$srcdir/swagger-editor.service" \
    "$pkgdir/usr/lib/systemd/system/swagger-editor.service"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
