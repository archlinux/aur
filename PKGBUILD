# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp
pkgver=2021.09.25
pkgrel=1
pkgdesc='A youtube-dl fork with additional features and fixes'
arch=(any)
url=https://github.com/yt-dlp/yt-dlp
license=(Unlicense)
depends=(python python-mutagen python-pycryptodome python-websockets)
makedepends=(git glibc pandoc python-setuptools)
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader')
source=("https://github.com/yt-dlp/yt-dlp/releases/download/${pkgver}/yt-dlp.tar.gz")
sha256sums=('ae08e0b56fea59a8bfdadacd92eddc9bdfdc1473199178cb4e31bacfd991864a')

prepare() {
    cd "$pkgname"
    sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
    sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
    cd "$pkgname"
    make PREFIX="${pkgdir}/usr" README.txt yt-dlp.1 completion-bash completion-zsh completion-fish
    export PYTHONHASHSEED=0
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
