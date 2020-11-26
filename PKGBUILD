# Maintainer: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlc
_gitname=yt-dlc
pkgver=2020.11.11_3
_gitpkgver="2020.11.11-3"
pkgrel=2
pkgdesc="Fork of youtube-dl - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/blackjack4494/yt-dlc"
license=('custom')
depends=('python')
makedepends=('git' 'pandoc' 'python-setuptools')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'python-pycryptodome: for hlsnative downloader')
source=("https://github.com/blackjack4494/${_gitname}/archive/${_gitpkgver}.tar.gz")
sha256sums=('649f8ba9a6916ca45db0b81fbcec3485e79895cec0f29fd25ec33520ffffca84')

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
