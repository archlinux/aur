# Contributor: vantu5z <vantu5z@mail.ru>

pkgname=vasisualy-vosk-git
pkgver=0.8.1
pkgrel=2
pkgdesc="Vasisualy is a simple Russian voice assistant written on python 3 for GNU/Linux and Windows with offline voice recognition by Vosk."
arch=('i686' 'x86_64')
url="https://github.com/Oknolaz/vasisualy/tree/free-speech"
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
         'python-translate'
         'python-vlc'
         'python-wikipedia'
         'python-fuzzywuzzy'
         'python-vosk'
         'python-tqdm'
        )
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-vosk-git}")
conflicts=("${pkgname%-vosk-git}")
source=($pkgname::'git+https://github.com/Oknolaz/vasisualy.git#branch=free-speech'
        ${pkgname}-files::'git+https://github.com/Oknolaz/vasisualy-additional-files.git'
        ru_w2n::'git+https://github.com/Oknolaz/Russian_w2n.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${pkgname}"
    echo $(python setup.py --version)
}

prepare() {
    cd "${pkgname}"
    # apply fix, see: https://github.com/Oknolaz/vasisualy/pull/14
    if grep -q "fixes" <<<$(git remote); then
      git fetch fixes
    else
      git remote add -f fixes git@github.com:vantu5z/vasisualy.git
    fi
    git merge fixes/free-speech

    # get sub-modules
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation

    cd "${srcdir}/ru_w2n"
    python -m build --wheel --no-isolation
}

package()
{
    cd "${pkgname}-files"
    install -Dm0755 "vasisualy.desktop" "${pkgdir}/usr/share/applications/vasisualy.desktop"
    install -Dm0644 "vasisualy.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vasisualy.svg"

    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0755 "run.py" "${pkgdir}/usr/bin/vasisualy"
    install -Dm0644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

    cd "${srcdir}/ru_w2n"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 LICENSE.txt  "${pkgdir}/usr/share/licenses/ru_w2n/LICENSE"
}
