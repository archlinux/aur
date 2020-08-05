# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=htop-zfs
pkgver=2.2.0
pkgrel=5
pkgdesc='Interactive process viewer with ZFS awareness patch'
arch=('x86_64')
url='https://hisham.hm/htop/'
license=('GPL')
provides=('htop')
conflicts=('htop')
depends=('ncurses' 'libnl')
makedepends=('python')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs' debug)
validpgpkeys=('8460980B2B79786DE0C7FCC83FD8F43C2BB3C478') # Hisham Muhammad <h@hisham.hm>
source=("https://hisham.hm/htop/releases/$pkgver/htop-$pkgver.tar.gz"{,.asc}
        '0001-fix-option-string.patch'
        '0002-gcc10.patch'
        'Add-ZFS-cache-awareness-to-memory-meters.patch')
sha256sums=('d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57'
            'SKIP'
            'e0ea3a91dfbc7f8c516a19e0d8890314845e768ea4132dfaa49c4d4e89ec10ca'
            'f715a87cffc6375eb3915530f4b27455b00b9324b8ee9168c0b983ba2a536938'
            '91caf65c2f2fe8fdc40669eeff23bce6b97b88944ffb945c5b30e7d58d5146f8')

prepare() {
  cd "htop-$pkgver"

  patch -Np1 < "${srcdir}"/0001-fix-option-string.patch
  patch -Np1 < "${srcdir}"/0002-gcc10.patch
  patch -Np1 < "${srcdir}"/Add-ZFS-cache-awareness-to-memory-meters.patch
}

build() {
  cd "htop-$pkgver"

  ./autogen.sh

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver \
      --enable-zfs-cache-awareness

  make
}

package() {
  make -C "htop-$pkgver" DESTDIR="$pkgdir" install
}
