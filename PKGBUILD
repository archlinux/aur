# Maintainer: Mikael Blomstrand <chawlindel@gmail.com>

pkgname=remarkable-webkit2gtk
provides=('remarkable')
conflicts=('remarkable')
pkgver=1.87
pkgrel=3
pkgdesc="A free fully featured markdown editor for Linux. - Ported to webkit2gtk"
arch=('any')
url="http://remarkableapp.github.io"
license=('MIT')
depends=('python'
         'python-cairo'
         'python-gobject'
         'python-markdown'
         'python-beautifulsoup4'
         'python-gtkspellcheck'
         'python-lxml'
         'webkit2gtk'
         'wkhtmltopdf'
         'gtksourceview3'
         )
makedepends=('python')
optdepends=('python-lxml: export to HTML format support')
options=('!emptydirs' '!strip')
install="remarkable.install"
source=("https://github.com/mbloms/Remarkable/archive/v${pkgver}-1.tar.gz"
        "remarkable.install"
        "remarkable.patch"
        "LICENSE")

sha1sums=('87addb3464909d385f4890b0b80fe18c1103a9e5'
          'bdbfb750df9e5fb3022f47a46a80555259628cd1'
          'd9fc74c5a0136649f670a345e16c1c88d21a97d2'
          '6e5ea06076c85fdd25b79bfc41588f7f7ee9ba29')

prepare() {
    cd "${srcdir}/Remarkable-${pkgver}-1"
    patch -Np1 -i "${srcdir}/remarkable.patch"

}
package() {
    _python_site=$(python -c 'import site; print(site.getsitepackages()[0]);')
    [ -z ${_python_site} ] && echo "error: could not identify python site_packages directory" && return 1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    cd "Remarkable-${pkgver}-1"

    install -Dm 755 "bin/remarkable" "${pkgdir}/usr/bin/remarkable"
    install -D "debian/remarkable.mime" "${pkgdir}/usr/lib/mime/packages/remarkable"
    install -D "data/media/remarkable.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/remarkable.svg"
    install -D remarkable.desktop "${pkgdir}/usr/share/applications/remarkable.desktop"
    
    mv data/glib-2.0 "${pkgdir}/usr/share/"

    install -d "${pkgdir}/${_python_site}"
    mv markdown pdfkit remarkable remarkable_lib "${pkgdir}/${_python_site}/"

    mv data "${pkgdir}/usr/share/remarkable/"
}
