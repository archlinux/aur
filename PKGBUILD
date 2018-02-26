# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_module=spnego-http-auth-nginx-module
_nginx=$(command -v nginx > /dev/null && nginx -v 2>&1 | awk -F'nginx/' '{print $NF}')

pkgname=${_module}-git
pkgver=1.13.9.7e028a5
pkgrel=1
pkgdesc='Dynamic Nginx module for SPNEGO Kerberos authentication via GSSAPI'
arch=('x86_64')
url='https://github.com/stnoonan/spnego-http-auth-nginx-module'
license=('BSD')
depends=('nginx' 'krb5')
source=("${pkgname}::git+https://github.com/stnoonan/${_module}.git"
        "https://nginx.org/download/nginx-${_nginx}.tar.gz"
        "https://nginx.org/download/nginx-${_nginx}.tar.gz.asc")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "${_nginx}".$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/nginx-${_nginx}"
  ./configure --with-compat --add-dynamic-module=../"${pkgname}"
  make modules
}

package() {
  cd "${srcdir}"
  install -Dm755 "nginx-${_nginx}"/objs/ngx_http_auth_spnego_module.so "${pkgdir}"/usr/lib/nginx/modules/ngx_http_auth_spnego_module.so
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
