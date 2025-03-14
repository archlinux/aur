# Maintainer: Vlad Pirlog <(firstname) at (lastname) dot com>

pkgname=illuminanced-git
pkgver=r27.4c6178c
pkgrel=1
pkgdesc='Ambient Light Sensor Daemon for Linux'
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')
url='https://github.com/mikhail-m1/illuminanced'

source=("${pkgname}::git+https://github.com/mikhail-m1/illuminanced.git"
        'illuminanced.service'
        'illuminanced.toml'
        'add-is_none_or-dependency.patch'
        'change-default-config-path.patch')
b2sums=('SKIP'
        'c5af4c594b6b2cf5cfa73291d51bf4a5bd9ad1689bcb9c5fb9de3aa10731d2595f130b1ca914576e96f0e53860c4b1dc844c606cf5b6fd9eced4aafa16f36cb0'
        'c02838ea0ee5c677984b84c39ce245e309e99acbf323650987e7205eaf0394fedab6fafdb2f08047f8e6a459e8977c3a1ff9a78fa6407c51b9ed8e05fd35b70f'
        '61757f1bf4d006f7341b95c4051119ef89db2c0c8939a8eed9ace43a1669eebbc8c4ad510153b53544467008b9092595e409f57aae025c02c0c9e7245f5ffc41'
        'e21456698e881cb30e1c25667fa75faba1f230bef971f1d8a8a42755b9f3e74e085fde1afe2fd384cdf28fd8ea66f3e553ab549055ab69ed7812fa83aeec0023')

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

  patch -p1 -i "$srcdir/add-is_none_or-dependency.patch"
  patch -p1 -i "$srcdir/change-default-config-path.patch"
}

build () {
  cd "${pkgname}"

  cargo build --release
}

package () {
  cd "${pkgname}"

  install -Dm755 target/release/illuminanced -t "$pkgdir/usr/bin/"
  install -Dm644 ../illuminanced.toml -t "$pkgdir/etc/"
  install -Dm644 ../illuminanced.service -t "$pkgdir/usr/lib/systemd/system/"
}
