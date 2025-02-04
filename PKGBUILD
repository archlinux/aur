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
sha256sums=('SKIP'
            'c06f8f09a00e3f84889517268c74e121031a652f6526c21645481517fb707559'
            '66d7de73eadb3b5cde6197170b1ba53a6f8bee8789eb8605c0c9ce0fa3b9ac45'
            '8477af3b4e3f9329e033f5018f1ef312880e16a21ba83caf375efead15271ee8')

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
