# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>

pkgname=rose-browser-git
pkgver=r52.288bf06
pkgrel=3
epoch=1
pkgdesc="Minimalist browser based on webkit2 and GTK4"
arch=(x86_64)
url="https://github.com/mini-rose/rose-browser"
license=(MIT)
depends=(gtk4 webkitgtk-6.0 lua gst-plugins-base gst-plugins-good)
optdepends=(gst-plugins-bad
            gst-libav
            gstreamer-vaapi)
makedepends=(git mold  clang)
provides=(rose-browser)
conflicts=(rose-browser)
options=(!strip)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "rose-browser"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CC=/usr/bin/clang CXX=/usr/bin/clang++

  cd "rose-browser"
  GTK=4 BUILDTYPE=RELEASE make
}

package() {
  cd "rose-browser"
  install -Dm755 build/rose -t "$pkgdir/usr/bin/"
  install -D license -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # This don't play nice, install to system /usr/local is hardcoded
  #make DESTDIR="${pkgdir}" install
}
