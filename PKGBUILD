# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

_pkgname=clienteafirma
# FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320 (AGAIN)
_java_websocket_commit=8c5766a293c2dd3e0d035c0e0d70f88f57235fa8
# FIX: end 320
pkgname=autofirma
pkgver=1.9.2
pkgrel=1
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL-2.0-or-later AND EUPL-1.1')
depends=('java-runtime=17')
makedepends=('java-environment=17' 'maven')
conflicts=('autofirma-bin' 'autofirma-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ctt-gob-es/${_pkgname}/archive/v${pkgver}.tar.gz"
        "java-websocket-${_java_websocket_commit}.tar.gz::https://github.com/TooTallNate/Java-WebSocket/archive/${_java_websocket_commit}.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/ctt-gob-es/clienteafirma/pull/487.patch"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg"
        "eupl-1.1.txt")
b2sums=('564b868fa60e469b6063c811b2d852dffc8377f76f3ecc0ae7e0ffa39d6d020daa1b4dfed2928ab84e2f6af4ccd429d7cb6cc36ef89c752984367a256c5176bb'
        'a0c0644192f64c371d8271f6784d31eeb5f02cde602a5a3b85b6388601cf6f23a7767f79dd451e4c73890970288e1dd2cf90698f5e7195387a6e3b5fed93d720'
        '883f38450f8e586d856fa1d2ca4fed71e34d64d637ce295751cd160cdad9f2a9b21f8198b122fae9e41fe3a1bccf25ce0be466e87f9b75d22ee0fbea9f65486b'
        'f949f754a43b7836e5c5f919ca9eeede064db08fcd78857e04fb0c635d6bf4b7abfe37ccf36215abaf75426fc158920a80ebd24038c9efd46061c9f25f105061'
        'cbedb1aff6ea64e44569d4a3249bd3707a5bc2fadf956ab27f62a71198cfed3f07170f40965bbbd2b4b9a587d165fe8b6a19c3f85aa87eaf8c5897d899d9b6e8'
        '835597fed89382057b48f01537dacc43aeef342372678fbeb6d486c6cded7ee41911b910e200e7c1c34bd1cbb0e25854e6e56dea68115bcde759b84d2d0a6147'
        '3397abf9b38b8e187ec7a1fa59e91c974568d520a2604487aa5dda56c590756560d38d46152ed5765eb6746956265107a7ff8d448f9090dc7f75a2b74d36513b'
        '2075fa9b5aba397bbd0e211a3092d21b885f6bd7c881a2ab9d9935ddf2d68d37a0a1b5159762a3cb52fb96ceb1a6cfad0051bd7255dae9b1f8ed0dda1f467674')

prepare() {
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320 (AGAIN)
  cd "Java-WebSocket-${_java_websocket_commit}"
  mvn clean install -Dmaven.test.skip=true
  cd ..
  # FIX: end 320
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/479
  cd "${_pkgname}-${pkgver}"
  patch -p1 < ../487.patch
  # FIX: end 479
}

build() {
  cd "${_pkgname}-${pkgver}"
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
  mvn clean install -Denv=install -Dmaven.test.skip=true
}

package() {
  install -Dm755 "autofirma" \
    "${pkgdir}/usr/bin/autofirma"
  install -Dm644 "autofirma.js" \
    "${pkgdir}/usr/lib/firefox/defaults/pref/autofirma.js"
  install -Dm644 "${_pkgname}-${pkgver}/afirma-simple/target/autofirma.jar" \
    "${pkgdir}/usr/share/java/autofirma/autofirma.jar"
  install -Dm644 "autofirma.svg" \
    "${pkgdir}/usr/share/pixmaps/autofirma.svg"
  install -Dm644 "autofirma.desktop" \
    "${pkgdir}/usr/share/applications/autofirma.desktop"
  install -Dm644 "eupl-1.1.txt" \
    "${pkgdir}/usr/share/licenses/autofirma/EUPL"
}
