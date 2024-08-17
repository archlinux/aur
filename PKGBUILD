# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=illuminanced-git
pkgver=r23.f61d87e
pkgrel=1
pkgdesc='Ambient Light Sensor Daemon for Linux'
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')
url='https://github.com/mikhail-m1/illuminanced'

source=("${pkgname}::git+https://github.com/mikhail-m1/illuminanced.git"
        'change-binary-path.patch'
        'change-default-config-path.patch'
        'use-file-for-logging.patch')
b2sums=('SKIP'
        '6c49318feefd0c153f74ad847680fcb76105d11d92c5d664c6e318107e00a52d35a5fa6ebb4c8844df23d71f7d980d3af5154d62bc84d213e88d78bee61e7c6f'
        'c1a5802fed81200235b9e77aaf07ce09b2d8eedf87393dac53b2d6d458a6eaad2994e4588ee2d151764f7ea6d7516a9dd70eb61baefff99c86d4e2d9e53ed3f0'
        '84c9068440f01e28a937ec4314e9b17412aac29f6acf5e9111e666c2dc1b9eba70d93ddc1aba7199f4748ee79d4b35a84488cf9b3c8f3d35ab1005c49dac2540')

backup=('etc/illuminanced.toml')

conflicts=('illuminanced')
provides=('illuminanced')

makedepends=('git' 'rust')
depends=('glibc' 'gcc-libs')

pkgver() {
  cd "${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare () {
  cd "${pkgname}"

  patch -p1 -i "$srcdir/change-binary-path.patch"
  patch -p1 -i "$srcdir/change-default-config-path.patch"
  patch -p1 -i "$srcdir/use-file-for-logging.patch"
}

build () {
  cd "${pkgname}"

  cargo build --release
}

package () {
  cd "${pkgname}"

  install -Dm755 target/release/illuminanced -t "$pkgdir/usr/bin/"
  install -Dm644 illuminanced.toml -t "$pkgdir/etc/"
  install -Dm644 illuminanced.service -t "$pkgdir/usr/lib/systemd/system/"
}
