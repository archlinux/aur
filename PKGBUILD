# Maintainer: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlp
_gitname=yt-dlp
pkgver=2021.03.21
_gitpkgver="2021.03.21"
pkgrel=1
pkgdesc="Fork of youtube-dlc - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/yt-dlp/yt-dlp"
license=('Unlicense')
depends=('python')
makedepends=('git' 'glibc' 'pandoc' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'aria2: for using aria2 as external downloader'
            'python-pycryptodome: for hlsnative downloader')
source=("https://github.com/yt-dlp/${_gitname}/archive/${_gitpkgver}.tar.gz")
provides=('yt-dlp')
sha256sums=('626716166e1a2099305e0a4aa9dedc133a66c5cca040b26386a9288ecb029fcf')

prepare() {
  cd ${_gitname}-${_gitpkgver}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}-${_gitpkgver}
  make PREFIX="${pkgdir}/usr" README.txt yt-dlp.1 completion-bash completion-zsh completion-fish
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_gitname}-${_gitpkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
