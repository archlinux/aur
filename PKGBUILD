# Maintainer: Jonathon Fernyhough <jonathon m2x dev>

pkgname=solo-python-git
pkgver=0.0.30.r1.g2f1542b
pkgrel=1
pkgdesc="Tools and Python library for SoloKeys"
arch=('any')
url="https://github.com/solokeys/solo-python"
license=('Apache' 'MIT')
depends=('python' 'python-click>=7.1' 'python-cryptography' 'python-ecdsa'
         'python-fido2>=0.9.1' 'python-intelhex' 'python-pyserial' 'python-pyusb'
         'python-requests')
makedepends=('fakeroot' 'git' 'python-dephell' 'python-setuptools')
provides=(${pkgname/-git})
conflicts=(${pkgname/-git})
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname/-git}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname/-git}
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd ${pkgname/-git}
  python setup.py build
}

package() {
  cd ${pkgname/-git}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 -t "$pkgdir"/usr/lib/python3.9/site-packages/solo solo/VERSION
}
