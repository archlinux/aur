# Maintainer: 9M2PJU
pkgname=meshbeacon
pkgver=1.0.1
pkgrel=1
pkgdesc="Offline-first incident operations for mesh-connected response teams."
arch=('any')
url="https://github.com/MeshBeacon/meshbeacon"
license=('Apache-2.0')
depends=('php' 'php-sqlite' 'mosquitto')
makedepends=('composer' 'npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MeshBeacon/meshbeacon/archive/refs/tags/v$pkgver.tar.gz"
        "meshbeacon-queue.service"
        "meshbeacon-mqtt.service"
        "meshbeacon-scheduler.service"
        "meshbeacon.sysusers"
        "meshbeacon.tmpfiles")
sha256sums=('8073ac3b2b2beb2703e0c8074cde9aa62d9cbcd415ae03b264799db49fb35224'
            '33aff1e5d1c24ffed64cd94801679266b856345d06829e80e186878f56322209'
            'a2e1ae9244e46b6109d13d469e7a6251f42f610da2b87388553108ed3ab6b5c8'
            '41239cacf7731b9b511b8eb492e2efeb0d93971015ea00f6f3851bc993b13ee8'
            '76dbb47a861c9a13475703b66c1b6e71f49da991974be3c257117d474a9d796b'
            'a391f50de57d371fc460f792b1e22840e91df2aa5846760d97ca9fbf7dd6523e')

backup=('usr/share/webapps/meshbeacon/.env')
install=meshbeacon.install

build() {
  cd "$pkgname-$pkgver"
  
  # Install PHP dependencies
  COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader --ignore-platform-reqs
  
  # Build frontend assets
  npm install --no-audit --no-fund
  npm run build
  
  # Publish Laravel vendor assets
  php artisan vendor:publish --tag=laravel-assets --ansi --force || true
  
  # Link flux-lite
  mkdir -p public/flux
  ln -sf ../../vendor/livewire/flux/dist/flux-lite.min.js public/flux/flux.js
  ln -sf ../../vendor/livewire/flux/dist/flux-lite.min.js public/flux/flux.min.js
}

package() {
  cd "$pkgname-$pkgver"
  
  # Create directories
  install -d "$pkgdir/usr/share/webapps/$pkgname"
  
  # Copy application files
  cp -a . "$pkgdir/usr/share/webapps/$pkgname/"
  
  # Remove files not needed in production
  rm -rf "$pkgdir/usr/share/webapps/$pkgname/node_modules"
  rm -rf "$pkgdir/usr/share/webapps/$pkgname/tests"
  
  # Provide default .env
  cp "$pkgdir/usr/share/webapps/$pkgname/.env.example" "$pkgdir/usr/share/webapps/$pkgname/.env"
  
  # Ensure sqlite database file exists for correct permissions
  touch "$pkgdir/usr/share/webapps/$pkgname/database/database.sqlite"
  
  # Systemd units
  install -Dm644 "$srcdir/meshbeacon-queue.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/meshbeacon-mqtt.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/meshbeacon-scheduler.service" -t "$pkgdir/usr/lib/systemd/system/"
  
  # Sysusers and tmpfiles
  install -Dm644 "$srcdir/meshbeacon.sysusers" "$pkgdir/usr/lib/sysusers.d/meshbeacon.conf"
  install -Dm644 "$srcdir/meshbeacon.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/meshbeacon.conf"
}
