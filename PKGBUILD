# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: epitron <chris@ill-logic.com>

pkgname=gitless
pkgver=0.8.8.r755.g29cbb1d
_tag=29cbb1d
pkgrel=1
pkgdesc="A scientifically proven easier-to-use git interface"
arch=("any")
url="https://github.com/goldstar611/gitless"
license=("GPL")
depends=('python' 'git' 'python-pygit2>=1.4.0' 'python-setuptools' 'python-argcomplete')
source=("git+https://github.com/goldstar611/gitless#tag=$_tag"
        '0001-Update-requirements.patch')
sha256sums=('SKIP'
            '9292178088444151044d90ae3b8897d54f93cf7255f21e9d6cb55d1cbe1f238c')

pkgver() {
  cd $pkgname

  _ver="$(cat $pkgname/cli/gl.py | grep -m1 __version__ | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
