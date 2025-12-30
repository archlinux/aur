# Maintainer: Livaiyena <livaiyena@users.noreply.github.com>
pkgname=sessionmanager
pkgver=0.0.5
pkgrel=1
pkgdesc="cli-based activity tracker and session manager for hyprland"
arch=('any')
url="https://github.com/livaiyena/sessionmanager"
license=('GPL-3.0-or-later')
depends=('python' 'sqlite' 'hyprland')
optdepends=(
    'fish: fish shell completion support'
    'bash-completion: bash completion support'
    'zsh-completions: zsh completion support'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/livaiyena/sessionmanager/archive/v$pkgver.tar.gz")
sha256sums=('0005ae406f8176f6f6609bb3e8cc9b992829cb20e945a73785e07b4800e6d23a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # get python version
    local python_version=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
    local site_packages="$pkgdir/usr/lib/python${python_version}/site-packages/sessionmanager"
    
    # install main application
    install -Dm755 sessionmanager "$pkgdir/usr/bin/sessionmanager"
    
    # install python package
    install -dm755 "$site_packages"
    install -Dm644 src/sessionmanager/__init__.py "$site_packages/"
    install -Dm644 src/sessionmanager/config.py "$site_packages/"
    install -Dm644 src/sessionmanager/database.py "$site_packages/"
    install -Dm644 src/sessionmanager/monitor.py "$site_packages/"
    install -Dm644 src/sessionmanager/enforcer.py "$site_packages/"
    install -Dm644 src/sessionmanager/cli.py "$site_packages/"
    install -Dm644 src/sessionmanager/whitelist.py "$site_packages/"
    
    # install completions
    install -Dm644 completions/sessionmanager.bash "$pkgdir/usr/share/bash-completion/completions/sessionmanager"
    install -Dm644 completions/_sessionmanager "$pkgdir/usr/share/zsh/site-functions/_sessionmanager"
    install -Dm644 completions/sessionmanager.fish "$pkgdir/usr/share/fish/vendor_completions.d/sessionmanager.fish"
    
    # install systemd service
    install -Dm644 sessionmanager.service "$pkgdir/usr/lib/systemd/user/sessionmanager.service"
    
    # install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
