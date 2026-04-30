# Maintainer: flactwin <flac@flctwn.com>

pkgname=flareapp
pkgver=1.4.5
pkgrel=0
pkgdesc="Flare is an open-source, privacy-first social client that brings Mastodon, Misskey, Bluesky, X, Nostr, and RSS."
url="https://flareapp.moe/"
arch=("x86_64" "aarch64")
license=("AGPL-3.0")
makedepends=("jdk-openjdk" "npm" "nodejs")
depends=("jdk-openjdk")
source=("https://github.com/DimensionDev/Flare/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("7cb18afe5e734fe17fb96c4dede05b76855be1f03699764d0495d274354e05df")

build() {
  cd "${srcdir}"/Flare-$pkgver
  ./gradlew  :desktopApp:createReleaseDistributable --stacktrace
}

package() {  
  cd "${srcdir}"/Flare-$pkgver/desktopApp/build/compose/binaries/main-release/app/Flare/
  find . -type f -exec install -Dm 755 "{}" ""${pkgdir}"/opt/flareapp/{}" \;
  mkdir -p "${pkgdir}"/usr/bin/
  ln -s /opt/$pkgname/bin/Flare "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 "${srcdir}"/Flare-$pkgver/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  mkdir -p "${pkgdir}"/usr/share/applications
  install -Dvm644 "${startdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
