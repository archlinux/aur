# Maintainer: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=('conan')
pkgver=0.16.1
pkgrel=3
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('any')
url="https://conan.io"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-pyjwt>=1.4.0' 'python-pyjwt<1.5.0'
         'python-requests>=2.7.0' 'python-requests<2.13.0'
         'python-colorama>=0.3.3' 'python-colorama<0.4.0'
         'python-yaml>=3.11' 'python-yaml<3.13.0'
         'python-patch=1.16'
         'python-fasteners>=0.14.1'
         'python-six>=1.10.0'
         'python-node-semver=0.1.1'
         'python-bottle>=0.12.8' 'python-bottle<0.13')
source=("https://github.com/conan-io/conan/archive/${pkgver}.tar.gz" "drop-passlib.patch" "drop-boto.patch")
sha512sums=('2d7b11712cd11c4cc4269cf001fcf4452bc7ba3bacabab223ce805cace9b2ec2ea82930b7ad7218fcb6ceda864955225c96381b582ff7de2e6b927f6c04b7c19'
            '3b57353283dd280892e980b6c5bf5b74d0676c1cd42ac1a59a150634f69225086243ac6e2c23e07556b62a71ec36402e69534d4921189a7dfff546f190828fe0'
            'db1387e8e6d55b90a1b45d43029564d40c851e39bd3d15e189ed2343e7cdca11705e4ce2baf34bdbb2c5c6fe899049ec198724150977f8656a3e49d2ae2402ae')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/drop-passlib.patch"
  patch -Np1 -F3 -i "${srcdir}/drop-boto.patch"
}


build() {
  cd "$srcdir/conan-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/conan-$pkgver"
  python setup.py install --optimize=1 --root=${pkgdir}
  install -m755 -d "${pkgdir}/usr/share/licenses/conan"
  install -m644 LICENSE.md "${pkgdir}/usr/share/licenses/conan/"
  install -m755 -d "${pkgdir}/usr/share/doc/conan"
  install -m644 contributors.txt "${pkgdir}/usr/share/doc/conan/"
}
