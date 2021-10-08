# Maintainer: Sergii Fesenko <sergii_f@loutlook.com>

pkgname=txr-git
_pkgname=txr
pkgver=271.r0.884002da
pkgrel=1
pkgdesc="A programming language for convenient data munging"
arch=('i686' 'x86_64')
url="http://nongnu.org/txr/"
license=('BSD')
depends=('libffi' 'libxcrypt')
makedepends=('gcc' 'make')
conflicts=(txr)
provides=(txr)
source=(
  'git+http://kylheku.com/git/txr.git'
  'ftdetect.vim'
)
sha256sums=(
  'SKIP'
  'b884b3d595bcc45514d4a200ad11017d54506bcb9952497c5feaa2cf87871113'
)
pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --tags --long | sed 's/txr-/v/; s/-/.r/; s/-g/./; s/^v//'
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make -j
}

check() {
  cd $_pkgname
  # Tests have to run sequentially.
  make tests
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
# txr installs licenses to /usr/share/txr. Add symlinks from Arch's
# usual license directory.
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s -t "$pkgdir/usr/share/licenses/$pkgname" ../../txr/LICENSE ../../txr/METALICENSE
# install vim syntax files
  install -m644 -D -t "$pkgdir/usr/share/vim/vimfiles/syntax" txr.vim tl.vim
  install -m644 -D ../ftdetect.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/txr.vim"
}

