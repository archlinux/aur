# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=invoiceninja
pkgver=5.13.53
pkgrel=4
pkgdesc='Invoices, Expenses and Tasks built with Laravel and Flutter'
url='https://www.invoiceninja.com/'
license=('ELv2')
arch=('any')
depends=('php' 'php-gd')
makedepends=('git' 'composer' 'nodejs' 'npm' 'tar')
optdepends=(
  'mariadb: database'
  'apache: web server'
  'nginx: web server'
  'redis: session driver'
  'chromium: PDF generation using snappdf'
  'php-imagick: image processing'
  'invoiceninja-ui: React administration frontend'
)
backup=('etc/webapps/invoiceninja/config.env' 'var/lib/invoiceninja/config.env')
install="$pkgname.install"
options=('!strip')

source=(
  "$pkgname::git+https://github.com/invoiceninja/invoiceninja.git#tag=v${pkgver}"
  "$pkgname-queue.service"
  "$pkgname-queue.timer"
  "$pkgname-scheduler.service"
  "$pkgname-scheduler.timer"
)
sha256sums=(
  'SKIP'
  '2e41b2c94877d29f7abf8912d7bd9a26dd7d003876253c7d49762c6ec9f72ea5'
  'ed7ce9c42bf1de019c4ca43c1a7bfb32e65aae8c6687ce0e5a4474c7e4a7537e'
  'b54a95a349294c93a97832cc88652e46d30692c722906ef4bce99ef4d73e8d33'
  'a72270bdc4bb146cc00fe0162b8d366467eed96582f64a40ec6d8e2bd9a013ba'
)

prepare() {
  cd "$srcdir/$pkgname"

  # Never distribute the example APP_KEY: each installation must generate its own.
  cp .env.example config.env
  sed -i \
    -e 's|^APP_KEY=.*|APP_KEY=|' \
    -e 's|^PHANTOMJS_SECRET=.*|PHANTOMJS_SECRET=|' \
    -e 's|^UPDATE_SECRET=.*|UPDATE_SECRET=|' \
    config.env

  cat >> config.env <<'ADDITIONAL_ENV_VARIABLES'

# Use the system Chromium binary rather than downloading another copy.
SNAPPDF_SKIP_DOWNLOAD=true
SNAPPDF_EXECUTABLE_PATH=/usr/bin/chromium

# Keep user data outside /usr/share/webapps/invoiceninja.
FILESYSTEM_DISK=local

# Set unique APP_KEY, UPDATE_SECRET and other secrets before deployment.
# API_SECRET=
ADDITIONAL_ENV_VARIABLES
}

build() {
  local app="$srcdir/$pkgname"

  # Composer needs a temporary .env for Laravel's package discovery scripts.
  # It must never be included in the generated package.
  cd "$app"
  cp .env.example .env
  export COMPOSER_HOME="$srcdir/composer-home"
  export COMPOSER_CACHE_DIR="$srcdir/composer-cache"
  export SNAPPDF_SKIP_DOWNLOAD=true
  export SNAPPDF_EXECUTABLE_PATH=/usr/bin/chromium

  composer install --no-dev --prefer-dist --optimize-autoloader \
    --no-interaction --no-progress
  test -f vendor/autoload.php
  rm -f .env

  # React UI is packaged separately as invoiceninja-ui.

  # Build the Laravel frontend assets.
  cd "$app"
  HUSKY=0 npm install --no-audit --no-fund
  npm run production

  test -f public/build/manifest.json
  test -f vendor/autoload.php

  # No build-time dependencies or ephemeral environment file in the package.
  rm -rf node_modules
  rm -f .env
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/etc/webapps/$pkgname"
  install -d "$pkgdir/usr/share/webapps/$pkgname"
  # Keep .git, node_modules, and build-time .env files out of the package.
  cp -r -- * "$pkgdir/usr/share/webapps/$pkgname/"
  # Include Apache routing rules (normally omitted by a glob matching only '*').
  if [[ -f public/.htaccess ]]; then
    install -Dm644 public/.htaccess "$pkgdir/usr/share/webapps/$pkgname/public/.htaccess"
  fi
  # React UI owns this Blade template and the public/react subtree.
  rm -f "$pkgdir/usr/share/webapps/$pkgname/resources/views/react/index.blade.php"
  rm -rf "$pkgdir/usr/share/webapps/$pkgname/public/react"


  install -Dm600 config.env "$pkgdir/var/lib/$pkgname/config.env"
  chown http:http "$pkgdir/var/lib/$pkgname/config.env"
  ln -s "/var/lib/$pkgname/config.env" "$pkgdir/etc/webapps/$pkgname/config.env"
  ln -s "/var/lib/$pkgname/config.env" "$pkgdir/usr/share/webapps/$pkgname/.env"
  rm "$pkgdir/usr/share/webapps/$pkgname/config.env"

  install -d "$pkgdir/var/cache/"
  mv "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache" "$pkgdir/var/cache/$pkgname"
  ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/bootstrap/cache"
  chown -R http:http "$pkgdir/var/cache/$pkgname"
  chmod 750 "$pkgdir/var/cache/$pkgname"

  install -d "$pkgdir/var/lib/"
  mv "$pkgdir/usr/share/webapps/$pkgname/storage" "$pkgdir/var/lib/$pkgname"
  ln -s "/var/lib/$pkgname/storage" "$pkgdir/usr/share/webapps/$pkgname/storage"
  chown -R http:http "$pkgdir/var/lib/$pkgname"
  chmod 750 "$pkgdir/var/lib/$pkgname"

  install -Dm644 "$srcdir/$pkgname-queue.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname-queue.service"
  install -Dm644 "$srcdir/$pkgname-queue.timer" \
    "$pkgdir/usr/lib/systemd/system/$pkgname-queue.timer"
  install -Dm644 "$srcdir/$pkgname-scheduler.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname-scheduler.service"
  install -Dm644 "$srcdir/$pkgname-scheduler.timer" \
    "$pkgdir/usr/lib/systemd/system/$pkgname-scheduler.timer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
