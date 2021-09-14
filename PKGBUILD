# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=sysmontask
pkgver=1.x.x
pkgrel=1
epoch=1
pkgdesc="System monitor with the compactness and usefulness of Windows Task Manager"
arch=('any')
url="https://github.com/KrispyCamel4u/SysMonTask"
license=('BSD')
depends=('gtk3' 'libwnck3' 'polkit' 'python-cairo' 'python-gobject' 'python-psutil')
makedepends=('python-setuptools')
optdepends=('python-matplotlib: For Log Plot utility'
            'nvidia-utils: for NVIDIA GPU monitoring')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.patch"
        "$pkgname-pkexec"
        "org.freedesktop.$pkgname.policy")
sha256sums=('e17b1ea225e93c5b5646ffccdeec5f089568e1d32eac5c8324d7ac7436962cb5'
            'd2069005efc8552a96da3fb84703e8287ec5abc89f59e69fafa1d173cba0d91e'
            '5e6538589b0b6509a265cd67a28cb791e0f87a0ae88b9bb86cd97e6227a8d93b'
            'fc36c4fed51fd543697fb6c9eeb3f57151e9ba2745339119950875d8888d5046')

prepare() {
  cd "SysMonTask-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname.patch"

  sed -i "s/Exec=$pkgname/Exec=$pkgname-pkexec/g" SysMonTask.desktop
}

build() {
  cd "SysMonTask-$pkgver"
  python setup.py build
}

package() {
  cd "SysMonTask-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm755 "$srcdir/$pkgname-pkexec" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/org.freedesktop.$pkgname.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions"
}
