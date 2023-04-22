# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=musikcube-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='A terminal-based cross-platform music player, audio engine, metadata indexer, and server'
arch=('x86_64')
url="https://github.com/clangen/${pkgname%-bin}"
license=('BSD')
provides=('musikcube')
conflicts=('musikcube')
depends=('pulseaudio' 'libpulse' 'libev' 'alsa-lib')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/releases/download/${pkgver}/${pkgname%-bin}_linux_x86_64_${pkgver}.tar.bz2"
        "LICENSE.txt")
sha256sums=('795ec71f7bd88559913d852329821ba79c065e128ff05d6436e5d741500e21db'
            '315d1a4485c05a0db8640d0720cac768c7e49224dc3db592ed204a770fee9e36')

prepare() {
  cd ${pkgname%-bin}_linux_x86_64_${pkgver}

  cat << EOF > musikcube.sh
#!/bin/sh

set -eu

cd /usr/share/musikcube/
exec ./musikcube "\$@"
EOF

  cat << EOF > musikcubed.sh
#!/bin/sh

set -eu

cd "/usr"/share/musikcube/
exec ./musikcubed "\$@"
EOF
}

package() {
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE

  cd ${pkgname%-bin}_linux_x86_64_${pkgver}

  install -Dm644 libmusikcore.so -t ${pkgdir}/usr/share/${pkgname%-bin}
  install -Dm644 lib/* -t ${pkgdir}/usr/share/${pkgname%-bin}/lib
  install -Dm644 locales/*.json -t ${pkgdir}/usr/share/${pkgname%-bin}/locales
  install -Dm775 ${pkgname%-bin} -t ${pkgdir}/usr/share/${pkgname%-bin}
  install -Dm775 ${pkgname%-bin}d -t ${pkgdir}/usr/share/${pkgname%-bin}
  install -Dm644 plugins/* -t ${pkgdir}/usr/share/${pkgname%-bin}/plugins
  install -Dm644 themes/* -t ${pkgdir}/usr/share/${pkgname%-bin}/themes
  install -Dm775 musikcube.sh ${pkgdir}/usr/bin/${pkgname%-bin}
  install -Dm775 musikcubed.sh ${pkgdir}/usr/bin/${pkgname%-bin}d
}
