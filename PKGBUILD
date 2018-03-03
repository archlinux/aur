# Maintainer: Mikael Blomstrand <gmail: chawlindel>

pkgname='remarkable-git'
conflicts=('remarkable')
provides=('remarkable')
pkgver=1.87
pkgrel=1
pkgdesc="A free fully featured markdown editor for Linux."
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
         'webkitgtk'
         'wkhtmltopdf'
         'gtksourceview3'
         )
makedepends=('python')
optdepends=('python-lxml: export to HTML format support')

install="remarkable.install"
source=("git+https://github.com/jamiemcg/Remarkable.git"
        "remarkable.install"
        "undo-findBar.patch"
        "LICENSE")

sha1sums=('SKIP'
          'bdbfb750df9e5fb3022f47a46a80555259628cd1'
          '76a8a61ed2bcf08e71971a52597fb4b638963a2c'
          '6e5ea06076c85fdd25b79bfc41588f7f7ee9ba29')

prepare() {
    msg2 "Removing findbar patches.."
    msg2 "Fix imports in RemarkableWindow.py"
    # Does not run with findbar patches.
    # Also changes imports in RemarkableWindow
    cat *.patch | patch -p1 -d "${srcdir}/Remarkable"
}

package() {
    _python_site=$(python -c 'import site; print(site.getsitepackages()[0]);')
    [ -z ${_python_site} ] && echo "error: could not identify python site_packages directory" && return 1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    cd "Remarkable"

    install -Dm 755 "bin/remarkable" "${pkgdir}/usr/bin/remarkable"
    install -D "debian/remarkable.mime" "${pkgdir}/usr/lib/mime/packages/remarkable"
    install -D "data/media/remarkable.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/remarkable.svg"
    install -D remarkable.desktop "${pkgdir}/usr/share/applications/remarkable.desktop"
    
    cp -r data/glib-2.0 "${pkgdir}/usr/share/"

    install -d "${pkgdir}/${_python_site}"
    cp -r markdown pdfkit remarkable remarkable_lib "${pkgdir}/${_python_site}/"

    cp -r data "${pkgdir}/usr/share/remarkable/"
}
