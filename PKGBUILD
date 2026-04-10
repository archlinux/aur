# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=drill-search
pkgver=46
pkgrel=1
epoch=1
pkgdesc="Very fast file searcher without indexing"
arch=('any')
url="https://drill.software"
license=('GPL-2.0-or-later')
depends=(
  'python-pyqt6'
  'python-sortedcontainers'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest-qt'
#  'python-sortedcontainers-stubs'  ## TODO
)
conflicts=("$pkgname-cli" "$pkgname-gtk")
source=("Drill-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz"
        'drill.sh'
        'drill.desktop')
sha256sums=('bbd317dcc507dfd392cba90d1b6787dc1f63d87baeffa04d681b2e85fe85a5e2'
            '255aec49f9d963f712313474a17eb6225c4da0ecbdf0a7c2eae178272224fb6c'
            '6f3aeb8c5b0a61cf8e7ca419879885e7fb901abc3fbd601d3a267fb1b42cc988')

prepare() {
  cd "Drill-release-$pkgver"

  # Correct module name
  rm -rf drill
  mv -f src drill
  sed -i 's/packages = \["src"\]/packages = \["drill"\]/g' pyproject.toml
}

build() {
  cd "Drill-release-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

#check() {
#  cd "Drill-release-$pkgver"
#  pytest
#}

package() {
  cd "Drill-release-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm644 drill/assets/{roots_linux,wordsalpha}.txt -t \
    "${pkgdir}${site_packages}/drill/assets/"
  install -Dm644 drill/assets/drill.svg -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm755 "$srcdir/drill.sh" "$pkgdir/usr/bin/drill"
  install -Dm644 "$srcdir/drill.desktop" -t "$pkgdir/usr/share/applications/"
}
