# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=isse
pkgver=0.2.0
pkgrel=1
pkgdesc="An Interactive Source Separation (e.g. vocal removal) Editor"
url="http://isse.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
makedepends=('git')
depends=('fftw' 'jack' 'zenity')
source=("isse.sh" "zenity.sh"
        "isse-code::git://git.code.sf.net/p/isse/code#commit=451aa4e3522a37e9057e972bdcf18b458e891340"
        "eigen::git://github.com/RLovelett/eigen.git#commit=4f8510325e951490df3249205ae8b69b7faed07f"
        "juce::git://github.com/julianstorer/JUCE.git#commit=79d60f0b3523bac78822b805ff463cbd5db1cd2a")
md5sums=('32f7cc11c8145d5c4713b56a24d31856'
         'c8edba2379d0fbcd5c2515fff4f3786f'
         'SKIP' 'SKIP' 'SKIP')

if [ "$CARCH" == "x86_64" ]
then
  TARGET_ARCH=-m64
else
  TARGET_ARCH=-m32
fi

prepare() {
  cd "$srcdir/isse-code"
  rmdir sdks/juce sdks/eigen || true
  ln -s -f "$srcdir/juce" sdks/juce
  ln -s -f "$srcdir/eigen" sdks/eigen
}

build() {
  cd "$srcdir/isse-code/builds/Linux"
  CONFIG=Release TARGET_ARCH="$TARGET_ARCH" make
}

package() {
  cd "$srcdir/isse-code/builds/Linux/build"
  install -Dm755 ISSE "$pkgdir/usr/share/isse/ISSE"
  cd "$srcdir"
  install -Dm755 zenity.sh "$pkgdir/usr/share/isse/zenity"
  install -Dm755 isse.sh "$pkgdir/usr/bin/isse"
}

# vim:set ts=2 sw=2 et:
