# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

epoch=1
pkgver=0.4.2
pkgrel=3

pkgdesc='Web path scanner/fuzzer, written in Python'
arch=('any')
url="https://github.com/maurosoria/$pkgname"
license=('GPL2')

makedepends=('python-setuptools')
depends=('python' 'python-certifi' 'python-chardet' 'python-urllib3' 'python-cryptography'
         'python-pysocks' 'python-cffi')

changelog=CHANGELOG.md
backup=("etc/$pkgname/default.conf")
source=("$pkgname-$pkgver.tgz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d5109408a40d45b8324beb1abd7cae8fdd28a00fd54c57a86a7017eaea1d93f758524a05820e7f4f0c3342bdf61d0003be49f56693804992e920f52d218aad76')


prepare() {
  # refrain from trying to write logs/reports into the apps (readonly) folder
  sed -i '/report-ou\|logs-lo/s/^# *\([^=]*\)=.*/\1= ./' "$pkgname-$pkgver/default.conf"
}

package() {
  cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$pkgname/"
  # fix the default.conf file location
  local py_ver="$(python -V | sed 's/Python \(3\.[0-9]\+\).*/\1/')"
  cd "$pkgdir"
  install -dm755 "etc/$pkgname"
  mv "usr/lib/python$py_ver/site-packages/$pkgname/default.conf" "etc/$pkgname/"
  ln -sv "/etc/$pkgname/default.conf" "usr/lib/python$py_ver/site-packages/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
