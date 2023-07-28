# Python package author: Daniel Kantor <git@daniel-kantor.com>
pkgname=python-seagoat
pkgver=0.6.1
pkgrel=1
pkgdesc="A semantic-code search engine"
arch=(any)
url="https://aur.archlinux.org/packages/python-seagoat"
license=(MIT)
makedepends=("python" "python-pip")
depends=(
    "python"
    "python-appdirs"
    "python-click"
    "python-pygments"
    "python-typing_extensions"
    "python-gitpython"
)

prepare() {
  python -m pip download --no-deps --no-binary :all: seagoat==$pkgver

  tar xvf seagoat-$pkgver.tar.gz
  cd seagoat-$pkgver
}

build() {
  cd seagoat-$pkgver

  python -m venv .env
  source .env/bin/activate
  python -m pip install .
}

package() {
  cd seagoat-$pkgver

  source .env/bin/activate

  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  sitepackages_dest="$pkgdir/$(python -c "import sys; print(sys.prefix)")/${sitepackages#/}"

  mkdir -p "$sitepackages_dest"

  cp -r "$sitepackages/"* "$sitepackages_dest"

  bindir_dest="$pkgdir/usr/bin"

  mkdir -p "$bindir_dest"

  install -Dm755 ".env/bin/gt" "$bindir_dest/gt"
  install -Dm755 ".env/bin/seagoat" "$bindir_dest/seagoat"
  install -Dm755 ".env/bin/seagoat-server" "$bindir_dest/seagoat-server"
}

