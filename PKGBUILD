# Maintainer: dimflix <dimflix.official@gmail.com>
pkgname=tg-config
pkgver=1.0.1
pkgrel=1
pkgdesc="Declarative Telegram Desktop configuration via TOML config files - perfect for dotfiles and ricing"
arch=('any')
url="https://github.com/meowrch/tg-config"
license=('GPL-3.0')
depends=('python' 'python-cryptography')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=('telegram-desktop: Telegram messenger (will be automatically wrapped)')
install=tg-config.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ed96fae488157222b65ed7ef4c6c921d5cf1b95bc0e20e0ac33e0990482f7e7')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    /usr/bin/python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install Python package
    /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install Telegram wrapper script
    install -Dm755 usr/bin/tg-config-telegram-wrapper "$pkgdir/usr/bin/tg-config-telegram-wrapper"
    
    # Install alpm hook and script for telegram-desktop integration
    install -Dm644 usr/share/libalpm/hooks/tg-config-telegram.hook "$pkgdir/usr/share/libalpm/hooks/tg-config-telegram.hook"
    install -Dm755 usr/share/libalpm/scripts/tg-config-setup-wrapper "$pkgdir/usr/share/libalpm/scripts/tg-config-setup-wrapper"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
