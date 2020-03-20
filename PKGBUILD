# Maintainer: xsmile <>

_pkgname=libtorrent
pkgname=libtorrent-ps
_pkgver=0.13.6
pkgver=1.1.r54.ga787dd9
pkgrel=1
pkgdesc='BitTorrent library written in C++ for use with rtorrent-ps'
url='https://github.com/rakshasa/libtorrent'
license=('GPL')
arch=('any')
depends=('openssl')
provides=('libtorrent')
conflicts=('libtorrent')
source=("https://github.com/rakshasa/$_pkgname/archive/v$_pkgver.tar.gz"
        'lt-base-cppunit-pkgconfig.patch'
        'lt-ps-better-bencode-errors_all.patch'
        'lt-ps-honor_system_file_allocate_all.patch'
        'lt-ps-log_open_file-reopen_all.patch'
        'lt-open-ssl-1.1.patch')
md5sums=('8c8eaa9fa03bd113967c68eea26493e7'
         '198fb1fe53aa35eb97d16f9a8b9556bd'
         'dfae06b33afa738211619040810be8b4'
         '8d7f8fe5ad412bd42f2ea66131a8ce6b'
         '2bfadac7770935ca98c4714c2011541a'
         '1fc8eca467b3e5a5b5c43bbef21f4ba8')

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"

  LT_BASE_PATCHES=("$srcdir"/lt-base-cppunit-pkgconfig.patch
                   "$srcdir"/lt-open-ssl-1.1.patch)
  LT_PATCHES=()

  # Patch libtorrent
  for corepatch in "${LT_BASE_PATCHES[@]}" \
                   "$srcdir"/lt-ps-*_{${_pkgver},all}.patch "${LT_PATCHES[@]}"; do
    test ! -e "$corepatch" || { msg2 "$(basename $corepatch)"; patch -uNp1 -i "$corepatch"; }
  done

  for backport in "$srcdir"/backport*_{${_pkgver},all}_*.patch; do
    test ! -e "$backport" || { msg2 "$(basename $backport)"; patch -uNp1 -i "$backport"; }
  done

  ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"

  ./configure \
    --prefix=/usr \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
}
