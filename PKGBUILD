# Maintainer: tarball <bootlctl@gmail.com>

pkgname=youtube-dl-nightly
pkgver=2025.11.21
pkgrel=1
pkgdesc='A command-line program to download videos from YouTube.com and a few more sites'
arch=('any')
url='https://ytdl-org.github.io/youtube-dl'
license=('Unlicense')
depends=('python')
provides=('youtube-dl')
conflicts=('youtube-dl')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader'
            'python-pycryptodomex: for ivi extractor'
            'python-brotli: support for Brotli HTTP compression'
            'python-zstandard: support for zstd HTTP compression'
            'aria2: alternative parallel downloader')
source=("https://github.com/ytdl-org/ytdl-nightly/releases/download/${pkgver}/youtube-dl-${pkgver}.tar.gz")
sha256sums=('1f56dfd6af5acb3057e0681c20cfccd0150a27e06f7dc4589aba123bc935ceb8')

prepare() {
  cd youtube-dl
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd youtube-dl
  python -m build --wheel --no-isolation
}

package() {
  cd youtube-dl

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 youtube-dl.zsh "$pkgdir/usr/share/zsh/site-functions/_youtube-dl"

  cd "$pkgdir/usr/share/bash-completion/completions/"
  mv youtube-dl.bash-completion youtube-dl
}
