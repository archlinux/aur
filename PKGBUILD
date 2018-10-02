# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Lukas Fleischer (community/qtspim)
# Thanks: Lukas Jirkovsky (community/qtspim)
# Thanks: Chih-Hsuan Yen (aur/spim-svn)

pkgname=spimsuite-svn
pkgver=r717
pkgrel=1
pkgdesc="spim + xspim + QtSpim"
arch=('x86_64')
url="http://spimsimulator.sourceforge.net/"
license=('BSD')
depends=('glibc' # spim
         'libsm' 'libxaw' # 'xorg-apps' # xspim
         'qt5-base' # QtSpim
        )
makedepends=('subversion'
             'imake' # xspim
             'qt5-tools' 'icu' # QtSpim
            )
# optdepends=('qt5-tools: assistant-qt5')
provides=('spim'   'spim-svn'
          'xspim'  'xspim-svn'
          'qtspim' 'qtspim-svn')
conflicts=('spim'   'spim-svn'
           'xspim'  'xspim-svn'
           'qtspim' 'qtspim-svn')
source=("${pkgname%-svn}::svn://svn.code.sf.net/p/spimsimulator/code")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-svn}"
  printf "r%s" "$(svnversion | tr -d 'A-z')" # Subversion
}

prepare() {
  # QtSpim
  cd "$srcdir/${pkgname%-svn}/QtSpim"
  rm parser_yacc.* scanner_lex.*
}

build() {

  # spim
  cd "$srcdir/${pkgname%-svn}/spim"
  make -j1 spim

  # xspim
  cd "$srcdir/${pkgname%-svn}/xspim"
  xmkmf
  make -j1

  # QtSpim
  cd "$srcdir/${pkgname%-svn}/QtSpim"
  qmake
  sed -i 's#$(MOVE) help/qtspim.qhc help/qtspim.qhc;##' Makefile
  make -j1

}

check() {
  # spim
  cd "$srcdir/${pkgname%-svn}/spim"
  make --keep-going test_bare
  make --keep-going test
}

package() {

  # mkdir
  install -Dm755 -d "$pkgdir/usr/share/spim"
  install -Dm755 -d "$pkgdir/usr/share/xspim"
  install -Dm755 -d "$pkgdir/usr/share/qtspim"

  # spim
  cd "$srcdir/${pkgname%-svn}/spim"
  make PREFIX="$pkgdir/usr" install
  # spim.man
  make PREFIX="$pkgdir/usr" install-man
  # spim.pdf
  cd "$srcdir/${pkgname%-svn}"
  install -Dm644 Documentation/SourceForge/spim.pdf "$pkgdir/usr/share/spim/"
  install -Dm644 Documentation/SourceForge/SPIM_command-line.pdf "$pkgdir/usr/share/spim/"

  # xspim
  cd "$srcdir/${pkgname%-svn}/xspim"
  make \
    DESTDIR="" \
    BIN_DIR="$pkgdir/usr/bin" \
    EXCEPTION_DIR="$pkgdir/usr/share/spim" \
    MAN_DIR="$pkgdir/usr/share/man/man1" \
    install
  # xspim.man
  cd "$srcdir/${pkgname%-svn}"
  install -Dm644 Documentation/xspim.man "$pkgdir/usr/share/man/man1/xspim.1"
  # xspim.pdf
  install -Dm644 Documentation/SourceForge/xspim.pdf "$pkgdir/usr/share/xspim/"

  # QtSpim
  cd "$srcdir/${pkgname%-svn}"
  install -Dm755 QtSpim/QtSpim "$pkgdir/usr/bin/qtspim"
  # QtSpim.man
  install -Dm644 Documentation/qtspim.man "$pkgdir/usr/share/man/man1/qtspim.1"
  # QtSpim.pdf + etc
  install -Dm755 -d "$pkgdir/usr/share/qtspim/help"
  install -Dm644 QtSpim/help/* "$pkgdir/usr/share/qtspim/help/"
  install -Dm644 Setup/qtspim_debian_deployment/qtspim.desktop "$pkgdir/usr/share/applications/qtspim.desktop"
  install -Dm644 Setup/qtspim_debian_deployment/copyright "$pkgdir/usr/share/licenses/${pkgname%-svn}/copyright"
  install -Dm644 Setup/NewIcon48x48.png "$pkgdir/usr/share/qtspim/qtspim.png"

}