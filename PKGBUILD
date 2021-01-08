# Maintainer: sunplan
# Maintainer: bitwave

_pkgname=textadept
pkgname=textadept-bin
pkgver=11.0
pkgrel=1
pkgdesc="A fast, minimalist and remarkably extensible text editor (binary version)"
url="https://orbitalquark.github.io/textadept/"
arch=('x86_64')
license=('MIT')
depends=('lua' 'desktop-file-utils')
optdepends=('gtk2: for GUI version'
            'python: for reStructuredText language module')
conflicts=('textadept-beta' 'textadept-git' 'textadept-latest-stable'
           'textadept-modules' 'textadept-modules-beta' 'textadept')
source=(https://github.com/orbitalquark/textadept/releases/download/${_pkgname}_${pkgver}/${_pkgname}_${pkgver}.linux.tgz
        https://github.com/orbitalquark/textadept/releases/download/${_pkgname}_${pkgver}/${_pkgname}_${pkgver}.modules.zip
        textadept.install)
sha256sums=('39cff1059dcece7999fd30ddc3f09df15fc72b10d982aa41b54247e7f3afde4e'
            'dd1398cd72fe33c4404e2cc038158f3fd1db1b4e160b65af5945d2ba5761aeb2'
            'b2971d4c6743033b16b172c2b208942a4a6082c7bcfb593ae25bff3fbad45b4b')

package() {
    cd textadept_${pkgver}.linux

    # Create directories
    install -d $pkgdir/opt/textadept
    install -d $pkgdir/usr/share/applications
    install -d $pkgdir/usr/share/doc
    install -d $pkgdir/usr/share/licenses/textadept
    install -d $pkgdir/usr/bin

    # Copy files and directories
    cp -r core lexers modules scripts themes docs *.lua LICENSE \
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
    cp -r $srcdir/textadept-modules $pkgdir/opt/textadept

    # Clean up
    # rm $pkgdir/opt/textadept/modules/yaml/libyaml64{.dll,jit.dll,osx.so}
    rm -rf `find $pkgdir -type d -name .hg`
}

install=textadept.install
