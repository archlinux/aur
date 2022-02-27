# Maintainer: Nissar Chababy <funilrys at outlook dot com>

pkgname=tuterm
pkgver=0.3.0
pkgrel=3
pkgdesc='A better way to learn CLI programs.'
arch=('any')
url='https://github.com/veracioux/tuterm'
license=('MIT')
depends=('bash' 'readline')
optdepends=('asciinema')
source=("$pkgname-$pkgver.tar.gz::https://github.com/veracioux/tuterm/archive/v${pkgver}.tar.gz")
sha512sums=('bb54ac58043d2a9b8c3b57e8bfa9a9be35c4b664b947808fa2b5988dc12f515b8679da6245bd04752c01474251fd8d064d654c2f53154fd08e275eefc3abbc9c')
backup=("etc/${pkgname}/config.sh")

prepare() {
  cd ${pkgname}-${pkgver}

  sed -i -E "s|(__SYSTEM_CONFIG=)(.*)|\1\"/etc/${pkgname}/config.sh\"|g" "${pkgname}"
  sed -i -E "s|(__SCRIPT_PATH=)(.*)|\1\"/etc/${pkgname}/scripts\"|g" "${pkgname}"
}

build() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${srcdir}/_build" PREFIX="/usr" VERSION="${pkgver}"
}

package() {
  cd "${srcdir}/_build"

  for file in $(find . -type f)
  do
    echo ${file#*/}
    if [[ "${file}" =~ bin/tuterm ]]
    then
      install -Dm755 "${file#*/}" "${pkgdir}/${file#*/}"
    else
      install -Dm644 "${file#*/}" "${pkgdir}/${file#*/}"
    fi
  done

  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 config.sh "${pkgdir}/etc/${pkgname}/config.sh"

  install -dm755 "${pkgdir}/etc/${pkgname}/scripts"
}
