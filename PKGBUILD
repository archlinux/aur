# Maintainer: tarball <bootlctl@gmail.com>

pkgname=youtube-dl-nightly
pkgver=2025.03.11
pkgrel=1
pkgdesc='A command-line program to download videos from YouTube.com and a few more sites'
arch=('any')
url='https://ytdl-org.github.io/youtube-dl'
license=('Unlicense')
depends=('python')
provides=('youtube-dl')
conflicts=('youtube-dl')
makedepends=('python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader'
            'python-pycryptodomex: for ivi extractor'
            'python-brotli: support for the Brotli compression format'
            'aria2: alternative parallel downloader')
source=("https://github.com/ytdl-org/ytdl-nightly/releases/download/${pkgver}/youtube-dl-${pkgver}.tar.gz")
sha256sums=('08f988e49c587611a16ae83001cd0533a069b155225bc4e315eb4d7017a74696')

prepare() {
  cd youtube-dl
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd youtube-dl
  python setup.py build
}

package() {
  cd youtube-dl
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dl.bash-completion" \
     "${pkgdir}/usr/share/bash-completion/completions/youtube-dl"
  install -Dm644 youtube-dl.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dl"
}
