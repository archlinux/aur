# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=sysmontask
pkgver=1.3.9+16+g7c96959
pkgrel=1
epoch=1
pkgdesc="System monitor with the compactness and usefulness of Windows Task Manager"
arch=('any')
url="https://github.com/KrispyCamel4u/SysMonTask"
license=('BSD')
depends=('gtk3' 'libwnck3' 'lshw' 'polkit' 'python-cairo' 'python-gobject' 'python-psutil')
makedepends=('git' 'python-setuptools')
optdepends=('python-matplotlib: For Log Plot utility'
            'nvidia-utils: for NVIDIA GPU monitoring')
_commit=7c9695990cb8fe2186b6b3e62b1e14cbd25c6542  # tags/v1.x.x^0
source=("git+https://github.com/KrispyCamel4u/SysMonTask.git#commit=$_commit"
        "$pkgname.patch"
        "$pkgname-pkexec"
        "org.freedesktop.$pkgname.policy")
sha256sums=('SKIP'
            'd2069005efc8552a96da3fb84703e8287ec5abc89f59e69fafa1d173cba0d91e'
            '5e6538589b0b6509a265cd67a28cb791e0f87a0ae88b9bb86cd97e6227a8d93b'
            'fc36c4fed51fd543697fb6c9eeb3f57151e9ba2745339119950875d8888d5046')

pkgver() {
  cd "$srcdir/SysMonTask"
  git describe --tags --exclude v1.x.x | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/SysMonTask"
  patch -Np1 -i "$srcdir/$pkgname.patch"

  # '1.x.x' is not valid according to PEP 440
  sed -i 's/1.x.x/1.3.9/g' setup.py

  sed -i "s/Exec=$pkgname/Exec=$pkgname-pkexec/g" SysMonTask.desktop
}

build() {
  cd "$srcdir/SysMonTask"
  python setup.py build
}

package() {
  cd "$srcdir/SysMonTask"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm755 "$srcdir/$pkgname-pkexec" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/org.freedesktop.$pkgname.policy" -t \
    "$pkgdir/usr/share/polkit-1/actions"
}
