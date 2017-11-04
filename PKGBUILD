# Maintainer: Nate Simon <aurpkg (at natesimon.net)>

pkgname=xreader
pkgver=1.6.0
pkgrel=2
pkgdesc="Document viewer for files like PDF and Postscript. X-Apps Project."
arch=('i686' 'x86_64')
license=('GPL')
depends=('ghostscript' 'poppler-glib' 'djvulibre' 'desktop-file-utils'
    'gsettings-desktop-schemas' 'gtk3' 'libsecret' 'libspectre' 'webkit2gtk')
makedepends=('mate-common' 'yelp-tools' 'gobject-introspection')
optdepends=('nemo: nemo extension'
    'caja: caja extension'
    'gtk3-print-backends: printer support in gtk3 apps'
    'texlive-bin: support for dvi files')
provides=($pkgname)
conflicts=('xreader-git')
url='https://github.com/linuxmint/xreader'
install=xreader.install

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/linuxmint/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('aab4c7244010199a4b35918780d1e000')

build() {
    if [ -d /usr/include/nemo/libnemo-extension ]; then NEMO_EXT_FLAG=""; else NEMO_EXT_FLAG="--disable-nemo"; fi
    if [ -d /usr/include/caja/libcaja-extension ]; then CAJA_EXT_FLAG=""; else CAJA_EXT_FLAG="--disable-caja"; fi

    cd ${srcdir}/${pkgname}-${pkgver}
    ./autogen.sh --prefix="/usr" \
        --localstatedir="/var" \
        --libexecdir="/usr/lib/${pkgname}" \
        --enable-introspection \
        "$NEMO_EXT_FLAG" "$CAJA_EXT_FLAG"
    make
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
