# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Michael Serajnik <m at mser dot at>

pkgname=patool-git
_pkgname=patool
pkgver=4.0.5.r7.gce1248b
pkgrel=1
pkgdesc="portable command line archive file manager (git checkout)"
arch=('any')
url="https://wummel.github.io/patool/"
license=('GPL-3.0-only')
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools-reproducible python-argcomplete)
optdepends=("lz4: extracting LZ4 archives"
    "p7zip: extracting ZIP and 7z files"
    "unarchiver: extracting various formats"
    "unrar: extracting RAR files")
provides=("patool")
conflicts=("patool")
source=("git+https://github.com/wummel/${_pkgname}.git")
sha256sums=("SKIP")


pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^dist\/patool-//;s/^upstream\///;s/^v//;s/\([^-]*-g\)/r\1/;s/-py2.py3-none-any.whl././g;s/-/./g'
}

build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  register-python-argcomplete patool > "${pkgdir}/usr/share/bash-completion/completions/patool"

  install -Dm644 'doc/patool.1' -t "${pkgdir}/usr/share/man/man1"
}
