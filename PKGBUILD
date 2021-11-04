# Maintainer: Manuel Schmitzberger <ms@ms-sw.at>

pkgname=ycmd-git
_gitname=ycmd
pkgver=r2844.06228007
pkgrel=5
pkgdesc="A code-completion & code-comprehension server."
arch=('x86_64')
url="https://github.com/ycm-core/ycmd"
license=('GPLv3')
depends=('clang' 'python')
makedepends=('python' 'cmake' 'git' 'go' 'npm' 'jre-openjdk')
source=("git+https://github.com/ycm-core/ycmd")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_gitname"
  python3 build.py --all
}

package() {
  local trgtdir=usr/share/ycmd
  mkdir -p "$pkgdir/$trgtdir/third_party"
  cp -r "$srcdir/$_gitname/"{ycmd,ycm_core.*.so,CORE_VERSION,cpp} "$pkgdir/$trgtdir"
  cp -r "$srcdir/$_gitname/third_party/"{bottle,clang,generic_server,jedi_deps,mrab-regex,regex-build,tern_runtime,tsserver,watchdog_deps} \
      "$pkgdir/$trgtdir/third_party"
  find "$pkgdir" -name .git -exec rm -fr {} +
  rm -rf "$pkgdir/$trgtdir/ycmd/tests"
}
