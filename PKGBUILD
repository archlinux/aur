# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Fediverse: @fabiscafe@mstdn.social
# Contributor: Luna Jernberg <lunajernberg@gnome.org>
# Fediverse: @bittin@social.vivaldi.net

pkgname=tuba
pkgver=0.4.1
pkgrel=0.2
pkgdesc='Browse the Fediverse'
arch=(
  aarch64 #ALARM
  armv7h  #ALARM
  i686    #Arch Linux32
  x86_64  #Arch Linux
)
url='https://tuba.geopjr.dev/'
license=('GPL3')
depends=(
  gtk4
  libadwaita
  libgee
  libsoup3
  gtksourceview5
)
makedepends=(
  git
  meson
  vala
)

optdepends=(
  ## https://github.com/GeopJr/Tuba/issues/32#issuecomment-1483280966
  'webp-pixbuf-loader: calckey support (webp)'
)
_commit=cf85a4597a1f45949da1ed5b4d087da7856e6a0e # tags/0.4.1^0
validpgpkeys=(
  ## curl -sS https://github.com/GeopJr.gpg | gpg --import -
  '04A92A61E5CE5342F40E48DCFE5185F095BFC8C9' #Evangelos Paterakis <evan@geopjr.dev>
  ## curl -sS https://github.com/web-flow.gpg | gpg --import -
  '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23' #Github Web-Flow
)
source=("git+https://github.com/GeopJr/Tuba.git#commit=${_commit}?signed"
        "0001-fix_Vala_0.56.11_vapi_change_+_GTK_4.12_deprication.patch::https://patch-diff.githubusercontent.com/raw/GeopJr/Tuba/pull/447.patch")
sha256sums=('SKIP'
            'e2eee6d039dab55c60bf3361b87d9cfe00991777adc60bc1e0350f3a9c024b5d')

pkgver() {
  cd Tuba
  git describe --tags | sed -r 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd Tuba
  git apply -3 ../0001-fix_Vala_0.56.11_vapi_change_+_GTK_4.12_deprication.patch
}

build() {
  arch-meson Tuba build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s "/usr/bin/dev.geopjr.Tuba" "$pkgdir/usr/bin/tuba" 
}
