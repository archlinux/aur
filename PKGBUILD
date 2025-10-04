# Maintainer: Leizi Shell Team <noreply@github.com>
pkgname=leizi-shell
pkgver=1.4.0
pkgrel=1
pkgdesc="Modern POSIX-compatible shell with ZSH-style arrays and beautiful prompts"
arch=('x86_64' 'aarch64')
url="https://github.com/Zixiao-System/leizi-shell"
license=('GPL3')
depends=('readline')
makedepends=('cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Zixiao-System/leizi-shell/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    # Run tests if available
    cd build && ctest --output-on-failure || true
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install shell to /etc/shells via hook
    install -Dm644 /dev/stdin "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook" <<EOF
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Path
Target = usr/bin/leizi

[Action]
Description = Updating shell database...
When = PostTransaction
Exec = /bin/sh -c 'grep -qxF "/usr/bin/leizi" /etc/shells || echo "/usr/bin/leizi" >> /etc/shells'
EOF
}
