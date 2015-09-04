# Maintainer: bitwave

pkgname=textadept
pkgver=8.2
pkgrel=1
pkgdesc="A fast, minimalist and remarkably extensible text editor"
url="http://foicica.com/textadept"
arch=('i686' 'x86_64')
license=('MIT')
depends=('lua' 'desktop-file-utils')
optdepends=('gtk2: for GUI version'
            'python: for reStructuredText language module')
conflicts=('textadept-beta' 'textadept-git' 'textadept-latest-stable'
           'textadept-modules' 'textadept-modules-beta')
_arch=x86_64
[ "$CARCH" = "i686" ] && _arch=i386
source=(http://foicica.com/textadept/download/${pkgname}_${pkgver}.${_arch}.tgz
        http://foicica.com/textadept/download/${pkgname}_${pkgver}.modules.zip
        textadept.install)
sha256sums=('1845b63c1c75e6d21b8811493bad2bb9c7c0d2d675d1013608560dfa932d4b19'
            '02a60fba2889dd68d26258f4763fc68d23a30e504fd25d5f1c1992f3d9732a09'
            'b2971d4c6743033b16b172c2b208942a4a6082c7bcfb593ae25bff3fbad45b4b')
[ "$CARCH" = "i686" ] &&
sha256sums[0]='ad0ebca39e6cf98cac16e93257572da31966c984ed42521abf09b536766b5210'
package() {
    cd textadept_${pkgver}.${_arch}

    # Create directories
    install -d $pkgdir/opt/textadept
    install -d $pkgdir/usr/share/applications
    install -d $pkgdir/usr/share/doc
    install -d $pkgdir/usr/share/licenses/textadept
    install -d $pkgdir/usr/bin

    # Copy files and directories
    cp -r core lexers modules scripts themes doc *.lua LICENSE \
          $pkgdir/opt/textadept
    install -m755 textadept textadept-curses textadeptjit textadeptjit-curses \
                  $pkgdir/opt/textadept
    install -m644 src/*.desktop $pkgdir/usr/share/applications/

    # Copy icons
    rm $pkgdir/opt/textadept/core/images/*.{ico,icns}
    for res in 16 32 48 64 128 256; do
        install -d $pkgdir/usr/share/icons/hicolor/${res}x${res}/apps
        ln -s /opt/textadept/core/images/ta_${res}x${res}.png \
              $pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/textadept.png
    done
    install -d $pkgdir/usr/share/icons/hicolor/scalable/apps
    ln -s /opt/textadept/core/images/textadept.svg \
          $pkgdir/usr/share/icons/hicolor/scalable/apps/textadept.svg

    # Link binaries, license and documentation
    ln -s /opt/textadept/textadept{,jit}{,-curses} $pkgdir/usr/bin/
    ln -s /opt/textadept/LICENSE $pkgdir/usr/share/licenses/$pkgname/
    ln -s /opt/textadept/doc $pkgdir/usr/share/doc/textadept

    # Copy modules
    cd $srcdir/textadept_${pkgver}.modules
    cp -r modules $pkgdir/opt/textadept

    # Clean up
    rm $pkgdir/opt/textadept/doc/bombay
    rm $pkgdir/opt/textadept/modules/yaml/libyaml{.dll,jit.dll,osx.so}
    rm -rf `find $pkgdir -type d -name .hg`
}

install=textadept.install