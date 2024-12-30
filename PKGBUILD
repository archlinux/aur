# Maintainer:

_pkgname="python-deadlib"
pkgname="$_pkgname"
pkgdesc='Python standard library redistribution, "dead batteries"'
pkgver=3.13.0
pkgrel=2
url="https://github.com/youknowone/python-deadlib"
license=('PSF-2.0')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python-audioop: used by aifc module' # AUR
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('bde43692d5a1de2a33777ff99f4c4344f7cca3a49362b2484a13870706194613')

_modules=(
  aifc
  asynchat
  asyncore
  cgi
  cgitb
  chunk
  crypt
  imghdr
  mailcap
  nntplib
  pipes
  smtpd
  sndhdr
  sunau
  telnetlib
  uu
  xdrlib
)

for i in ${_modules[@]}; do
  provides+=(
    "python-$i"
    "python-standard-$i"
  )
  conflicts+=(
    "python-$i"
    "python-standard-$i"
  )
done

build() {
  for i in ${_modules[@]}; do
    pushd "$_pkgsrc/$i"
    python -m build --wheel --no-isolation --skip-dependency-check
    python -m installer --destdir="$srcdir/fakeinstall" dist/*.whl
    popd
  done
}

package() {
  cp --reflink=auto -a fakeinstall/* "$pkgdir/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
