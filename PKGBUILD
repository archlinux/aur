# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\(alpha\)\([0-9]\+\)/\1_\2/'; }
pkgver=0.4.2.beta1.r0.1f3fc77
pkgrel=3

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$_name"
license=('GPL2')

provides=("$_name")
conflicts=("$_name")

makedepends=('git' 'python-setuptools')
depends=('python' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-cryptography'
         'python-pysocks' 'python-cffi')

changelog=CHANGELOG.md
backup=("etc/$_name/default.conf")
source=("git+$url.git")
sha256sums=('SKIP')


package() {
  cd "$_name"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$_name/"
  # hack to fix the default.conf file location
  local py_ver="$(python -V | sed 's/Python \(3\.[0-9]\+\).*/\1/')"
  install -dm755 "$pkgdir/etc/$_name"
  mv "$pkgdir/usr/lib/python$py_ver/site-packages/$_name/default.conf" "$pkgdir/etc/$_name/"
  ln -s "/etc/$_name/default.conf" "$pkgdir/usr/lib/python$py_ver/site-packages/$_name/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
