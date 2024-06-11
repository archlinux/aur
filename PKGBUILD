# Maintainer: Piotr Borczyk <howorang@gmail.com>
pkgname=opl-pc-tools-git
pkgver=3.0.r1.g2da4c5c
pkgdesc="Desktop tools for working with Open PS2 Loader storages"
pkgrel=1
arch=('x86_64')
url=https://github.com/brainstream/OPL-PC-Tools
license=('GPL-3.0-or-later')
depends=(qt5-base glibc gcc-libs bash)
makedepends=(git cmake qt5-tools base-devel)
source=("git+https://github.com/brainstream/OPL-PC-Tools.git")
sha256sums=('SKIP')

pkgver() {
  cd OPL-PC-Tools
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B builddir -S OPL-PC-Tools \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build builddir
}

check() {
    ctest --test-dir builddir --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install builddir -v --config Release
    install -v -D -t $pkgdir/usr/bin "$srcdir/builddir/oplpctools"
    install -v -D -t $pkgdir/usr/share/oplpctools "$srcdir/builddir/"*".qm" "$srcdir/OPL-PC-Tools/release/assets/linux/"*
    install -v -D -t $pkgdir/usr/share/licenses/oplpctools "$srcdir/OPL-PC-Tools/LICENSE.txt"
    install -v -D -T $srcdir/OPL-PC-Tools/src/OplPcTools/Resources/images/application.png $pkgdir/usr/share/oplpctools/icon.png
    chmod +x $pkgdir/usr/bin/oplpctools


    echo "[Desktop Entry]" > "OPL PC Tools.desktop"
    echo "Exec=/usr/bin/oplpctools" >> "OPL PC Tools.desktop"
    echo "Icon=/usr/share/oplpctools/icon.png" >> "OPL PC Tools.desktop"
    echo "Name=OPL PC Tools" >> "OPL PC Tools.desktop"
    echo "StartupNotify=true" >> "OPL PC Tools.desktop"
    echo "Terminal=false" >> "OPL PC Tools.desktop"
    echo "Type=Application" >> "OPL PC Tools.desktop"
    echo "Categories=Game;Utility;" >> "OPL PC Tools.desktop"

    chmod +x "OPL PC Tools.desktop"
    install -v -D -t "$pkgdir/usr/share/applications/" "OPL PC Tools.desktop"
}
