# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=lincheney/rl_custom_isearch
_source_type=github-releases
_upstreamver=$(date +%Y%m%d)
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=$_pkgname-git
pkgver=r26.6bb8888
pkgrel=1
pkgdesc="$(gh repo view --json description -q .description $_repo)"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/$_repo
depends=(readline fzf)
makedepends=(rust cargo)
license=(GPL3)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
# source=("$_pkgname::$url/archive/$_upstreamver.tar.gz")
source=("$_pkgname::git+https://github.com/$_repo")
# _arch="$(uname -m|sed s/x86_64/amd64/)"
# _os="${OSTYPE%%-*}"
# [[ $_os == windows ]] && _ext=zip || _ext=tar.gz
# source=("$_pkgname::$url/releases/download/$_upstreamver/${pkgname}_${_os}_${_arch}.$_ext")
# source=("$_pkgname::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$pkgname-$pkgver.tar.gz")
# _py=py2.py3
# source=("$_pkgname::https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
  touch main.c
  gcc -m32 -shared main.c -o librl_custom_isearch.so
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 target/release/*.so -t $pkgdir/usr/lib
  install -Dm755 bin/* -t $pkgdir/usr/bin
  install -Dm644 README.md -t $pkgdir/usr/share/doc/$_pkgname
  install -Dm644 librl_custom_isearch.so -t $pkgdir/usr/lib32
}
