# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2020.11.01.1
pkgrel=1
pkgdesc="A command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="https://yt-dl.org"
license=('custom')
depends=('python' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=("${url}/downloads/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('7a62187bc9f91af42eb5c9c95652e350170a72dbbdac8c7d71a6aeb4885a901a'
            'SKIP')
validpgpkeys=('ED7F5BF46B3BBED81C87368E2C393E0F18A9236D') # Sergey M.

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
