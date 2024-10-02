# Contributor: Massimiliano Torromeo
# PKGBUILD adapted from nginx-mod-echo

pkgname=nginx-mod-http-knock
pkgver=r11.3afcd02
pkgrel=1
_commit=3afcd025ad3eda80fbe21eb606d1ce14ae614d4c # pin last commit
pkgdesc='Nginx module ngx_http_knock_module to guard websites with a secret handshake'
arch=('x86_64')
url="https://github.com/PhillipTaylor/ngx_http_knock_module"
license=('MIT')
makedepends=('nginx' 'nginx-src' 'git')
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('62ab79a3e46adbf44d427c3dbe99ac16853aa2c45a6e14b8d88cb92a3765fe2e')

pkgver() {
    cd $pkgname
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
    mkdir -p build
    cd build
    ln -sf /usr/src/nginx/auto
    ln -sf /usr/src/nginx/src
}

build() {
    cd build
    /usr/src/nginx/configure \
        --with-ld-opt="$LDFLAGS" \
        --with-compat \
        --add-dynamic-module=../$pkgname
    make modules
}

package() {
    local _nginx_version=$(nginx -v 2>&1 | sed 's|^.*/||')
    depends+=("nginx=${_nginx_version}")

    install -Dm644 $pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    cd build/objs
    install -Dm755 -t "$pkgdir"/usr/lib/nginx/modules/$mod *.so
}
