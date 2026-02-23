# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=goenv
pkgver=2.2.37
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."

license=('MIT')
arch=('i686' 'x86_64')
url="https://github.com/go-nv/goenv"

depends=('bash' 'python' 'bats')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('ec3d02539dd3d9b4bdd93dad9abb576f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for file in libexec/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done

  for file in bin/*; do
    install -D -m755 "$file" "${pkgdir}/usr/lib/goenv/$file"
  done

  install -d "${pkgdir}/usr/lib/goenv/plugins/go-build"
  if [ -d "${srcdir}/goenv-${pkgver}/plugins/go-build" ]; then
    cp -r "${srcdir}/goenv-${pkgver}/plugins/go-build/"* "${pkgdir}/usr/lib/goenv/plugins/go-build/"
    rm -rf "${pkgdir}/usr/lib/goenv/plugins/go-build/test/test_assert_helpers.bash"
  fi

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/goenv/libexec/goenv" "${pkgdir}/usr/bin/goenv"

  echo "${pkgver}" > "${pkgdir}/usr/lib/goenv/APP_VERSION"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
