pkgname=ytdl-dmca-repo
_gitname="youtube-dl"
pkgver=416da574e
pkgrel=1
pkgdesc="youtube-dl-git but the source is from GitHub's DMCA repo. Refer https://www.reddit.com/r/programming/comments/jhlhok/someone_replaced_the_github_dmca_repo_with/"
arch=('any')
url="http://ytdl-org.github.io/youtube-dl/"
license=('custom')
depends=('python' 'python-setuptools')
makedepends=('git' 'pandoc')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files'
            'phantomjs: for openload support')
provides=("youtube-dl")
conflicts=("youtube-dl")
source=('youtube-dl::git+https://github.com/github/dmca.git#commit=416da574ec0df3388f652e44f7fe71b1e3a4701f')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "%s" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_gitname
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/completions|' setup.py
}

build() {
  cd $_gitname
  make pypi-files zsh-completion
}

package() {
  cd $_gitname
  python setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}/usr/share/bash-completion/completions/youtube-dl.bash-completion" \
     "${pkgdir}/usr/share/bash-completion/completions/youtube-dl"
  install -Dm644 youtube-dl.zsh "${pkgdir}/usr/share/zsh/site-functions/_youtube-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
