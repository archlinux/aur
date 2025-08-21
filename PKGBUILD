pkgname=goenv
pkgver=2.2.28
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('i686' 'x86_64')
url="https://github.com/syndbg/goenv"
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "go-build-${pkgver}.tar.gz::https://github.com/go-nv/goenv/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=('163c351001f67d016a4464d94dac16df'
         '163c351001f67d016a4464d94dac16df')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Instalar libexec
  for file in libexec/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done
  
  # Instalar bin
  for file in bin/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done
  
  # Instalar go-build plugin do segundo source
  install -d "${pkgdir}/usr/lib/goenv/plugins/go-build"
  if [ -d "${srcdir}/goenv-${pkgver}/plugins/go-build" ]; then
    cp -r "${srcdir}/goenv-${pkgver}/plugins/go-build/"* "${pkgdir}/usr/lib/goenv/plugins/go-build/"
  fi
  
  # Criar link simbólico
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/goenv/libexec/goenv "${pkgdir}/usr/bin/goenv"
  
  # Criar arquivo de versão
  echo "$pkgver" > "${pkgdir}/usr/lib/goenv/APP_VERSION"
}
