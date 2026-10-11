# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=mocinha
pkgver=0.1.5
pkgrel=1
pkgdesc="Small, modular, platform-aware live-system installer (work in progress)"
arch=('any')
url="https://github.com/dani-77/mocinha"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'arch-install-scripts' 'util-linux'
         'e2fsprogs' 'dosfstools' 'squashfs-tools')
optdepends=(
  'polkit: start Mocinha from a desktop launcher (pkexec + the session polkit agent)'
  'sudo: start Mocinha from a terminal'
  'networkmanager: connect to networks from Mocinha (nmcli)'
  'iwd: connect to Wi-Fi from Mocinha (iwctl)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('08579972aa4a9f63ceb6edf402e94906aa2ad76fbcffacbad85752269b5f9046')

check() {
    cd "$pkgname-$pkgver"
    python -m unittest discover -s tests -q
}

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/usr/share/mocinha"
    cp -r mocinha bin assets examples "$pkgdir/usr/share/mocinha/"
    find "$pkgdir/usr/share/mocinha" -name '__pycache__' -prune -exec rm -rf {} +
    install -Dm755 packaging/common/mocinha.sh "$pkgdir/usr/bin/mocinha"
    install -Dm755 packaging/common/mocinha-root "$pkgdir/usr/lib/mocinha/mocinha-root"
    install -Dm644 packaging/common/org.mocinha.installer.policy \
        "$pkgdir/usr/share/polkit-1/actions/org.mocinha.installer.policy"
    install -Dm644 packaging/common/mocinha.desktop "$pkgdir/usr/share/applications/mocinha.desktop"
    install -Dm644 assets/mocinha-icon-256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/mocinha.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md STATUS.md docs/manifest-schema.md
}
