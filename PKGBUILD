# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=airnef
pkgname=python-$_pkgname
pkgver=1.1
pkgrel=7
pkgdesc='Wireless download from your Nikon/Sony/Canon camera'
arch=(any)
url='https://testcams.com/airnef/'
license=(GPL-3.0-only)
depends=(python python-six tk)
source=("https://horshack-dpreview.github.io/$_pkgname/Version_$pkgver/${_pkgname}_v${pkgver}_Source.zip"
        "$_pkgname-linux.patch")
sha512sums=('b45b0591e42179d1e5b5eea9ede6762d311cd0642585c54568c90111424e2ca316aa444d772b4855afe42f25b6cc4b3e1b78bb5a0c2a4cb52440535894a5cba6'
            '2ebf9eda9c354f73a1a3084eca706c1d30d67737101d5bfb69474984f636ce5dc52092cec3de2d04e8ac61afa26ffe78e41dbf1a2fee5955af2ceed75620f154')


prepare() {
  cd $_pkgname

  patch -N -p1 -i "$srcdir"/$_pkgname-linux.patch
  # Remove outdated vendored copy of six, which is incompatible with Python 3.12
  rm -f six.py
}

package() {
  cd $_pkgname

  local py_ver=$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')
  local package_dir="/usr/lib/python$py_ver/site-packages/$_pkgname"
  install -v -Dm 644 *.py -t "$pkgdir"$package_dir
  install -v -m 755 airnef.pyw "$pkgdir"$package_dir/airnef.py
  install -v -Dm 644 appresource/* -t "$pkgdir"$package_dir/appresource
  install -v -dm 755 "$pkgdir"/usr/bin
  ln -sf "$package_dir"/airnef.py "$pkgdir"/usr/bin/$_pkgname
  ln -sf "$package_dir"/airnefcmd.py "$pkgdir"/usr/bin/${_pkgname}cmd
}
