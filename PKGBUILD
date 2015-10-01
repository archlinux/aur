# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: David Mougey <imapiekindaguy at gmail dot com>

pkgname=sigil-git
pkgver=0.8.900.r27.gaaa6196
pkgrel=1
pkgdesc="A WYSIWYG ebook editor"
arch=('i686' 'x86_64')
url="https://github.com/Sigil-Ebook/Sigil"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'qt5-webkit' 'qt5-xmlpatterns' 'qt5-tools' 'qt5-multimedia' 'python-lxml')
makedepends=('git' 'cmake' 'boost')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=sigil.install
source=("${pkgname%-git}"::"git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p "${srcdir}/${pkgname%-git}/build"
    cd "${srcdir}/${pkgname%-git}/build"
    cmake -G "Unix Makefiles" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON ..
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make install DESTDIR="${pkgdir}"

    for _pic in 16 32 48 128 256; do
        install -D -m 0644 ../src/Resource_Files/icon/app_icon_${_pic}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${_pic}x${_pic}/apps/sigil.png
    done
}
