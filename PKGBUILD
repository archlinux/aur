# Maintainer: Masato Toyoshima <phoepsilonix@gmail.com>

pkgname=nginx-quic-mod-brotli
epoch=1
pkgver=1.0.9
pkgrel=5

_commit=6e975bcb015f62e1f303054897783355e2a877dc
_modname="ngx_${pkgname#nginx-quic-mod-}"
if [[ $CC=="clang" ]];then
    _cc_opt="-fPIC"
    _ld_opt="$LDFLAGS -fPIC -fuse-ld=ld"
fi

pkgdesc="Brotli compression filter module for nginx"
arch=('x86_64')
depends=("nginx" 'brotli')
makedepends=("nginx-quic-src" "git")
url="https://github.com/google/ngx_brotli"
license=('CUSTOM')

source=(
	"git+https://github.com/google/$_modname#commit=$_commit"
)
validpgpkeys=(536487F1470D7187) # <phoepsilonix@gmail.com>
sha256sums=('SKIP')

prepare() {
        echo $_modname
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src

	cd "$srcdir"/$_modname
	sed 's@/usr/local@/usr@' -i config
}

build() {
	cd build
	/usr/src/nginx/configure --with-compat --add-dynamic-module=../$_modname --with-cc-opt="$_cc_opt" --with-ld-opt="$_ld_opt"
	make modules
}

package() {
	install -Dm644 "$srcdir"/$_modname/LICENSE \
	               "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	cd build/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
