# Maintainer: Shane Chen <ss1ha3tw@gmail.com>
# Contributor: Oliver Paschke <oli.paschke@gmail.com>

pkgname=nginx-mod-auth-ldap-git
pkgver=1.22.1_1.r158.83c059b
pkgrel=1

_modname=nginx-auth-ldap

pkgdesc='LDAP Authentication module for nginx'
arch=('i686' 'x86_64')
depends=('nginx' 'libldap')
makedepends=('nginx-src' 'git')
url="https://github.com/kvspb/nginx-auth-ldap"
license=('BSD')

source=(git+https://github.com/kvspb/nginx-auth-ldap.git)

sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/$_modname
    PACMAN_OUTPUT=($(pacman -Qe nginx))
    NGINX_VERSION=${PACMAN_OUTPUT[1]//-/_}
    printf "%s.r%s.%s" "$NGINX_VERSION" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

