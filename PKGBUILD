# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=drill-search
pkgver=85
pkgrel=3
epoch=1
pkgdesc="Very fast file searcher without indexing"
arch=('any')
url="https://drill.software"
license=('GPL-2.0-only')
depends=('python-pyqt6')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
#  'pyright'
  'python-pytest'
#  'python-pytest-qt'
)
conflicts=("$pkgname-cli" "$pkgname-gtk")
source=("Drill-$pkgver.tar.gz::https://github.com/yatima1460/Drill/archive/refs/tags/release-$pkgver.tar.gz"
        'drill.sh'
        'drill.desktop')
sha256sums=('20ba1961bdb87189a4ba8de6f45f2f1ae63244d6f273739eb0c1023d26086c74'
            '255aec49f9d963f712313474a17eb6225c4da0ecbdf0a7c2eae178272224fb6c'
            '678f996d401540eeec0ea2b010e462f7fb6bbd2e5fedfaa3aad96c866ff8643f')

prepare() {
  cd "Drill-release-$pkgver"

  # Correct module name
  rm -rf drill
  mv -f src drill
  sed -i 's/packages = \["src"\]/packages = \["drill"\]/g' pyproject.toml
}

build() {
  cd "Drill-release-$pkgver"
  python -m build --skip-dependency-check --wheel --no-isolation
}

check() {
  cd "Drill-release-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH=drill/ test-env/bin/python -P -s -m pytest -k 'not test_window'
}

package() {
  cd "Drill-release-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm644 drill/assets/{roots_linux,wordsalpha}.txt -t \
    "${pkgdir}${site_packages}/drill/assets/"
  install -Dm644 drill/assets/drill.svg -t \
    "${pkgdir}${site_packages}/drill/assets/"

  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  ln -s "/${site_packages}/drill/assets/drill.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  install -Dm755 "$srcdir/drill.sh" "$pkgdir/usr/bin/drill"
  install -Dm644 "$srcdir/drill.desktop" -t "$pkgdir/usr/share/applications/"
}
