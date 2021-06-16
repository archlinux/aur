# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=dirsearch

_ver=0.4.2-beta1
pkgver() { sed 's/\(alpha\)\([0-9]\+\)/\1_\2/' <<<"${_ver/-/.}"; }
pkgver=0.4.2.beta1
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
source=("$pkgname-$_ver.tgz::$url/archive/refs/tags/v$_ver.tar.gz")
b2sums=('b427e2229fb0c509eb11af6f5f217c9d46e0af2e58bc4b65f8d9eb44705a9eb548d47bce73d678e445b1fc1216906f7769cc22c3e19034dc92304a3948d80628')


package() {
  cd "$pkgname-$_ver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 *.md -t"$pkgdir/usr/share/doc/$pkgname/"
  local py_ver="$(python -V | sed 's/Python \(3\.[0-9]\+\).*/\1/')"
  # hack to fix the default.conf file location
  install -dm755 "$pkgdir/etc/$pkgname"
  mv "$pkgdir/usr/lib/python$py_ver/site-packages/$pkgname/default.conf" "$pkgdir/etc/$pkgname/"
  ln -s "/etc/$pkgname/default.conf" "$pkgdir/usr/lib/python$py_ver/site-packages/$pkgname/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
