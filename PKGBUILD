# Maintainer: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlp
_gitname=yt-dlp
pkgver=2021.01.24_1
_gitpkgver="2021.01.24-1"
pkgrel=1
pkgdesc="Fork of youtube-dlc - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/pukkandan/yt-dlp"
license=('Unlicense')
depends=('python')
makedepends=('git' 'pandoc' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=("https://github.com/pukkandan/${_gitname}/archive/${_gitpkgver}.tar.gz")
provides=('youtube-dlc')
conflicts=('youtube-dlc')
sha256sums=('a72fc02e79e8da385d90c1dc3056c0c42a8a9f8a6baa7bca79d2dbee2c19301f')

prepare() {
  cd ${_gitname}-${_gitpkgver}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}-${_gitpkgver}
  make PREFIX="${pkgdir}/usr" README.txt youtube-dlc.1 bash-completion zsh-completion fish-completion
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_gitname}-${_gitpkgver}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Completions fix
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dlc"{.bash-completion,}
  install -Dm644 youtube-dlc.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dlc"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
