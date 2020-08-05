# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=htop-zfs
pkgver=2.2.0
pkgrel=3
pkgdesc='Interactive process viewer with ZFS patch'
arch=('x86_64')
url='https://hisham.hm/htop/'
license=('GPL')
provides=('htop')
depends=('ncurses' 'libnl')
makedepends=('python')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs' debug)
validpgpkeys=('8460980B2B79786DE0C7FCC83FD8F43C2BB3C478') # Hisham Muhammad <h@hisham.hm>
source=("https://hisham.hm/$pkgname/releases/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc}
        '0001-fix-option-string.patch'
        '0002-gcc10.patch')
sha256sums=('d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57'
            'SKIP'
            'e0ea3a91dfbc7f8c516a19e0d8890314845e768ea4132dfaa49c4d4e89ec10ca'
            'f715a87cffc6375eb3915530f4b27455b00b9324b8ee9168c0b983ba2a536938')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 < "${srcdir}"/0001-fix-option-string.patch
  patch -Np1 < "${srcdir}"/0002-gcc10.patch
}

build() {
  cd "$pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver

  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
