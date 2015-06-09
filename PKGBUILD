# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=opentxs-cli-git
pkgver=20140911
pkgrel=1
pkgdesc="Open Transactions Command Line Interface"
arch=('i686' 'x86_64')
depends=('opentxs-git')
makedepends=('autoconf' 'automake' 'cmake' 'gcc' 'git' 'libtool' 'make' 'pkg-config')
url="https://github.com/Open-Transactions/opentxs-cli"
license=('custom')
source=(git+https://github.com/Open-Transactions/opentxs-cli)
sha256sums=('SKIP')
provides=('opentxs-cli')
conflicts=('opentxs-cli')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  mkdir -p build && cd build
  export opentxsIncludePath=/usr/include
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKEYRING_FLATFILE=ON \
        -DWITH_TERMCOLORS=ON \
        --debug-output ../
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/opentxs-cli/LICENSE"

  msg 'Installing docs...'
  install -dm 755 "$pkgdir/usr/share/doc/opentxs-cli"
  for _doc in ChangeLog README.md docs script; do
    cp -dpr --no-preserve=ownership $_doc "$pkgdir/usr/share/doc/opentxs-cli"
  done

  msg 'Installing...'
  make DESTDIR="$pkgdir" install -C build

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
