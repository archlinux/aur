# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp
pkgver=2021.10.22
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/yt-dlp/yt-dlp/archive/${pkgver}.tar.gz")
sha256sums=('63f267cb0f2e9d18afc8e51267be2a13ce60030eab7c04b25b94d6b90d2ba6d3')

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
