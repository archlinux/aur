# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=wavelog
pkgver=3.1.0
pkgrel=2
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
sha256sums=('4fad6e852ec0fe03cf8a14e8eb1977222c872e8307d81cdd3987fb6aee7986b5'
            '329d52839b7a46bb91742327941d809a5e416a618c7427aa774e737f2e9c6439'
            '8b91e5fc08206075ee2ec794295c3038904cc547d2f01de9df0da2df257b1566'
            '0612d8d873a5fe50e55e7a055956e10d48d25d5b83db751c121c8615fc372539'
            'b4c7f35c30f7598e369bc5b192623e24363b12a8e3ee06a72a0b6f2929b09f1d')

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
    
    # Move writable directories from /usr/share to /var/lib, /var/log, /var/cache
    # PHP-FPM runs with ProtectSystem=full, preventing writes to /usr, /boot, /efi
    # All runtime-generated files (config, uploads, cache, logs) must be in /var
    
    # Define directory relocations as "source:target" pairs
    local _relocations=(
        "application/config:var/lib/$pkgname/config"
        "uploads:var/lib/$pkgname/uploads"
        "backup:var/lib/$pkgname/backup"
        "userdata:var/lib/$pkgname/userdata"
        "updates:var/lib/$pkgname/updates"
        "application/logs:var/log/$pkgname"
        "application/cache:var/cache/$pkgname"
        "images/eqsl_card_images:var/lib/$pkgname/eqsl_card_images"
    )
    
    # Process relocations
    local _reloc _src _target _target_dir
    for _reloc in "${_relocations[@]}"; do
        _src="$pkgdir/usr/share/webapps/$pkgname/${_reloc%%:*}"
        _target="$pkgdir/${_reloc##*:}"
        _target_dir="$(dirname "$_target")"
        
        install -dm755 "$_target_dir"
        mv "$_src" "$_target"
        ln -s "/${_reloc##*:}" "$_src"
    done
    
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
