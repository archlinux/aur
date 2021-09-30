# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp
pkgver=2021.09.25
pkgrel=2
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
source=("https://github.com/yt-dlp/yt-dlp/archive/${pkgver}.tar.gz")
sha256sums=('8d2e5ab7dd143a1c11731eb6e9b05ebe327184e01d820e2a0a27ef9ee5f5a04b')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
    sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
    cd "$pkgname-$pkgver"
    make PREFIX="${pkgdir}/usr" README.txt yt-dlp.1 completion-bash completion-zsh completion-fish
    export PYTHONHASHSEED=0
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
