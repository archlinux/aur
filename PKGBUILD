# Maintainer: tarball <bootlctl@gmail.com>

pkgname=youtube-dl-nightly
pkgver=2024.06.12
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
sha256sums=('17bbc03b456d509ef7534cd428b7db43f0adb33f39e8a9eb085de31d20631e25')

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
  install -Dm644 -t "${pkgdir}/usr/share/licenses/youtube-dl" LICENSE
}
