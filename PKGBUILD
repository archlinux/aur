# Maintainer: Mikalai Barysevich <nick.barysevich@gmail.com>
pkgname=cleverswitch
pkgver=1.5.0
pkgrel=1
pkgdesc="Synchronize Logitech Easy-Switch host switching between keyboard and mouse"
arch=('any')
url="https://github.com/MikalaiBarysevich/CleverSwitch"
license=('GPL-3.0-or-later')
depends=('python' 'python-yaml' 'hidapi')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "cleverswitch.service")
sha256sums=('3af0a491b8fa6600dafc3e6cd47966418977af6b44046ccf19cd718a882095d5'
            '978f0bab35fd9289202571036e881ae52975c74a0178489d6686d005dd6d712a')

build() {
    cd "CleverSwitch-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "CleverSwitch-$pkgver"

    # Python package + `cleverswitch` entry point
    python -m installer --destdir="$pkgdir" dist/*.whl

    # udev rule — vendor dir so pacman fully owns its lifecycle
    install -Dm644 rules.d/42-cleverswitch.rules \
        "$pkgdir/usr/lib/udev/rules.d/42-cleverswitch.rules"

    # Opt-in autostart: `systemctl --user enable --now cleverswitch.service`
    install -Dm644 "$srcdir/cleverswitch.service" \
        "$pkgdir/usr/lib/systemd/user/cleverswitch.service"

    # License + example config
    install -Dm644 LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 config.example.yaml \
        "$pkgdir/usr/share/doc/$pkgname/config.example.yaml"
}
