# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=yt-dlp-git
pkgver=2021.08.02.r38.gb6a35ad83
pkgrel=1
pkgdesc='A youtube-dl fork with additional features and fixes (git)'
arch=(any)
url=https://github.com/yt-dlp/yt-dlp
license=(Unlicense)
depends=(python python-mutagen python-pycryptodome python-websockets)
makedepends=(git glibc pandoc python-setuptools)
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
sha256sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
    sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
    cd "${pkgname%-git}"
    make PREFIX="${pkgdir}/usr" README.txt yt-dlp.1 completion-bash completion-zsh completion-fish
    export PYTHONHASHSEED=0
    python setup.py build
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
