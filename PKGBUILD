# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=xreader-git
_pkgbasename=xreader
pkgver=master.lmde3.r0.ged709cf
pkgrel=1
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project (git version)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghostscript' 'poppler-glib' 'desktop-file-utils' 'xapps-git'
    'gsettings-desktop-schemas' 'gtk3' 'libsecret' 'webkit2gtk')
makedepends=('git' 'meson' 'samurai' 'gobject-introspection' 'mathjax2'
    'libgxps' 'intltool' 'itstool' 'djvulibre' 'libspectre' 'texlive-bin')
optdepends=('nemo: nemo extension'
    'caja: caja extension'
    'gtk3-print-backends: printer support in gtk3 apps'
    'texlive-bin: support for dvi files'
    'mathjax2: support for math in epub files'
    'djvulibre: support for djvu files'
    'libgxps: support for xps files')
provides=($pkgname)
conflicts=("${_pkgbasename}")
url='https://github.com/linuxmint/xreader'

source=("${pkgname}::git+https://github.com/linuxmint/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
