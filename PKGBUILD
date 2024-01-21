# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=tagger
_app_id=org.nickvision.tagger
pkgver=2023.11.3
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64' 'aarch64')
url="https://github.com/NickvisionApps/Tagger"
license=('GPL-3.0-or-later')
depends=('chromaprint' 'dotnet-runtime>=8' 'ffmpeg' 'libadwaita' 'webp-pixbuf-loader')
makedepends=('blueprint-compiler' 'dotnet-sdk>=8' 'git')
checkdepends=('appstream-glib')
optdepends=('yelp: in-app help')
conflicts=('nickvision-tagger')
replaces=('nickvision-tagger')
_commit=81a2f63d1b239b03063cfa1dab048c2c0bb71e81  # tags/2023.11.3^0
source=("git+https://github.com/NickvisionApps/Tagger.git#commit=${_commit}"
        'git+https://github.com/NickvisionApps/CakeScripts.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd Tagger
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd Tagger
  git submodule init
  git config submodule.CakeScripts.url "$srcdir/CakeScripts"
  git -c protocol.file.allow=always submodule update

  dotnet tool restore
}

build() {
  cd Tagger
  dotnet cake --target=Publish --prefix=/usr --ui=gnome
}

check() {
  cd Tagger
  appstream-util validate-relax --nonet \
    "_nickbuild/usr/share/metainfo/${_app_id}.metainfo.xml"
  desktop-file-validate "_nickbuild/usr/share/applications/${_app_id}.desktop"
}

package() {
  cd Tagger
  dotnet cake --target=Install --destdir="$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
