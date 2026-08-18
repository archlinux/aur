# Maintainer: Kirara <kiraralarpsec@gmail.com>
pkgname=fpvtester
pkgver=2.1.0
pkgrel=1
pkgdesc="Automated Betaflight flight controller QC, inspection and configuration over MSP"
arch=('any')
url="https://github.com/kirarahoshiiii/fpv-tester"
license=('MIT')
depends=('python' 'python-pyserial')
optdepends=('tk: graphical interface via fpvtester-gui'
            'dfu-util: flashing firmware with --firmware')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('716693da5b6b4308f84b8ff0981aef008caef3ec35823b07a3db89ee8bd45561')

build() {
    cd "fpv-tester-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "fpv-tester-$pkgver"
    python tests/test_parser.py
}

package() {
    cd "fpv-tester-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 completions/fpvtester.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/fpvtester.fish"
    install -Dm644 completions/fpvtester.bash \
        "$pkgdir/usr/share/bash-completion/completions/fpvtester"
    install -Dm644 completions/_fpvtester \
        "$pkgdir/usr/share/zsh/site-functions/_fpvtester"
}
