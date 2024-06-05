# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Nick Logozzo <nlogozzo225@gmail.com>
pkgname=tagger
_app_id=org.nickvision.tagger
pkgver=2024.6.0
pkgrel=1
pkgdesc="An easy-to-use music tag (metadata) editor"
arch=('x86_64' 'aarch64')
url="https://github.com/NickvisionApps/Tagger"
license=('GPL-3.0-or-later')
depends=(
  'chromaprint'
  'dotnet-runtime>=8'
  'ffmpeg'
  'libadwaita'
  'webp-pixbuf-loader'
)
makedepends=(
  'blueprint-compiler'
  'dotnet-sdk>=8'
  'git'
)
optdepends=(
  'yelp: in-app help'
)
conflicts=('nickvision-tagger')
source=("git+https://github.com/NickvisionApps/Tagger.git#tag=$pkgver"
        'git+https://github.com/NickvisionApps/CakeScripts.git')
sha256sums=('e84a653b55d7ca0a7e92ab7b0f01aaddae3ade3657e2fd0bed4c1b5dcaff0689'
            'SKIP')

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
  appstreamcli validate --no-net \
    "_nickbuild/usr/share/metainfo/${_app_id}.metainfo.xml" || :
  desktop-file-validate "_nickbuild/usr/share/applications/${_app_id}.desktop"
}

package() {
  cd Tagger
  dotnet cake --target=Install --destdir="$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
