# Maintainer: mlunax <lunax@mlunax.com>

pkgname=haruhi-dl
pkgver=2021.06.24.1
_name="$pkgname-v$pkgver"
pkgrel=4
pkgdesc="Fork of youtube-dl, focused on bringing a fast, steady stream of updates. We'll do our best to merge patches to any site, not only youtube."
arch=('any')
url="https://haruhi.download"
license=('LGPL3')
depends=('python' 'python-setuptools')
makedepends=('git')
optdepends=('ffmpeg: for video post-processing'
            'rtmpdump: for rtmp streams support'
            'atomicparsley: for embedding thumbnails into m4a files')
provides=("haruhi-dl")
source=("$pkgname.tar.gz::https://git.sakamoto.pl/laudompat/$pkgname/-/archive/v$pkgver/$_name.tar.gz")
md5sums=('SKIP')

# pkgver() {
#   cd "$srcdir/$_name"
#   python -m haruhi_dl --version
# }

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
  python devscripts/prerelease_codegen.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 $pkgname.plugin.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

