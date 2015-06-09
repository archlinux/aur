# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=opentxs-notary-git
pkgver=20141209
pkgrel=1
pkgdesc="Open Transactions notary"
arch=('i686' 'x86_64')
depends=('opentxs-git' 'protobuf')
makedepends=('autoconf' 'automake' 'cmake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
url="https://github.com/Open-Transactions/opentxs-notary"
license=('AGPL')
source=(git+https://github.com/Open-Transactions/opentxs-notary)
sha256sums=('SKIP')
provides=('opentxs-notary')
conflicts=('opentxs-notary')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  mkdir -p build && cd build
  export opentxs_DIR=/usr/share/cmake/Modules
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKEYRING_FLATFILE=ON \
        --debug-output ../
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/opentxs-notary/LICENSE"

  msg 'Installing docs...'
  install -dm 755 "$pkgdir/usr/share/doc/opentxs-notary"
  for _doc in ChangeLog README.md docs scripts; do
    cp -dpr --no-preserve=ownership $_doc "$pkgdir/usr/share/doc/opentxs-notary"
  done

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
