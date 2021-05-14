# Maintainer: <mumei AT airmail DOT cc>

_pkgname=TextEdit
pkgname=textedit.app
epoch=1
pkgrel=1
pkgver=r14.41ba8ca
pkgdesc='GNUstep port of OS X 10.6 TextEdit'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/ericwa/TextEdit'
license=('BSD')
groups=('gnustep-apps')
#[UPSTREAM-BUG] Program will hang without a working aspell dictionary
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'aspell-en')
makedepends=('gcc-objc' 'gnustep-make' git)
conflicts=('textedit-classic.app')
source=("git+https://github.com/ericwa/TextEdit.git#commit=41ba8ca9c070a6fb13de059453fec19409e65839"
        "http://http.debian.net/debian/pool/main/t/textedit.app/textedit.app_5.0-2.debian.tar.xz")
sha256sums=('SKIP'
            '3ddd98df28ce9448b7f19f42fedf8fb485e84c30fc011b9f309b5e87b879dd19')

pkgver() {
  cd "TextEdit"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "TextEdit"
  for patch in ../debian/patches/*.patch; do
    patch < $patch
  done
}

build() {
  cd "TextEdit"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "TextEdit"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
