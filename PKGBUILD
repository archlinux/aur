# Maintainer: Andrew <itspixelatd@proton.me>
pkgname=cpustate
pkgver=0.1.3
pkgrel=1
pkgdesc="Persist CPU power settings (governor, EPP, ryzenadj) across boot and sleep"
arch=('any')
url="https://github.com/pixelated11/cpustate"
license=('GPL-3.0')
depends=('python')
optdepends=('ryzenadj: TDP and power limit control for AMD Ryzen laptops')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m compileall cpustate/
}

package() {
    cd "$pkgname-$pkgver"

    # Install Python package manually
    local pyver=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    local sitepkg="$pkgdir/usr/lib/python$pyver/site-packages/cpustate"
    install -dm755 "$sitepkg"
    install -Dm644 cpustate/*.py -t "$sitepkg"

    # Entry point wrapper script
    install -Dm755 bin/cpustate "$pkgdir/usr/bin/cpustate"

    # systemd service
    install -Dm644 systemd/cpustate.service \
        "$pkgdir/usr/lib/systemd/system/cpustate.service"

    # sleep hook
    install -Dm755 systemd/cpustate-sleep.sh \
        "$pkgdir/usr/lib/systemd/system-sleep/cpustate"

    # example config
    install -Dm644 config/cpustate.conf \
        "$pkgdir/etc/cpustate.conf"

    # license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
