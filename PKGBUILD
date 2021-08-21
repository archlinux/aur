# Maintainer: Hekuran <https://hekuran.ga https://hekuran.gitlab.io>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Julius <com dot gmail at julius dot dehner>
# Contributor: vixfwis <com dot gmail at vixfwis>

pkgname=youtube-dlp-git
_gitname=yt-dlp
pkgver=2021.08.10.32.gf79ec47d7
pkgrel=1
pkgdesc="Fork of youtube-dlc - download videos from youtube.com or other video platforms"
arch=('any')
url="https://github.com/${_gitname}/${_gitname}"
license=('Unlicense')
depends=(
  'python'
  'python-mutagen'
  'python-pycryptodome'
  'python-websockets'
)
makedepends=('git' 'glibc' 'pandoc-bin' 'python-setuptools' 'make')
optdepends=(
  'ffmpeg: for video post-processing'
  'rtmpdump: for rtmp streams support'
  'atomicparsley: for embedding thumbnails into m4a files'
  'aria2: for using aria2 as external downloader'
)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
	git describe --tags | sed 's/[ :;-]/./g'
}

prepare() {
  cd ${_gitname}
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/vendor_completions.d|' setup.py
}

build() {
  cd ${_gitname}
  make PREFIX="${pkgdir}/usr" README.txt yt-dlp.1 completion-bash completion-zsh completion-fish
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_gitname}
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
