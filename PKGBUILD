# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_modname='ngx_dynamic_etag'
pkgname='nginx-mainline-mod-dynamic-etag-git'
pkgver=r65.36cd840
pkgrel=1
pkgdesc='Module empowers your dynamic content with automatic ETag header'
arch=('x86_64' 'aarch64')
depends=('nginx-mainline')
makedepends=('git' 'pcre2' 'zlib' 'openssl' 'nginx-mainline-src')
url="https://github.com/dvershinin/${_modname}"
source=("git+${url}.git")
license=('BSD')
sha256sums=('SKIP')

pkgver() {
  cd "${_modname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir --parents "build"
  cd "build"
  ln --symbolic --force "/usr/src/nginx/auto"
  ln --symbolic --force "/usr/src/nginx/src"
  /usr/src/nginx/configure \
    --with-http_ssl_module \
    --add-dynamic-module="../${_modname}"
}

build() {
  cd "build"
  make modules
}

package() {
  install -Dm0644 "${_modname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "build/objs"
  for mod in *".so"
    do
      install -Dm0755 "${mod}" -t "${pkgdir}/usr/lib/nginx/modules"
  done
}
