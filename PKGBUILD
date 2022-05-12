# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=lyokha/g3kb-switch
_source_type=github-releases
_upstreamver='1.1'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="$(gh repo view --json description -q .description $_repo)"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/$_repo
depends=(glib2)
makedepends=(cmake bash-completion)
license=(UNLICENSE)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::$url/archive/$_upstreamver.tar.gz")
# _arch="$(uname -m|sed s/x86_64/amd64/)"
# _os="${OSTYPE%%-*}"
# [[ $_os == windows ]] && _ext=zip || _ext=tar.gz
# source=("$_pkgname-$pkgver::$url/releases/download/$_upstreamver/${pkgname}_${_os}_${_arch}.$_ext")
# source=("$_pkgname-$pkgver::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$pkgname-$pkgver.tar.gz")
# _py=py2.py3
# source=("$_pkgname-$pkgver::https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('9d4f093c482a03064c185c8ff22feafcf9f81b84f4d99ff9ec69d7939a681cdb')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DG3KBSWITCH_WITH_GNOME_SHELL_EXTENSION=ON -DCMAKE_INSTALL_PREFIX=/usr .
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
	cp -r extension/*/ -t "$pkgdir/usr/share/gnome-shell/extensions"
	# python setup.py install --root="$pkgdir" --optimize=1 || return 1
	# cd "$srcdir"
	# cp -L "$_pkgname-$pkgver" "${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
	# python -m installer --destdir="$pkgdir" *.whl || return 1
}
