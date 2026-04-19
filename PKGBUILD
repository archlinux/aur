# Maintainer Joey Dumont <joey.dumont@gmail.com>
# Contributor: Harold Leboulanger <harold.leboulanger AT gmail DOT com>
# Contributor: McNoggins <gagnon88 AT gmail DOT com>
pkgname=ttwatch-git
pkgver=20240107
pkgrel=3
pkgdesc="TomTom GPS Watch Utilities"
arch=('i686' 'x86_64')
url="https://github.com/ryanbinns/ttwatch"
license=('MIT')
groups=()
depends=('libusb' 'curl' 'protobuf' 'protobuf-c')
makedepends=('git' 'curl' 'libusb' 'openssl' 'cmake')
source=(
  'ttwatch-git::git+https://github.com/ryanbinns/ttwatch.git'
  'ttwatch-git.install'
)
sha256sums=('SKIP'
            '7f4a5247d81a572cf7b406242365b1a748d07a9578cc5933822380c4da05301d')
install="ttwatch-git.install"

noextract=()

pkgver() {
  # Use date of latest commit for pkgver
  cd "$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
  make
}

package() {
  cd "$pkgname"
  install -d "${pkgdir}/usr/bin"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 -t "${pkgdir}/usr/lib/udev/rules.d/" "${srcdir}/${pkgname}/99-tomtom.rules"
  make install
}
