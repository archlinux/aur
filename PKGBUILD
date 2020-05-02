# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=2.0.0-RC6-13

pkgname=coursier
pkgver="${_version//-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-runtime-headless>=8' 'bash')

source=("builder-$pkgver::https://github.com/coursier/coursier/releases/download/v${_version}/coursier")
sha256sums=('a3053e77ec9be7a14c9e069e5d184752ef815f2dfe752ca359fe7ac7f3142690')
noextract=("builder-$pkgver")

build() {
  cd "${srcdir}"
  mkdir -p cache bin
  export COURSIER_CACHE="${srcdir}/cache"
  sh ./builder-$pkgver bootstrap \
    "io.get-coursier::coursier-cli:${_version}" \
    --java-opt "-noverify" \
    --no-default \
    -r central \
    -r typesafe:ivy-releases \
    -f -o "bin/coursier" \
    --standalone
}

package() {
  install -D -m755 "${srcdir}/bin/coursier" "${pkgdir}/usr/bin/coursier"
}
