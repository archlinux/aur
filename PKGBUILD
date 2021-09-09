# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlp
_gitname=yt-dlp
pkgver=2021.09.02
pkgrel=1
pkgdesc="Fork of youtube-dlc - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/yt-dlp/yt-dlp"
license=('Unlicense')
depends=(
  'python'
  'python-mutagen'
  'python-pycryptodome'
  'python-websockets'
)
makedepends=('git' 'glibc' 'pandoc' 'python-setuptools' 'make')
optdepends=(
  'ffmpeg: for video post-processing'
  'rtmpdump: for rtmp streams support'
  'atomicparsley: for embedding thumbnails into m4a files'
  'aria2: for using aria2 as external downloader'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/yt-dlp/${_gitname}/archive/${pkgver}.tar.gz")
provides=('yt-dlp')
sha256sums=('d73ab004bd4006103fe01d28870904005832bb9cfb758d2fdea8a5aba7ae2a8b')

prepare() {
  cd ${_gitname}-${pkgver}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}-${pkgver}
  make PREFIX="${pkgdir}/usr" README.txt yt-dlp.1 completion-bash completion-zsh completion-fish
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_gitname}-${pkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
