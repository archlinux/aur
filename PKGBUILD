pkgname=dokku
pkgver=0.13.2
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
sha256sums=('e102ab0934d6675e6c31d2478ff3650ac949231e728512e672c71f663514e54c'
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
