# Maintainer: gardar <aur@gardar.net>

_pkgname=cc2538-bsl
pkgname=python-$_pkgname
pkgver=2.1.r87.gbb64711
pkgrel=1
pkgdesc="Script to communicate with Texas Instruments CC13xx/CC2538/CC26xx Serial Boot Loader."
arch=('any')
url="https://github.com/JelmerT/$_pkgname"
license=('BSD')
depends=('python-pyserial')
makedepends=('python-build' 'python-setuptools-scm' 'git' 'mandown')
optdepends=('python-magic' 'python-intelhex')
source=("git+https://github.com/JelmerT/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  mandown README.md > "$_pkgname.1"
  sed -n '/Copyright/,/ DAMAGE./p' "$_pkgname.py" > LICENSE
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
