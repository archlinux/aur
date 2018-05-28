# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=pakku
pkgver=0.12
pkgrel=3
pkgdesc='Pacman wrapper with AUR support'
arch=('x86_64')
url="https://github.com/kitsunyan/$pkgname"
license=('GPL3')
depends=('libcurl.so' 'git')
makedepends=('nim')
backup=('etc/pakku.conf')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        '0001-Specify-refspec-when-git-fetch-is-used.patch')
sha256sums=('73dc0da6bb36a9aa211b2e562d08d6cc60ab37ed527348f5d075df7aeac0e35c'
            '4987262977ab82fb86a3c02c6c8388c01d6744a0f4bedb794be2bbce23b99748')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i '../0001-Specify-refspec-when-git-fetch-is-used.patch'
}

build() {
  local addargs=()
  grep -Fxq debug <<< "`printf '%s\n' "${options[@]}"`" &&
  addargs=(NIM_TARGET='debug' NIM_OPTIMIZE='none')

  cd "$srcdir/$pkgname-$pkgver"
  make "${addargs[@]}" NIM_CACHE_DIR='../nimcache' PREFIX='/usr'
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX='/usr' DESTDIR="$pkgdir" install
}
