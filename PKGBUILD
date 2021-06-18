# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_modname=ngx_dynamic_etag
pkgname=nginx-mainline-mod-dynamic-etag-git
pkgver=r44.c7ee492
pkgrel=6
pkgdesc='Module empowers your dynamic content with automatic ETag header.'
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('git' 'nginx-mainline-src')
url="https://github.com/dvershinin/${_modname}"
source=("git+${url}.git")
license=('BSD')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_modname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  ln -sf /usr/src/nginx/auto
  ln -sf /usr/src/nginx/src
}

build() {
  cd "${srcdir}/build"
  /usr/src/nginx/configure --with-compat --add-dynamic-module="../${_modname}"
  make modules
}

package() {
  install -Dm644 "${srcdir}/${_modname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/build/objs"
  for mod in *.so
    do
      install -Dm755 ${mod} "${pkgdir}/usr/lib/nginx/modules/${mod}"
    done
}
