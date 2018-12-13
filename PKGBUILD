pkgname=dokku
pkgver=0.13.3
pkgrel=1
pkgdesc="Docker powered mini-Heroku in around 100 lines of Bash."
arch=(any)
url="https://github.com/dokku/dokku"
license=(MIT)
depends=(
  'bind-tools'
  'docker'
  'gliderlabs-sigil'
  'herokuish'
  'net-tools'
  'nginx'
  'plugn'
  'rsyslog'
  'sshcommand'
)
source=(
  "https://github.com/dokku/dokku/archive/v$pkgver.zip"
  "$pkgname.install"
)
sha256sums=('36531c453c248572c42fe13688809fca67be435f4f6209056f90625be26337f5'
            '65175269313c2afcabec038d3994d940b7e60db91be270da11bfefc3febb9452')
install="$pkgname.install"

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install executable
  install -Dm755 dokku "$pkgdir/usr/bin/dokku"

  # Build go plugins
  make go-build

  # Move all files in place
  mkdir -p "$pkgdir/var/lib/dokku/core-plugins/available"
  cp -r plugins/* "$pkgdir/var/lib/dokku/core-plugins/available"
  cp common.mk "$pkgdir/var/lib/dokku/core-plugins/common.mk"

  find plugins/ -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | while read plugin; do
    # Clean plugins
    cd "$pkgdir/var/lib/dokku/core-plugins/available/$plugin"
    if [ -e Makefile ]; then make src-clean ;fi

    touch "$pkgdir/var/lib/dokku/core-plugins/available/$plugin/.core"
  done
  rm "$pkgdir/var/lib/dokku/core-plugins/common.mk"

  # Version
  echo $pkgver > "$pkgdir/var/lib/dokku/VERSION"
}
