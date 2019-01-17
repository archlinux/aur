# Maintainer: Eric Bélanger <eric@archlinux.org>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=youtube-dl
pkgver=2019.01.17
pkgrel=1
pkgdesc="A small command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="http://rg3.github.io/youtube-dl/"
license=('custom')
depends=('python' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=(http://youtube-dl.org/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha256sums=('278f04408ce2f80d58843b1d4ab1b5e5fa913269bd728a13970bac803697aa3b'
            'SKIP')
validpgpkeys=('7D33D762FD6C35130481347FDB4B54CBA4826A18'  # Philipp Hagemeister
              'ED7F5BF46B3BBED81C87368E2C393E0F18A9236D') # Sergey M.

prepare() {
  cd ${pkgname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/completions|' setup.py
}

package() {
  cd ${pkgname}
  python setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dl.bash-completion" \
     "${pkgdir}/usr/share/bash-completion/completions/youtube-dl"
  install -Dm644 youtube-dl.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
