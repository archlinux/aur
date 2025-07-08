# Maintainer: Paul Black <paul@blackfamily.one>

pkgname=si-edit-git
pkgver=continuous.r5.g6da93b2
pkgrel=1
pkgdesc="Tools for working with SI files from LEGO Island."
arch=('i686' 'x86_64')
url="https://github.com/isledecomp/SIEdit"
license=('GPLv3')
depends=('qt6-base' 'qt6-tools' 'qt6-multimedia' 'ffmpeg' 'gcc')
makedepends=('git' 'make' 'cmake')
source=('git+https://github.com/isledecomp/SIEdit.git')
md5sums=('SKIP')

build() {
        cd "$srcdir/SIEdit"
        mkdir -p build
        cd build
        cmake ..
        make -j$(nproc)
}

package() {
        cd "$srcdir/SIEdit/build/app"
        install -Dm755 si-edit "$pkgdir/usr/bin/si-edit"
	install -Dm644 $srcdir/SIEdit/build/lib/libweaver.so "$pkgdir/usr/lib/libweaver.so"

        install -Dm644 $srcdir/SIEdit/app/res/icon512x512.png "$pkgdir/usr/share/icons/si-edit.png"
        install -Dm644 $srcdir/SIEdit/app/res/AppImage.desktop "$pkgdir/usr/share/applications/si-edit.desktop"

        sed -i "s/Icon=icon/Icon=si-edit/" "$pkgdir/usr/share/applications/si-edit.desktop"

        install -Dm644 $srcdir/SIEdit/LICENSE "$pkgdir/usr/share/licenses/si-edit/LICENSE"
}

pkgver() {
  cd "$srcdir/SIEdit"
  git describe --tags --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
