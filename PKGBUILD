# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=vasisualy-git
pkgver=0.6.2
pkgrel=1
pkgdesc="Vasisualy is a simple Russian voice assistant written on python 3 for GNU/Linux and Windows."
arch=('i686' 'x86_64')
url="https://github.com/Oknolaz/vasisualy"
license=('GPL3')
depends=('python>3' 'rhvoice' 'speech-dispatcher' 'python-pyqt5' 'python-vlc'
         'python-shell' 'python-pyowm' 'python-mss' 'python-wikipedia'
         'python-geocoder' 'python-translate' 'python-lxml' 'python-sounddevice'
         'python-beautifulsoup4' 'python-qt-material' 'python-speechrecognition')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::'git+https://github.com/Oknolaz/vasisualy.git'
        ${pkgname}-pi::'git+https://github.com/Oknolaz/vasisualy-pi.git'
        ${pkgname}-files::'git+https://github.com/Oknolaz/vasisualy-additional-files.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd ${pkgname}
    echo $(python setup.py --version)
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build

    cd "${srcdir}/${pkgname}-pi"
    python setup.py build
}

package()
{
    cd "${pkgname}-files"
    install -Dm0755 "vasisualy.desktop" "${pkgdir}/usr/share/applications/vasisualy.desktop"

    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm0755 "run.py"     "${pkgdir}/usr/bin/vasisualy"
    install -Dm0644 "vasisualy/ui/vas.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/vasisualy.png"
    install -Dm0644 LICENSE      "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

    cd "${srcdir}/${pkgname}-pi"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm0755 "run.py" "${pkgdir}/usr/bin/vasisualy-pi"
    install -Dm0644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname%-git}-pi/LICENSE"
}
