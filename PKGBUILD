# Maintainer: Masato Toyoshima <phoepsilonix@gmail.com>

pkgname=nginx-quic-mod-brotli
epoch=1
pkgver=1.1.0
pkgrel=2

_commit=659b4b3e16ef1066988233ef2d6ea5ea34e8443b
_modname="ngx_${pkgname#nginx-quic-mod-}"
if [[ $CC=="clang" ]];then
    _cc_opt="-fPIC"
    _ld_opt="$LDFLAGS -fPIC -fuse-ld=lld"
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
validpgpkeys=(4DC505BB1FBD8202E725BECC57B49CC5AA4F00FC) # <phoepsilonix@phoepsilonix.love>
sha256sums=('SKIP')

prepare() {
        echo $_modname
	mkdir -p build
	cd build
	ln -sf /usr/src/nginx/auto
	ln -sf /usr/src/nginx/src

	cd "$srcdir"/$_modname
	sed 's@/usr/local@/usr@' -i config
        git submodule update --init
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
