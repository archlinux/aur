# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=nginx-mainline-mod-auth-ldap-git
pkgver=r158.83c059b
pkgrel=7

_modname=nginx-auth-ldap

pkgdesc='LDAP Authentication module for nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libldap')
makedepends=('nginx-mainline-src' 'git')
url="https://github.com/kvspb/nginx-auth-ldap"
license=('BSD')

source=(git+https://github.com/kvspb/nginx-auth-ldap.git)

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/$_modname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
    cd build
    ln -sf /usr/src/nginx/auto
    ln -sf /usr/src/nginx/src
}

build() {
    cd build
    /usr/src/nginx/configure --with-compat --with-http_ssl_module --add-dynamic-module=../$_modname
    make modules
}

package() {
    install -Dm644 "$srcdir"/$_modname/LICENSE \
                   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    cd build/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}

