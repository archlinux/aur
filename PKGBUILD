# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

_pkgname=clienteafirma
# FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320
_clienteafirma_external_commit=c674ad5b07c66907994f63ba73ca61c9c49c8d2c
# FIX: end 320
pkgname=autofirma
pkgver=1.8.3
pkgrel=1
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL-2.0-or-later AND EUPL-1.1')
depends=('java-runtime=11')
makedepends=('java-environment=11' 'maven')
conflicts=('autofirma-bin' 'autofirma-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ctt-gob-es/${_pkgname}/archive/v${pkgver}.tar.gz"
        "clienteafirma-external-${_clienteafirma_external_commit}.tar.gz::https://github.com/ctt-gob-es/clienteafirma-external/archive/${_clienteafirma_external_commit}.tar.gz"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg"
        "eupl-1.1.txt")
b2sums=('62565adb87c54a2dee07526e0f664e51b6cf72ca47fb84c0af14ea0fe209d0f78b2a5d19b94882ab76dbe40c76c02537cb6706e1b6e44d7db6f2a4a377aa8768'
        'c54e6744df088b8aa906517a398035253a5d44532b8d5bfaf71fce04569fa5eb193e8159c368ee5bcfc1a308944b35bdb0d6edfb7c0c1503b4469752f563f737'
        '2eca1245aa7e44228fac9fbb871b90d765402ebdfeaa476fa807e7bdaedb039353980c5fdfaf560ecc943386bbee90d4ae048b85b516b4653bf699328d10fc87'
        'cbedb1aff6ea64e44569d4a3249bd3707a5bc2fadf956ab27f62a71198cfed3f07170f40965bbbd2b4b9a587d165fe8b6a19c3f85aa87eaf8c5897d899d9b6e8'
        '835597fed89382057b48f01537dacc43aeef342372678fbeb6d486c6cded7ee41911b910e200e7c1c34bd1cbb0e25854e6e56dea68115bcde759b84d2d0a6147'
        '3397abf9b38b8e187ec7a1fa59e91c974568d520a2604487aa5dda56c590756560d38d46152ed5765eb6746956265107a7ff8d448f9090dc7f75a2b74d36513b'
        '2075fa9b5aba397bbd0e211a3092d21b885f6bd7c881a2ab9d9935ddf2d68d37a0a1b5159762a3cb52fb96ceb1a6cfad0051bd7255dae9b1f8ed0dda1f467674')

prepare() {
  export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
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
