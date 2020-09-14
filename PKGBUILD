# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2020.09.14
pkgrel=1
pkgdesc="A command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="https://ytdl-org.github.io/youtube-dl/"
license=('custom')
depends=('python' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=("https://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('0657c19661bbec99117a2eb2b5a2d26d3f0b0a58703035f1ebf76bb5f2858ea3'
            'SKIP')
validpgpkeys=('7D33D762FD6C35130481347FDB4B54CBA4826A18'  # Philipp Hagemeister
              'ED7F5BF46B3BBED81C87368E2C393E0F18A9236D') # Sergey M.

prepare() {
  cd ${pkgname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${pkgname}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dl.bash-completion" \
     "${pkgdir}/usr/share/bash-completion/completions/youtube-dl"
  install -Dm644 youtube-dl.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
