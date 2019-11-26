# Maintainer: Mikael Blomstrand <gmail: chawlindel>

pkgname='remarkable-git'
conflicts=('remarkable')
provides=('remarkable')
pkgver=1.87.r44.gf4ac3d4
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
         'python-lxml'
         'python-setuptools'
         'webkit2gtk'
         'wkhtmltopdf'
         'gtksourceview3'
         )
makedepends=('python' 'git')
optdepends=('python-gtkspellcheck: Spellcheck (might cause problems)')

install="remarkable.install"
source=("git+https://github.com/jamiemcg/Remarkable.git"
        "remarkable.install")

sha1sums=('SKIP'
          'bdbfb750df9e5fb3022f47a46a80555259628cd1')

pkgver() {
  cd Remarkable
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    msg "Fixing imports..."

    msg2 "import styles"
    sed -i "s/import styles/from remarkable import styles/" \
        "Remarkable/remarkable/RemarkableWindow.py"

    msg2 "import FindBar"
    sed -i "s/from findBar import FindBar/from remarkable.findBar import FindBar/" \
        "Remarkable/remarkable/RemarkableWindow.py"
}

package() {
    _python_site=$(python -c 'import site; print(site.getsitepackages()[0]);')
    [ -z ${_python_site} ] && echo "error: could not identify python site_packages directory" && return 1

    cd "Remarkable"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm 755 "bin/remarkable" "${pkgdir}/usr/bin/remarkable"
    install -D "debian/remarkable.mime" "${pkgdir}/usr/lib/mime/packages/remarkable"
    install -D "data/media/remarkable.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/remarkable.svg"
    install -D remarkable.desktop "${pkgdir}/usr/share/applications/remarkable.desktop"
    
    cp -r data/glib-2.0 "${pkgdir}/usr/share/"

    install -d "${pkgdir}/${_python_site}"
    cp -r markdown pdfkit remarkable remarkable_lib "${pkgdir}/${_python_site}/"

    cp -r data "${pkgdir}/usr/share/remarkable/"
}
