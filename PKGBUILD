# Maintainer: Bill Sideris <bill88t@feline.gr>
pkgname=gpmaster
pkgver=1.5.1
pkgrel=1
pkgdesc="GPG-backed lockbox for secrets management"
arch=('any')
url="https://github.com/bill88t/gpmaster"
license=('GPL3')
depends=('python>=3.8' 'python-gnupg' 'gnupg' 'python-cryptography')
optdepends=('python-pyotp')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/bill88t/gpmaster/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('3bff2f897095eb07e2077df67482de49e5c9bc4feea87757ec5952b34234e2ab')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install gpmaster-agent executable
    install -Dm755 packaging/gpmaster-agent "$pkgdir/usr/bin/gpmaster-agent"

    # Install systemd user unit
    install -Dm644 packaging/gpmaster-agent.service "$pkgdir/usr/lib/systemd/user/gpmaster-agent.service"

    # Install okc-gpg wrapper (filters out --no-tty)
    install -Dm755 packaging/gpg-wrap "$pkgdir/usr/lib/gpmaster/gpg-wrap"

    # Install bash completion
    install -Dm644 gpmaster-completion.bash "$pkgdir/usr/share/bash-completion/completions/gpmaster"

    # Install license if available
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
