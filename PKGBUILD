# Maintainer: TuNombre <tucorreo@example.com>
pkgname=bepasty-cli
pkgver=r55.d48e9d1
pkgrel=1
pkgdesc="CLI client for bepasty-server"
arch=('any')
url="https://github.com/bepasty/bepasty-client-cli"
license=('BSD')
depends=('python' 'python-requests' 'python-magic')
makedepends=('git' 'python-setuptools')
source=("${pkgname}::git+https://github.com/bepasty/bepasty-client-cli.git")
md5sums=('SKIP')

# Genera la versión basada en el número de commits y el hash corto
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  # Reemplazar el .decode() en el archivo cli.py usando sed
  sed -i 's/ftype = mime.from_buffer(first_chunk).decode()/ftype = mime.from_buffer(first_chunk)/' bepasty_cli/cli.py
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  # Instalar el paquete
  python setup.py install --root="${pkgdir}" --optimize=1

  # Instalar el archivo de licencia
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

