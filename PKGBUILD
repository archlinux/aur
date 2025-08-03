# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

_pkgname=clienteafirma
# FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320
_java_websocket_commit=8c5766a293c2dd3e0d035c0e0d70f88f57235fa8
_clienteafirma_external_version=1.0.6
_jmulticard_version=2.0
# FIX: end 320
pkgname=autofirma
pkgver=1.9
pkgrel=3
pkgdesc='Cliente de firma electrónica ofrecido por la Administración Pública'
arch=('any')
url='https://firmaelectronica.gob.es/'
license=('GPL-2.0-or-later AND EUPL-1.1')
depends=('java-runtime=17')
makedepends=('java-environment=17' 'maven')
conflicts=('autofirma-bin' 'autofirma-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ctt-gob-es/${_pkgname}/archive/v${pkgver}.tar.gz"
        "java-websocket-${_java_websocket_commit}.tar.gz::https://github.com/TooTallNate/Java-WebSocket/archive/${_java_websocket_commit}.tar.gz"
        "clienteafirma-external-${_clienteafirma_external_version}.tar.gz::https://github.com/ctt-gob-es/clienteafirma-external/archive/v${_clienteafirma_external_version}.tar.gz"
        "jmulticard-${_jmulticard_version}.tar.gz::https://github.com/ctt-gob-es/jmulticard/archive/v${_jmulticard_version}.tar.gz"
        "autofirma"
        "autofirma.desktop"
        "autofirma.js"
        "autofirma.svg"
        "eupl-1.1.txt")
b2sums=('a01947dab332228a24def0bef65291bbe71f06ec5313123c98b240a2d1f9c9bf4a61bd69b7378d37d198357e0b2a4828ab947c5dbfb8f1e240a61d65e0ee1271'
        'a0c0644192f64c371d8271f6784d31eeb5f02cde602a5a3b85b6388601cf6f23a7767f79dd451e4c73890970288e1dd2cf90698f5e7195387a6e3b5fed93d720'
        'b22d0422cc688f5f046d975c72879a61a3182ce4f0cd6ae19045d14f334967a00cbe79352df9b9121b76755b914c30917ab987dc6d6c05dbbbb74cafd461469c'
        '79b43ef1b554d0f67b6ecc5df5de615f0536b9d4c9838bf40d557521474d0441358c4128681355ec7a394b2cf5fc9385b27ea9228748f9e6c6b9f96728b9e7d3'
        'd6b40990b3248712b22d1a4b5abafd9d2683bc3c72407fd166f14f691fbd89a7c6dce43d5282e7168a07f6b5cfc14d9f3b84ec54baa8435a3372edce09233516'
        'cbedb1aff6ea64e44569d4a3249bd3707a5bc2fadf956ab27f62a71198cfed3f07170f40965bbbd2b4b9a587d165fe8b6a19c3f85aa87eaf8c5897d899d9b6e8'
        '835597fed89382057b48f01537dacc43aeef342372678fbeb6d486c6cded7ee41911b910e200e7c1c34bd1cbb0e25854e6e56dea68115bcde759b84d2d0a6147'
        '3397abf9b38b8e187ec7a1fa59e91c974568d520a2604487aa5dda56c590756560d38d46152ed5765eb6746956265107a7ff8d448f9090dc7f75a2b74d36513b'
        '2075fa9b5aba397bbd0e211a3092d21b885f6bd7c881a2ab9d9935ddf2d68d37a0a1b5159762a3cb52fb96ceb1a6cfad0051bd7255dae9b1f8ed0dda1f467674')

prepare() {
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
  # FIX: https://github.com/ctt-gob-es/clienteafirma/issues/320
  cd "Java-WebSocket-${_java_websocket_commit}"
  mvn clean install -Dmaven.test.skip=true
  cd ..
  cd "clienteafirma-external-${_clienteafirma_external_version}"
  mvn clean install -Dmaven.test.skip=true
  cd ..
  cd "jmulticard-${_jmulticard_version}"
  mvn clean install -Dmaven.test.skip=true
  # FIX: end 320
}

build() {
  cd "${_pkgname}-${pkgver}"
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
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
  install -Dm644 "${_pkgname}-${pkgver}/afirma-simple/target/autofirma.jar" \
    "${pkgdir}/usr/share/java/autofirma/autofirma.jar"
  install -Dm644 "autofirma.svg" \
    "${pkgdir}/usr/share/pixmaps/autofirma.svg"
  install -Dm644 "autofirma.desktop" \
    "${pkgdir}/usr/share/applications/autofirma.desktop"
  install -Dm644 "eupl-1.1.txt" \
    "${pkgdir}/usr/share/licenses/autofirma/EUPL"
}
