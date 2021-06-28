# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=vasisualy-git
pkgver=0.7.0
pkgrel=1
pkgdesc="Vasisualy is a simple Russian voice assistant written on python 3 for GNU/Linux and Windows."
arch=('i686' 'x86_64')
url="https://github.com/Oknolaz/vasisualy"
license=('GPL3')
depends=('rhvoice' 'speech-dispatcher'
         'python>3'
         'python-beautifulsoup4'
         'python-geocoder'
         'python-lxml'
         'python-mss'
         'python-plyer'
         'python-pyaudio'
         'python-pyalsaaudio'
         'python-pyowm'
         'python-pyqt5'
         'python-pyqt5-webengine'
         'python-qt-material'
         'python-scipy'
         'python-sounddevice'
         'python-speechrecognition'
         'python-translate'
         'python-vlc'
         'python-wikipedia')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::'git+https://github.com/Oknolaz/vasisualy.git'
        ${pkgname}-pi::'git+https://github.com/Oknolaz/vasisualy-pi.git'
        ${pkgname}-files::'git+https://github.com/Oknolaz/vasisualy-additional-files.git'
        ru_w2n::'git+https://github.com/Oknolaz/Russian_w2n.git')
sha256sums=('SKIP'
            'SKIP'
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

    cd "${srcdir}/ru_w2n"
    python setup.py build
}

package()
{
    cd "${pkgname}-files"
    install -Dm0755 "vasisualy.desktop" "${pkgdir}/usr/share/applications/vasisualy.desktop"
    install -Dm0644 "vasisualy.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vasisualy.svg"

    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm0755 "run.py" "${pkgdir}/usr/bin/vasisualy"
    install -Dm0644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

    cd "${srcdir}/${pkgname}-pi"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm0755 "run.py" "${pkgdir}/usr/bin/vasisualy-pi"
    install -Dm0644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname%-git}-pi/LICENSE"

    cd "${srcdir}/ru_w2n"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm0644 LICENSE.txt  "${pkgdir}/usr/share/licenses/ru_w2n/LICENSE"
}
