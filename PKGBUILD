# Maintainer: Pierre Ayoub (Drack) <pierreay@proton.me>
# Contributor: Ayush Agarwal <ayush at ayushnix dot com>
# Contributor: Ben Oliver <ben at bfoliver dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>
# Contributor: Julian Paul Dasmarinas <julian.dasma at gmail dot com>

pkgname=buku
pkgver=5.1
pkgrel=1
pkgdesc="Bookmark manager like a text-based mini-web"
arch=('any')
url="https://github.com/jarun/buku"
license=('GPL3')
depends=('ca-certificates'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-html5lib'
  'python-urllib3')
makedepends=('python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel')
optdepends=('wl-clipboard: to copy text in wayland'
  'xsel: to copy text in xorg'
  'xclip: to copy text in xorg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f1a3e15f882fe9a0f8e550abae7388d3cb81d4718a1b4309dcf4363633cb7b1')

build() {
  cd $pkgname-$pkgver
  export PYTHONHASHSEED=0
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -f "$pkgdir/usr/bin/bukuserver"
  rm -rf "$pkgdir/$site_packages/bukuserver"
  gzip -f buku.1

  install -Dm644 auto-completion/fish/buku.fish "$pkgdir/usr/share/fish/vendor_completions.d/buku.fish"
  install -Dm644 auto-completion/bash/buku-completion.bash "$pkgdir/usr/share/bash-completion/completions/buku"
  install -Dm644 auto-completion/zsh/_buku "$pkgdir/usr/share/zsh/site-functions/_buku"
  install -Dm644 buku.1.gz "$pkgdir/usr/share/man/man1/buku.1.gz"
  install -Dm644 CHANGELOG "$pkgdir/usr/share/doc/buku/CHANGELOG"
  install -Dm644 README.md "$pkgdir/usr/share/doc/buku/README.md"
}
