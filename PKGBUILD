# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_pkgname=onedrive
pkgname=$_pkgname-git
pkgver=r132.ge03d384
pkgrel=1
epoch=1
pkgdesc='Free OneDrive client written in D'
arch=('i686' 'x86_64')
url='https://github.com/skilion/onedrive'
license=('GPL3')
depends=('curl' 'gcc-libs' 'glibc' 'sqlite')
makedepends=('dmd')
provides=("onedrive=$pkgver")
conflicts=('onedrive')
backup=('etc/onedrive.conf')
source=('git+https://github.com/skilion/onedrive.git'
        'https://patch-diff.githubusercontent.com/raw/skilion/onedrive/pull/165.patch')
sha256sums=('SKIP'
            'ca804dc6cc5577cfa81f1bae47e58010345b5441c4e4faf13b6deba6208f7601')

pkgver() {
  cd $_pkgname

  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  sed -i 's|/usr/local|/usr|g' onedrive.service
  patch -Np1 < ../165.patch
}

build() {
  make -C $_pkgname
}

package() {
  cd $_pkgname

  install -Dm755 onedrive -t "$pkgdir/usr/bin/"
  install -Dm644 config "$pkgdir/usr/share/onedrive/config.default"
  install -Dm644 onedrive.service -t "$pkgdir/usr/lib/systemd/user/"
}
