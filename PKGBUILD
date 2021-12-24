# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_pkgname=clienteafirma
# FIX: https://github.com/ctt-gob-es/clienteafirma/issues/223
_jmulticard_commit=73011ff9965d8b45ae1d9cd2f99de3452a0cba47
# FIX: end 223
pkgname=autofirma-git
pkgver=r6411.52b796b29
pkgrel=1
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL' 'custom:EUPL')
depends=('java-runtime=11')
makedepends=('git' 'java-environment=11' 'maven')
conflicts=('autofirma' 'autofirma-bin')
source=("${_pkgname}::git+https://github.com/ctt-gob-es/${_pkgname}.git"
        "jmulticard::git+https://github.com/ctt-gob-es/jmulticard.git"
        "jmulticard-${_jmulticard_commit}.tar.gz::https://github.com/ctt-gob-es/jmulticard/archive/${_jmulticard_commit}.tar.gz"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg"
        "eupl-1.1.txt")
b2sums=('SKIP'
        'SKIP'
        'c3c42899b3edbfdb0a03990a50d64ab7831c0d0b3e448e79f21083e3b8b3df66941ea165e1fc92adcc5a0990469791dae7b8027c03f83c463a542a4179870db2'
        '2eca1245aa7e44228fac9fbb871b90d765402ebdfeaa476fa807e7bdaedb039353980c5fdfaf560ecc943386bbee90d4ae048b85b516b4653bf699328d10fc87'
        'cbedb1aff6ea64e44569d4a3249bd3707a5bc2fadf956ab27f62a71198cfed3f07170f40965bbbd2b4b9a587d165fe8b6a19c3f85aa87eaf8c5897d899d9b6e8'
        '835597fed89382057b48f01537dacc43aeef342372678fbeb6d486c6cded7ee41911b910e200e7c1c34bd1cbb0e25854e6e56dea68115bcde759b84d2d0a6147'
        '3397abf9b38b8e187ec7a1fa59e91c974568d520a2604487aa5dda56c590756560d38d46152ed5765eb6746956265107a7ff8d448f9090dc7f75a2b74d36513b'
        '2075fa9b5aba397bbd0e211a3092d21b885f6bd7c881a2ab9d9935ddf2d68d37a0a1b5159762a3cb52fb96ceb1a6cfad0051bd7255dae9b1f8ed0dda1f467674')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/223
  export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
  # Fist build jmulticard 1.7
  cd "jmulticard-${_jmulticard_commit}"
  mvn clean install -Dmaven.test.skip=true
  # Now build jmulticard 1.8-SNAPSHOT
  cd "../jmulticard"
  mvn clean install -Dmaven.test.skip=true
  # FIX: end 223
}

build() {
  cd "${_pkgname}"
  export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/222
  #sed -i '76d' afirma-crypto-cades/src/main/java/es/gob/afirma/signers/cades/CAdESExtraParams.java
  #sed -i '65d' afirma-crypto-cades/src/main/java/es/gob/afirma/signers/cades/CAdESExtraParams.java
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
