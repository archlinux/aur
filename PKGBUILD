# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=youtube-dl
pkgver=2021.03.03
pkgrel=1
pkgdesc="A command-line program to download videos from YouTube.com and a few more sites"
arch=('any')
url="https://ytdl-org.github.io/youtube-dl/"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=("https://github.com/ytdl-org/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('eee0cc1d9644f1c166f4bd41b2fe9ba001f41f34ac828246a00bc4d82adae287'
            'SKIP')
validpgpkeys=('ED7F5BF46B3BBED81C87368E2C393E0F18A9236D') # Sergey M. <dstftw@gmail.com>

prepare() {
  cd ${pkgname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  mv "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash-completion" \
     "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 ${pkgname}.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
