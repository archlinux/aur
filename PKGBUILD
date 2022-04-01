# maintainer: anton \ät semjonov.de

pkgname="imapfetch-git"
_pkgname="${pkgname%-git}"
pkgdesc="Download all e-mails from an IMAP4 mailserver and store them locally in maildir format."

pkgver=v1.0.0.r0.geca6b92
pkgrel=1

arch=("any")
url="https://github.com/ansemjo/$_pkgname"
license=("MIT")

depends=("python" "python-imapclient")
makedepends=("git" "python-build" "python-installer")

provides=($_pkgname)
conflicts=($_pkgname)

source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m 644 "assets/muttrc"       -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -D -m 644 "assets/settings.cfg" -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -D -m 644 "README.md"           -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
