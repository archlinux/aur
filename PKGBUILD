# Maintainer: mlunax <lunax@mlunax.com>

pkgname=haruhi-dl
pkgver=2021.06.24.1
_name="haruhi-dl-v$pkgver"
pkgrel=2
pkgdesc="Fork of youtube-dl, focused on bringing a fast, steady stream of updates. We'll do our best to merge patches to any site, not only youtube."
arch=('any')
url="https://haruhi.download"
license=('custom')
depends=('python' 'python-setuptools')
makedepends=('git')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files')
provides=("haruhi-dl")
source=("haruhi-dl.tar.gz::https://git.sakamoto.pl/laudompat/haruhi-dl/-/archive/v$pkgver/$_name.tar.gz")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  python -m haruhi_dl --version
}

prepare() {
  cd "$srcdir/$_name"
  sed -i 's|etc/bash_completion.d|share/bash-completion/completions|' setup.py
  sed -i 's|etc/fish/completions|share/fish/completions|' setup.py
}

build() {
  cd "$srcdir/$_name"
  make zsh-completion
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 haruhi-dl.plugin.zsh "${pkgdir}/usr/share/zsh/site-functions/_haruhi-dl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
