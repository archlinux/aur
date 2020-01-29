# Maintainer: bitwave

_pkgname=textadept
pkgname=textadept-bin
pkgver=10.8
pkgrel=1
pkgdesc="A fast, minimalist and remarkably extensible text editor (binary version)"
url="http://foicica.com/textadept"
arch=('i686' 'x86_64')
license=('MIT')
depends=('lua' 'desktop-file-utils')
optdepends=('gtk2: for GUI version'
            'python: for reStructuredText language module')
conflicts=('textadept-beta' 'textadept-git' 'textadept-latest-stable'
           'textadept-modules' 'textadept-modules-beta' 'textadept')
_arch=x86_64
[ "$CARCH" = "i686" ] && _arch=i386
source=(http://foicica.com/textadept/download/${_pkgname}_${pkgver}.${_arch}.tgz
        http://foicica.com/textadept/download/${_pkgname}_${pkgver}.modules.zip
        textadept.install)
sha256sums=('2702e601091120909644b8f5b1b89661e46e16536de4d00a5c64c4951fe07d40'
            '2b2a94f43129ca81d67fde0b206fcd96e352b09a7f687833baa4ee8c5e46b32c'
            'b2971d4c6743033b16b172c2b208942a4a6082c7bcfb593ae25bff3fbad45b4b')
[ "$CARCH" = "i686" ] &&
sha256sums[0]='6cd09da10394a266841559f8ffd6b65d28e242f9431182c7f1c4c0372a0b657b'
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
    install -m755 textadept textadept-curses \
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
    ln -s /opt/textadept/LICENSE $pkgdir/usr/share/licenses/$_pkgname/
    ln -s /opt/textadept/doc $pkgdir/usr/share/doc/textadept

    # Copy modules
    cd $srcdir/textadept_${pkgver}.modules
    cp -r modules $pkgdir/opt/textadept

    # Clean up
    rm $pkgdir/opt/textadept/doc/bombay
    # rm $pkgdir/opt/textadept/modules/yaml/libyaml64{.dll,jit.dll,osx.so}
    rm -rf `find $pkgdir -type d -name .hg`
}

install=textadept.install
