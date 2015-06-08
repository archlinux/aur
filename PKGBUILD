# Maintainer: David Mougey <imapiekindaguy at gmail dot com>

pkgname=sigil-git
pkgver=0.8.6.r3135.g9975f58
pkgrel=1
pkgdesc="A WYSIWYG ebook editor"
arch=('i686' 'x86_64')
url="https://github.com/user-none/Sigil"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'qt5-webkit' 'qt5-xmlpatterns' 'qt5-tools' 'qt5-multimedia' 'python-lxml')
makedepends=('git' 'cmake' 'boost')
provides=('sigil')
conflicts=('sigil')
install=sigil.install
source=(sigil::'git+https://github.com/user-none/Sigil.git' 'sigil.desktop')
md5sums=('SKIP' 'SKIP')

_gitroot="https://github.com/user-none/Sigil"
_gitname=sigil

pkgver() {
    cd "$srcdir/$_gitname"
    printf "%s.r%s.g%s" "$(grep current-version version.xml | grep -oP '([0-9]{1,2}(\.){0,1}){3}')" \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir" && rm -rf ${_gitname}-build
    cp -r ${_gitname} ${_gitname}-build
    cd ${_gitname}-build
    mkdir build
    cd build
    cmake -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON ..
    make
}

package() {
    cd "$srcdir/${_gitname}"-build/build
    make install DESTDIR="${pkgdir}"
    install -d -m 0755 "${pkgdir}"/usr/share/applications
    install -m 0644 "${srcdir}"/sigil.desktop "${pkgdir}"/usr/share/applications
    for _pic in 16 32 48 128 256; do
        install -D -m 0644 ../src/Resource_Files/icon/app_icon_${_pic}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${_pic}x${_pic}/apps/sigil.png
    done
}
