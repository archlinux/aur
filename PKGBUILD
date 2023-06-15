# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

_pkgname=clienteafirma
# FIX: https://github.com/ctt-gob-es/clienteafirma/issues/223
_jmulticard_commit=f35e2e100f1d54a675fe0df3fb67b1b97f78d6ab
# FIX: end 223
# FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320
_clienteafirma_external_commit=7236a386b59559f377cd530934f050cca9ebbd0a
# FIX: end 320
pkgname=autofirma
pkgver=1.8.2
pkgrel=1
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL' 'custom:EUPL')
depends=('java-runtime=11')
makedepends=('java-environment=11' 'maven')
conflicts=('autofirma-bin' 'autofirma-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ctt-gob-es/${_pkgname}/archive/v${pkgver}.tar.gz"
        "jmulticard-${_jmulticard_commit}.tar.gz::https://github.com/ctt-gob-es/jmulticard/archive/${_jmulticard_commit}.tar.gz"
        "clienteafirma-external-${_clienteafirma_external_commit}.tar.gz::https://github.com/ctt-gob-es/clienteafirma-external/archive/${_clienteafirma_external_commit}.tar.gz"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg"
        "eupl-1.1.txt")
b2sums=('0a2176a1ff288320683c0c9b640104f41875a417a3fc4677c8df37d199a54e407b2df9ba60ba0a8c3721f3b453872e7090c7bf59e7c9da6f78d1a520242f9775'
        '652385cdc2f36083bb93df092a56375eea86726e94bcce21ebddc4fd70e3eeba6080f8415909183d8097464c5006f273a6346926fdf2247e9c2e95efdc8207d6'
        'ddaa0230b9a7fb66e28108d0cf77874ae9ebc7fe45755eae0ed0bd4a00c4eb856b47fe6704befc1e5607ee68cf89f16742d72a6e580fe1cdbfdec58b103b44da'
        '2eca1245aa7e44228fac9fbb871b90d765402ebdfeaa476fa807e7bdaedb039353980c5fdfaf560ecc943386bbee90d4ae048b85b516b4653bf699328d10fc87'
        'cbedb1aff6ea64e44569d4a3249bd3707a5bc2fadf956ab27f62a71198cfed3f07170f40965bbbd2b4b9a587d165fe8b6a19c3f85aa87eaf8c5897d899d9b6e8'
        '835597fed89382057b48f01537dacc43aeef342372678fbeb6d486c6cded7ee41911b910e200e7c1c34bd1cbb0e25854e6e56dea68115bcde759b84d2d0a6147'
        '3397abf9b38b8e187ec7a1fa59e91c974568d520a2604487aa5dda56c590756560d38d46152ed5765eb6746956265107a7ff8d448f9090dc7f75a2b74d36513b'
        '2075fa9b5aba397bbd0e211a3092d21b885f6bd7c881a2ab9d9935ddf2d68d37a0a1b5159762a3cb52fb96ceb1a6cfad0051bd7255dae9b1f8ed0dda1f467674')

prepare() {
  export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/223
  cd "jmulticard-${_jmulticard_commit}"
  mvn clean install -Dmaven.test.skip=true
  # FIX: end 223
  cd ..
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320
  cd "clienteafirma-external-${_clienteafirma_external_commit}"
  mvn clean install -Dmaven.test.skip=true
  # FIX: end 320
}

build() {
  cd "${_pkgname}-${pkgver}"
  export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320
  mvn clean install -Denv=devel -Dmaven.test.skip=true
  # FIX: end 320
  mvn clean install -Denv=install -Dmaven.test.skip=true
}

package() {
  install -Dm755 "autofirma" \
    "${pkgdir}/usr/bin/autofirma"
  install -Dm644 "autofirma.js" \
    "${pkgdir}/usr/lib/firefox/defaults/pref/autofirma.js"
  install -Dm644 "${_pkgname}-${pkgver}/afirma-simple/target/AutoFirma.jar" \
    "${pkgdir}/usr/share/java/autofirma/autofirma.jar"
  install -Dm644 "autofirma.svg" \
    "${pkgdir}/usr/share/pixmaps/autofirma.svg"
  install -Dm644 "autofirma.desktop" \
    "${pkgdir}/usr/share/applications/autofirma.desktop"
  install -Dm644 "eupl-1.1.txt" \
    "${pkgdir}/usr/share/licenses/autofirma/EUPL"
}
