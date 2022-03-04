# Maintainer: Dakeryas <mrdakeryas at gmail dot com>
pkgname=mac-optimised
pkgver=7.38
pkgrel=1
pkgdesc="Monkey's Audio library and command line APE converter with optimised build flags (from SDK)"
arch=('i686' 'x86_64')
url="https://monkeysaudio.com/developers.html"
license=("Monkey's Audio License Agreementt")
provides=('mac')
conflicts=('mac')
makedepends=('gcc' 'make')
source=("https://monkeysaudio.com/files/MAC_SDK_${pkgver//.}.zip")
md5sums=('SKIP')


_project_path() {
    echo "$srcdir/Source/Projects/NonWindows"
}

_mac_cmd_object() {
    echo "$(awk '/CMDOBJECTS\s+=/{print $NF}' $(_project_path)/Makefile)"
}

build() {
    cd $(_project_path)
    export prefix=/usr
    export CXXFLAGS="${CXXFLAGS} -O3 -march=native"
    make 
}

package() {
    cd $(_project_path)
    export LDFLAGS="${LDFLAGS} -Wl,-rpath,\\$\$ORIGIN/../lib"
    touch $(_mac_cmd_object)
    make DESTDIR="$pkgdir/" install
}
