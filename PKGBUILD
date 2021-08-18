# Contributor: Honghao Li <hh.li99@outlook.com>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=vcpkg-git
pkgver=2021.05.12.r575.g6b24f0fa76
pkgrel=1
pkgdesc='C++ library manager for Windows, Linux, and MacOS'
depends=('curl' 'zip' 'unzip')
makedepends=('git' 'cmake>=3.3.0' 'ninja')
optdepends=()
arch=('x86_64')
url='https://github.com/microsoft/vcpkg'
license=('MIT')
provides=('vcpkg')
conflicts=('vcpkg')
source=("$pkgname"::'git+https://github.com/microsoft/vcpkg'
        'vcpkg.sh'
        'vcpkg-git.install')
sha256sums=('SKIP'
            '8571fc5d24e62f448647a7d41ae2f3b64bce4ef0f51596f94b3ea92c3d2d2899'
            '928a5845d87a61bc0126d6ee860c832bb739e0d5f8a0d45641bfb76851076d1b')
install=${pkgname}.install

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

build() {
    "$srcdir/$pkgname/bootstrap-vcpkg.sh" -useSystemBinaries -disableMetrics
}

package() {
    # executable entry point
    install -Dm755 "$srcdir/vcpkg.sh" "$pkgdir/usr/bin/vcpkg"

    # vcpkg root
    install -Dm755 "$srcdir/$pkgname/vcpkg" "$pkgdir/usr/share/vcpkg/vcpkg"
    cp --preserve=mode -r \
        "$srcdir/$pkgname"/{docs,ports,scripts,triplets,.vcpkg-root} \
        "$pkgdir/usr/share/vcpkg/"

    # default downloads root directory
    install -dm1777 "$pkgdir/var/cache/vcpkg"

    # license
    install -Dm644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set sw=4 ts=4 et:
