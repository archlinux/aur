# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_modname=ngx_dynamic_etag
_nginxver=1.19.2
pkgname=nginx-mainline-mod-dynamic-etag-git
pkgver=r44.c7ee492
pkgrel=1
pkgdesc='Module empowers your dynamic content with automatic ETag header.'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('git')
url="https://github.com/dvershinin/${_modname}"
source=("https://nginx.org/download/nginx-${_nginxver}.tar.gz"
	"git+${url}.git"
)
license=('BSD')
sha256sums=('7c1f7bb13e79433ee930c597d272a64bc6e30c356a48524f38fd34fa88d62473'
            'SKIP')

pkgver() {
    cd "${srcdir}/${_modname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/nginx-${_nginxver}"
    ./configure --with-compat --add-dynamic-module=../${_modname}
  make modules
}

package() {
  install -Dm644 "${srcdir}/${_modname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/nginx-${_nginxver}/objs"
  for mod in *.so; do
    install -Dm755 $mod "${pkgdir}/usr/lib/nginx/modules/${mod}"
  done
}
