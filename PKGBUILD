# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xreader-git
_pkgbasename=xreader
pkgver=4.2.3.r0.gca48134
pkgrel=1
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('poppler-glib' 'webkit2gtk-4.1' 'xapp')
makedepends=(
    'git' 'meson' 'samurai' 'gobject-introspection' 'mathjax2'
    'libgxps' 'intltool' 'itstool' 'djvulibre' 'libspectre' 'texlive-bin'
    'glib2-devel'
)
optdepends=(
    'nemo: nemo extension'
    'caja: caja extension'
    'texlive-bin: support for dvi files'
    'mathjax2: support for math in epub files'
    'djvulibre: support for djvu files'
    'libgxps: support for xps files'
    'libspectre: support for dvi and ps files'
    'yelp: View help and documentation from the app'
)
provides=($pkgname)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xreader'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags --exclude 'master*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p ${srcdir}/${pkgname}/build
    cd ${srcdir}/${pkgname}/build
    meson --prefix=/usr \
          --libexecdir=lib/${_pkgbasename} \
          --buildtype=plain \
          -Dmathjax-directory=/usr/share/mathjax2 \
          -Dcomics=true \
          -Ddjvu=true \
          -Ddvi=true \
          -Dt1lib=true \
          -Dpixbuf=true \
          -Dintrospection=true \
          -Dhelp_files=true \
          ..
    samu
}

package(){
    cd ${srcdir}/${pkgname}/build
    DESTDIR="$pkgdir/" samu install
}
