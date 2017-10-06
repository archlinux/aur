# Maintainer: Mikael Blomstrand <chawlindel@gmail.com>

pkgname=remarkable-webkit2gtk
provides=('remarkable')
conflicts=('remarkable')
pkgver=1.87
pkgrel=1
pkgdesc="A free fully featured markdown editor for Linux. - Ported to webkit2gtk"
arch=('i686' 'x86_64')
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
source=("remarkable_${pkgver}_all.deb::http://remarkableapp.github.io/files/remarkable_${pkgver}_all.deb"
        "remarkable.install"
        "http://raw.githubusercontent.com/timeraider4u/Remarkable/2cce6ea49696927300d324637255d3c2cd377e8b/remarkable/RemarkableWindow.py"
        "http://raw.githubusercontent.com/timeraider4u/Remarkable/2cce6ea49696927300d324637255d3c2cd377e8b/data/ui/RemarkableWindow.ui")
sha1sums=('95f45865faecc86cc0f7d84d78b0c87c834bf405'
          'bdbfb750df9e5fb3022f47a46a80555259628cd1'
          '0eda512ff55fd570612587e252b37582b4f0c288'
          '0482be20f02314614ea9b2e3650788146f38196b')

package() {
    _python_site=$(python -c 'import site; print(site.getsitepackages()[0]);')
    [ -z ${_python_site} ] && echo "error: could not identify python site_packages directory" && return 1

    msg2 "Extracting data.tar.gz..."
    tar -Jxf data.tar.xz -C "${pkgdir}/"

    ls $pkgdir

    msg2 "Patching..."
    install RemarkableWindow.py ${pkgdir}/usr/lib/python3/dist-packages/remarkable/RemarkableWindow.py
    install RemarkableWindow.ui ${pkgdir}/usr/share/remarkable/ui/RemarkableWindow.ui

    msg2 "Moving parts in place..."

    # python
    install -d "${pkgdir}/${_python_site}"
    mv  "${pkgdir}/usr/lib/python3/dist-packages/"* "${pkgdir}/${_python_site}/"

    # license
    install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
    curl -Ls "${url}/license.txt" \
         -o "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

    msg2 "Fixing module include path..."
    sed -i "s/import styles/from remarkable import styles/" \
           "${pkgdir}/${_python_site}/remarkable/RemarkableWindow.py"

    msg2 "Removing unnecessities..."
    rm -r "${pkgdir}/usr/lib/mime"
}

# vim:set ts=4 sw=4 et:
