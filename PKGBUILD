#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('qtscrcpy-git')
pkgver=1.4.5.r0.gb5c5188
pkgrel=1
pkgdesc="Android real-time display control software."
provides=("qt-scrcpy")
conflicts=("qt-scrcpy")
url='https://github.com/barry-ran/QtScrcpy'
arch=('x86_64')
makedepends=('git')
depends=('qt5-base' 'android-tools' 'qt5-x11extras')
license=('Apache')
install=qtscrcpy-git.install
source=("git+https://github.com/barry-ran/QtScrcpy"
QtScrcpy.desktop
binaries.patch
)
md5sums=(SKIP
'626b7adef99d110b192cb3a0fa07652f'
'049c0e95b49a4437c9cda0c19b7295f2'
)

prepare(){
    cd "$srcdir"/QtScrcpy/QtScrcpy
    patch < "${srcdir}"/binaries.patch
}

pkgver(){
    cd "$srcdir"/QtScrcpy
    git describe --long --tag | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "${srcdir}"/QtScrcpy
    
    mkdir -p build
    cd build
    qmake ../all.pro CONFIG+=qtquickcompiler
    make qmake_all
    sed -ie '/^CXXFLAGS/s/$/ -Wno-deprecated-declarations/' QtScrcpy/Makefile
    make
}

package(){
	 cd "${srcdir}"/QtScrcpy/output/linux/release
	 install -Dm755 QtScrcpy "${pkgdir}"/usr/bin/QtScrcpy
	 
	 cd "${srcdir}"
	 install -Dm644 QtScrcpy.desktop "${pkgdir}"/usr/share/applications/QtScrcpy.desktop
	 install -Dm644 QtScrcpy/backup/logo.png "${pkgdir}"/usr/share/pixmaps/QtScrcpy.png
	 
	 mkdir -p "${pkgdir}"/usr/share/qtscrcpy
	 mkdir -p "${pkgdir}"/usr/share/qtscrcpy/config
	 mkdir -p "${pkgdir}"/usr/share/qtscrcpy/keymap
	 
	 install -Dm644 QtScrcpy/third_party/scrcpy-server "${pkgdir}"/usr/share/qtscrcpy/scrcpy-server
	 install -Dm644 QtScrcpy/config/config.ini "${pkgdir}"/usr/share/qtscrcpy/config/config.ini
	 install -Dm644 QtScrcpy/keymap/*.json "${pkgdir}"/usr/share/qtscrcpy/keymap/
}
