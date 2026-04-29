# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=vineflower-bin
pkgver=1.12.0
pkgrel=1
pkgdesc='Vineflower Java decompiler (prebuilt jar)'
arch=('any')
url='https://vineflower.org/'
license=('Apache-2.0')
depends=('java-runtime>=17')
options=('!debug')

source=(
  "vineflower-${pkgver}.jar::https://github.com/Vineflower/vineflower/releases/download/${pkgver}/vineflower-${pkgver}.jar"
)
sha256sums=('1dfcfe974395734fa467ce620661c7623d05ba83670de0529b1fbd63ff548b9d')

noextract=(
  "vineflower-${pkgver}.jar"
)

latestver() {
  gh api --paginate repos/Vineflower/vineflower/releases --jq '.[] | select(.prerelease == false and .draft == false) | .assets[]?.name' \
    | sed -nE '/^vineflower-[0-9.]+\.jar$/{s/^vineflower-//; s/\.jar$//; p; q}'
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
