# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=wavelog
pkgver=2.3
pkgrel=1
pkgdesc="Web-based amateur radio logging software - log your contacts from everywhere"
arch=('any')
url="https://www.wavelog.org/"
license=('MIT')
depends=(
    'php'
    'php-gd'
)
optdepends=(
    'mariadb: database backend for Wavelog'
    'mysql: alternative database backend'
    'apache: web server to run Wavelog'
    'nginx: alternative web server'
    'php-fpm: for nginx deployment'
    'php-redis: Redis caching support'
    'php-apcu: APCu caching support'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/wavelog/wavelog/archive/refs/tags/$pkgver.tar.gz"
        'apache.example.conf'
        'nginx.example.conf'
        'wavelog.tmpfiles'
        'fix-install-lock-path.patch')
sha256sums=('b48b55b5ea2aa115926b2a13f2bac7106ad3c50ae9976d19fdcef7bfcc3076da'
            '329d52839b7a46bb91742327941d809a5e416a618c7427aa774e737f2e9c6439'
            '8b91e5fc08206075ee2ec794295c3038904cc547d2f01de9df0da2df257b1566'
            '0612d8d873a5fe50e55e7a055956e10d48d25d5b83db751c121c8615fc372539'
            '736a906df636e08e9efc9cbcf5f9d0e5d90d124c13d50b0fecfb1371557044f1')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Apply patch to fix installer lock path
    # PHP-FPM runs with ProtectSystem=full (read-only /usr, /boot, /efi)
    # Installer must write lock file to /var/lib instead of /usr/share
    patch -Np1 -i "$srcdir/fix-install-lock-path.patch"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install application files
    install -dm755 "$pkgdir/usr/share/webapps/$pkgname"
    cp -r * "$pkgdir/usr/share/webapps/$pkgname/"
    
    # Move writable directories from /usr/share to /var/lib
    # PHP-FPM runs with ProtectSystem=full, preventing writes to /usr, /boot, /efi
    # All runtime-generated files (config, uploads, cache) must be in /var
    install -dm755 "$pkgdir/var/lib/$pkgname"
    mv "$pkgdir/usr/share/webapps/$pkgname/application/config" "$pkgdir/var/lib/$pkgname/config"
    
    # Remove other writable directories (will be created via tmpfiles.d)
    
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/uploads"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/backup"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/userdata"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/updates"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/application/logs"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/application/cache"
    rm -rf "$pkgdir/usr/share/webapps/$pkgname/images/eqsl_card_images"
    
    # Symlink writable directories to /var/lib and /var/cache (created by tmpfiles.d)
    # Note: actual directories will be created by systemd-tmpfiles on first boot/install
    ln -s "/var/lib/$pkgname/uploads" "$pkgdir/usr/share/webapps/$pkgname/uploads"
    ln -s "/var/lib/$pkgname/backup" "$pkgdir/usr/share/webapps/$pkgname/backup"
    ln -s "/var/lib/$pkgname/userdata" "$pkgdir/usr/share/webapps/$pkgname/userdata"
    ln -s "/var/lib/$pkgname/updates" "$pkgdir/usr/share/webapps/$pkgname/updates"
    ln -s "/var/log/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/application/logs"
    ln -s "/var/cache/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/application/cache"
    ln -s "/var/lib/$pkgname/eqsl_card_images" "$pkgdir/usr/share/webapps/$pkgname/images/eqsl_card_images"
    
    # Create symlink from application/config to /var/lib/wavelog/config
    # Config must be in /var/lib (not /etc/webapps) because PHP-FPM's ProtectSystem=full
    # prevents writes to /etc, and the installer generates config files dynamically
    ln -s "/var/lib/$pkgname/config" "$pkgdir/usr/share/webapps/$pkgname/application/config"
    
    # Note: config.php and database.php will be created by the web-based installer
    # Users should NOT manually copy sample configs before running the installer
    
    # Install systemd-tmpfiles configuration
    install -Dm644 "$srcdir/$pkgname.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
    
    # Install example web server configurations to docs
    install -Dm644 "$srcdir/apache.example.conf" \
        "$pkgdir/usr/share/doc/$pkgname/apache.example.conf"
    install -Dm644 "$srcdir/nginx.example.conf" \
        "$pkgdir/usr/share/doc/$pkgname/nginx.example.conf"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
