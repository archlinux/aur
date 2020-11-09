# Maintainer: robertfoster

pkgname=respeakerd-git
pkgver=v1.2.3.r11.7675a62
pkgrel=1
pkgdesc="A server application for the microphone array solutions of SEEED, based on librespeaker which combines the audio front-end processing algorithms."
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/respeaker/respeakerd"
license=('MIT')
depends=('librespeaker-bin')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("${pkgname%-git}::git+https://github.com/respeaker/respeakerd"
  "respeaker.sysusers"
  "respeaker.tmpfiles"
  "respeakerd.service"
)
md5sums=('SKIP'
  'ff637d610a28e1515d839c65e591cd67'
  'c17c45bd2e98befba2dab417bc9db27b'
  'b2b382f8d0e6e2190b28a7ce5e92faed')

prepare() {
  cd "$srcdir/${pkgname%-git}"
  if [ ! -d build ]; then
    mkdir build
  fi
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"/build
  cmake ..
  cmake --build .
}

package() {
  cd "$srcdir/${pkgname%-git}"/build
  install -D -m644 "${srcdir}/respeaker.sysusers" "${pkgdir}/usr/lib/sysusers.d/respeaker.conf"
  install -D -m644 "${srcdir}/respeaker.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/respeaker.conf"
  install -D -m644 "${srcdir}/respeakerd.service" -t "${pkgdir}/usr/lib/systemd/system"

  make DESTDIR="$pkgdir" install
}
