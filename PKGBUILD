# Maintainer: Jonatan Jonasson <notes@madeingotland.com>

pkgname=orators-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc='Turn a Linux desktop into a Bluetooth speaker'
arch=('x86_64')
url='https://github.com/OneNoted/orators'
license=('MIT')
depends=(
  'bluez'
  'bluez-utils'
  'bluez-alsa-git'
  'pipewire'
  'sudo'
  'systemd'
  'wireplumber'
)
makedepends=(
  'cargo'
  'git'
)
provides=('orators')
conflicts=('orators' 'orators-bin')
install='orators.install'
source=('orators::git+https://github.com/OneNoted/orators.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/orators"

  if tag=$(git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null); then
    printf '%s\n' "${tag#v}" | sed 's/-/.r/; s/-/./g'
  else
    printf '0.0.0.r%s.g%s\n' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$srcdir/orators"
  cargo build --locked --release -p orators
}

package() {
  cd "$srcdir/orators"

  install -Dm755 target/release/orators "${pkgdir}/usr/bin/orators"
  install -Dm755 target/release/oratorsctl "${pkgdir}/usr/bin/oratorsctl"
  install -Dm755 target/release/oratorsd "${pkgdir}/usr/bin/oratorsd"

  install -Dm644 packaging/systemd/user/oratorsd.service \
    "${pkgdir}/usr/lib/systemd/user/oratorsd.service"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/orators/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/orators/LICENSE"
}
