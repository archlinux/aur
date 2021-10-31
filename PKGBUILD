# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=clienteafirma
pkgname=autofirma-git
pkgver=r6398.1222bbef9
pkgrel=1
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL' 'custom:EUPL')
depends=('java-runtime')
makedepends=('git' 'jdk11-openjdk' 'maven')
conflicts=('autofirma' 'autofirma-bin')
source=("${_pkgname}::git+https://github.com/ctt-gob-es/${_pkgname}.git"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg"
        "eupl-1.1.txt")
sha256sums=('SKIP'
            'ab40c32a083bf6429580b057b21ab8341f8d819cedd91cd52b92fe5ae40212c9'
            '062cf72219e592e06218e47ea2a212d6517be66f0d4c58dcd03ef18d5c39300b'
            '428c5b7300dde7158a1a0918c8d2e8188f042dbc143d991c03f51d1c8a40efa4'
            'f7e525586103db08a2a38ccefdef93cc02407728de8b214e53ae3dc0631bab75'
            'db78284b0be3db018205c8d1c8449c461275cb3b8b82dfec3f75e9a19d346542')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/222
  sed -i '76d' afirma-crypto-cades/src/main/java/es/gob/afirma/signers/cades/CAdESExtraParams.java
  sed -i '65d' afirma-crypto-cades/src/main/java/es/gob/afirma/signers/cades/CAdESExtraParams.java
  # FIX: end 222
  mvn clean install -Dmaven.test.skip=true
  mvn clean install -Denv=install -Dmaven.test.skip=true
}

package() {
  install -Dm755 "autofirma" \
    "${pkgdir}/usr/bin/autofirma"
  install -Dm644 "autofirma.js" \
    "${pkgdir}/usr/lib/firefox/defaults/pref/autofirma.js"
  install -Dm644 "${_pkgname}/afirma-simple/target/AutoFirma.jar" \
    "${pkgdir}/usr/share/java/autofirma/autofirma.jar"
  install -Dm644 "autofirma.svg" \
    "${pkgdir}/usr/share/pixmaps/autofirma.svg"
  install -Dm644 "autofirma.desktop" \
    "${pkgdir}/usr/share/applications/autofirma.desktop"
  install -Dm644 "eupl-1.1.txt" \
    "${pkgdir}/usr/share/licenses/autofirma/EUPL"
}
