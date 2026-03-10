# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=vineflower-bin
pkgver=1.11.2
pkgrel=2
pkgdesc='Vineflower Java decompiler (prebuilt jar)'
arch=('any')
url='https://vineflower.org/'
license=('Apache-2.0')
depends=('java-runtime>=17')
options=('!debug')

source=(
  "vineflower-${pkgver}.jar::https://github.com/Vineflower/vineflower/releases/download/${pkgver}/vineflower-${pkgver}.jar"
)
sha256sums=('e1e2415e7f78b34960402c4beddfc88e033d7842a23ecd132a8ec2eadd54f6bf')

noextract=(
  "vineflower-${pkgver}.jar"
)

latestver() {
  curl -fsSL 'https://api.github.com/repos/Vineflower/vineflower/releases/latest' | jq -r '.assets[]?.name' \
    | sed -nE '/^vineflower-[0-9.]+\.jar$/{s/^vineflower-//; s/\.jar$//; p;}'
}

package() {
  install -Dm644 "vineflower-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/vineflower/vineflower.jar"

  install -Dm644 /usr/share/licenses/spdx/Apache-2.0.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/vineflower" <<'EOF'
#!/bin/sh
exec java -jar /usr/share/java/vineflower/vineflower.jar "$@"
EOF
}
