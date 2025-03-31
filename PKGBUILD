# Maintainer: Peter Semiletov <peter.semiletov@gmail.com>

pkgname=tea-qt-git
pkgver=63.3.1.r0.g9599b12
pkgrel=1
pkgdesc="Rich-featured text editor for Linux, *BSD, Windows, OS/2, Mac and Haiku OS. Stable git-commit."
arch=('x86_64')
url="https://tea.ourproject.org"
license=('GPL3')
depends=('qt6-base' 'gcc-libs' 'hunspell' 'desktop-file-utils' 'djvulibre' 'aspell' 'nuspell' 'libspeechd' 'poppler')
#optdepends=('poppler: open and search text in PDF files'
#            'djvulibre: open and search in DJVU'
#            'aspell: Aspell spellchecker support'
#            'nuspell: Nuspell spellchecker support, Hunspell compatible'
#            'libspeechd: Speech Dispatcher support to speak the text')

makedepends=('cmake' 'git')
provides=('tea-qt')
conflicts=('tea-qt')

source=("git+https://github.com/psemiletov/tea-qt.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/tea-qt"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/tea-qt/b"
  cd "${srcdir}/tea-qt/b"
  cmake .. -DUSE_PDF=ON -DUSE_DJVU=ON -DUSE_ASPELL=ON -DUSE_NUSPELL=ON -DUSE_SPEECH=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
  cd "${srcdir}/tea-qt/"
  sed -i 's/tea %F/tea-qt %F/g' desktop/tea.desktop
}

package(){
  cd "${srcdir}/tea-qt/b"
  make DESTDIR="$pkgdir" install
  mv -v -f "$pkgdir/usr/bin/tea" "$pkgdir/usr/bin/tea-qt"
}
