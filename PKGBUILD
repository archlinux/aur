# Maintainer: Oliver Paschke <oli.paschke@gmail.com>

pkgname=nginx-mainline-mod-auth-ldap-git
pkgver=r139.22d1e84
pkgrel=2

_modname=nginx-auth-ldap
_nginxver=1.15.6

pkgdesc='LDAP Authentication module for nginx'
arch=('i686' 'x86_64')
depends=('nginx-mainline' 'libldap')
makedepends=('git')
url="https://github.com/kvspb/nginx-auth-ldap"
license=('BSD')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz
    git+https://github.com/kvspb/nginx-auth-ldap.git
)

sha256sums=('a3d8c67c2035808c7c0d475fffe263db8c353b11521aa7ade468b780ed826cc6'
            'SKIP')

pkgver() {
    cd "$srcdir"/$_modname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir"/nginx-$_nginxver
    ./configure --with-compat --add-dynamic-module=../$_modname
    make modules
}

package() {
    install -Dm644 "$srcdir"/$_modname/LICENSE \
                   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    cd "$srcdir"/nginx-$_nginxver/objs
    for mod in *.so; do
        install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
    done
}
