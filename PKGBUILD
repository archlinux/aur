# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=spnego-http-auth-nginx-module
pkgname=${_pkgname}-git
pkgver=1.18.0.72c8ee0
_nginxver=1.18.0
pkgrel=1
pkgdesc='Dynamic Nginx module for SPNEGO Kerberos authentication via GSSAPI'
arch=('x86_64')
url='https://github.com/stnoonan/spnego-http-auth-nginx-module'
license=('BSD')
depends=('nginx' 'krb5')
source=("${pkgname}::git+https://github.com/stnoonan/${_pkgname}.git"
        "https://nginx.org/download/nginx-${_nginxver}.tar.gz"
        "https://nginx.org/download/nginx-${_nginxver}.tar.gz.asc")
sha256sums=('SKIP'
            '4c373e7ab5bf91d34a4f11a0c9496561061ba5eee6020db272a17a7228d35f99'
            'SKIP')
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo "${_nginxver}".$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/nginx-${_nginxver}"
  ./configure --with-compat --add-dynamic-module=../"${pkgname}"
  make modules
}

package() {
  cd "${srcdir}"
  install -Dm755 "nginx-${_nginxver}"/objs/ngx_http_auth_spnego_module.so "${pkgdir}"/usr/lib/nginx/modules/ngx_http_auth_spnego_module.so
  install -Dm644 "${pkgname}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
