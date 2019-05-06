# Maintainer: Vladimir Svyatski <vsvyatski@yandex.ru>

pkgname=kmeldb-ui
pkgver=0.4.0
pkgrel=1
pkgdesc='Kenwood Music Editor Light replacement for Linux systems.'
arch=('any')
url="https://vsvyatski.github.io/kmeldb-ui"
license=('GPL3')
depends=('python-pyqt5>=5.5.0')
optdepends=('qt5-translations>=5.5.0')
makedepends=('rsync' 'python' 'python-wheel')
source=("https://github.com/vsvyatski/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b664be402a409089123fc6caa95b265737b2bae2822428cf327e87ac3679eebd')
install=install-actions.sh

build() {
    cd "$pkgname-$pkgver"
    sh build.sh
    echo Generating virtual environment...
    python3 -m venv --system-site-packages dist/kmeldb-ui/venv
    dist/kmeldb-ui/venv/bin/pip3 install -r dist/kmeldb-ui/requirements.txt
}

check() {
    # Let's quickly verify if the contents of the "dist" folder after building look fine.
    set -e

    cd "$pkgname-$pkgver"
    test -d dist/kmeldb-ui

    cd dist/kmeldb-ui
    test -d kmeldb_cli -a -d translations -a -d venv
    test $(find -maxdepth 1 -type f -name "*.py" | wc -l) = 11
    test $(find -maxdepth 1 -type f -name "*.sh" | wc -l) = 2
    test -f kenwooddbgen.png
    test -f LICENSE -a -f requirements.txt
}

package() {
    cd "$pkgname-$pkgver"
    mkdir "$pkgdir/opt" && cp -r dist/kmeldb-ui "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/share/applications/" && cp packaging/com.github.vsvyatski.kmeldb-ui.desktop "$pkgdir/usr/share/applications"
}
