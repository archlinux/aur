# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl> 
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: sausageandeggs <s_stoakley at hotmail.co.uk>

pkgname=singularity-git
_pkgname=singularity
pkgver=r1964.a8510bd
pkgrel=1
pkgdesc="Strategy game - simulation of true AI, git version"
arch=('any')
url="http://emhsoft.com/singularity/index.html"
license=('GPL2' 'custom')
depends=('python-pygame' 'python-numpy' 'python-polib')
makedepends=('git' 'python-setuptools')
conflicts=('singularity')
source=(  "git+https://github.com/singularity/singularity"
                "git+https://github.com/singularity/singularity-music.git"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    python setup.py build
}

package() {
  cd $_pkgname

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # music
  cp -R "$srcdir"/singularity-music/music  "$pkgdir"/usr/lib/python3.9/site-packages/singularity/music
  
  
  # desktop file
  install -Dm644 singularity.desktop "$pkgdir"/usr/share/applications/singularity.desktop

  # license: code is GPL2, but data & music fall under other licenses
  install -Dm644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
  install -m644 LICENSE.* "$pkgdir"/usr/share/licenses/$pkgname/
}

