# Maintainer: Ayush Agarwal <ayushnix at fastmail dot com>
# Contributor: Ben Oliver <ben at bfoliver dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
# Contributor: John Jenkins <twodopeshaggy at gmail dot com>
# Contributor: Julian Paul Dasmarinas <julian.dasma at gmail dot com>

pkgname=buku
pkgver=4.8
pkgrel=3
pkgdesc="Bookmark manager like a text-based mini-web"
arch=('any')
url="https://github.com/jarun/buku"
license=('GPL3')
depends=('ca-certificates'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-html5lib'
  'python-urllib3')
makedepends=('python-setuptools')
optdepends=('wl-clipboard: to copy text in wayland'
  'xsel: to copy text in xorg'
  'xclip: to copy text in xorg')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a0b94210e80e9f9f359e5308323837d41781cf8dba497341099d5c59e27fa52c')

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -f "$pkgdir"/usr/bin/bukuserver
  rm -rf "$pkgdir/$site_packages"/bukuserver
  gzip -f buku.1

  install -Dm644 auto-completion/fish/buku.fish "${pkgdir}/usr/share/fish/vendor_completions.d/buku.fish"
  install -Dm644 auto-completion/bash/buku-completion.bash "${pkgdir}/usr/share/bash-completion/completions/buku"
  install -Dm644 auto-completion/zsh/_buku "${pkgdir}/usr/share/zsh/site-functions/_buku"
  install -Dm644 buku.1.gz "${pkgdir}/usr/share/man/man1/buku.1.gz"
}
