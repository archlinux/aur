# Maintainer: bitwave

pkgname=textadept
pkgver=8.3
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
sha256sums=('a9fe9690103b5564ed9b590b8154a0ec86bc15cd4a8a4e7729859a507dcd724e'
            '4c2a6742401fb25e740f428f809e2c939c3c57d50fd40a4a4e476ea57128e91e'
            'b2971d4c6743033b16b172c2b208942a4a6082c7bcfb593ae25bff3fbad45b4b')
[ "$CARCH" = "i686" ] &&
sha256sums[0]='1ec95f00a118462b6b5256cf77c2afe4ee66e70390ec5d503f79a0cd2c339df3'
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