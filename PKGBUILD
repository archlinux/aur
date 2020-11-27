# Maintainer: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlc-git
_gitname=yt-dlc
pkgver=2020.10.31.r80.g17fbbff94
pkgrel=1
pkgdesc="Fork of youtube-dl - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/blackjack4494/yt-dlc"
license=('custom')
depends=('python' 'python-setuptools')
makedepends=('git' 'pandoc' 'zip')
conflicts=('youtube-dlc')
provides=('youtube-dlc')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=("git+https://github.com/blackjack4494/${_gitname}")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_gitname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}
  make PREFIX="${pkgdir}/usr" README.txt youtube-dlc.1 bash-completion zsh-completion fish-completion
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_gitname}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Completions fix
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dlc"{.bash-completion,}
  install -Dm644 youtube-dlc.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dlc"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
