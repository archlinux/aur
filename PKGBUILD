# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=1.1.0-M14

pkgname=coursier
pkgver="${_version/-/_}"
pkgrel=2
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-runtime-headless>=8' 'bash')

source=("builder-$pkgver::https://github.com/coursier/coursier/raw/v${_version}/coursier")
sha256sums=('c817d0d9860e2abc7420d6bde1800fb7d74dc4612d9a1480aca0b67dc2013892')
noextract=("builder-$pkgver")

build() {
  cd "${srcdir}"
  mkdir -p cache bin
  export COURSIER_CACHE="${srcdir}/cache"
  sh ./builder-$pkgver bootstrap \
    --intransitive "io.get-coursier::coursier-cli:${_version}" \
    --classifier standalone \
    --artifact-type jar \
    --java-opt "-noverify" \
    --no-default \
    -r central \
    -r sonatype:releases \
    -f -o "bin/coursier" \
    --standalone
}

package() {
  install -D -m755 "${srcdir}/bin/coursier" "${pkgdir}/usr/bin/coursier"
}
