# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=tagger
_app_id=org.nickvision.tagger
pkgver=2023.9.0
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64' 'aarch64')
url="https://github.com/NickvisionApps/Tagger"
license=('GPL3')
depends=('chromaprint' 'dotnet-runtime>=7' 'ffmpeg' 'libadwaita' 'webp-pixbuf-loader')
makedepends=('blueprint-compiler' 'dotnet-sdk>=7')
checkdepends=('appstream-glib')
conflicts=('nickvision-tagger')
replaces=('nickvision-tagger')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('13ae0c8bf2b2d655a1d18319dcb6661f5c0fa1ae82af02433664af30a1b03e4e')

prepare() {
  cd "Tagger-$pkgver"
  dotnet tool restore
}

build() {
  cd "Tagger-$pkgver"
  dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

check() {
  cd "Tagger-$pkgver"
  appstream-util validate-relax --nonet \
    "_nickbuild/usr/share/metainfo/${_app_id}.metainfo.xml"
  desktop-file-validate "_nickbuild/usr/share/applications/${_app_id}.desktop"
}

package() {
  cd "Tagger-$pkgver"
  dotnet cake --target=Install --destdir="$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
