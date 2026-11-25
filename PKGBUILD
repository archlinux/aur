pkgname=pw-loudness-eq-git
_pkgname=pw-loudness-eq
pkgver=r6.3c7b908
pkgrel=1
pkgdesc='Windows Loudness Equalization (per app) and audio engine limiter (per device) for PipeWire'
arch=('x86_64')
url='https://github.com/xoxorwr/pw-loudness-eq'
license=('LicenseRef-unknown')
depends=(
  'cairo'
  'glib2'
  'glibc'
  'gtk3'
  'libpipewire'
  'pango'
  # the modules are loaded by the PipeWire daemon and need its audioconvert filter-graph support (PipeWire >= 1.4)
  'pipewire>=1:1.4.0'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  make PREFIX=/usr
}

check() {
  cd "$_pkgname"
  make check
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 app/README.md "$pkgdir/usr/share/doc/$pkgname/app.md"

  # Upstream ships no license; see https://bbs.archlinux.org/viewtopic.php?id=300179
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  printf '%s\n' \
    'Upstream (https://github.com/xoxorwr/pw-loudness-eq) does not state a license.' \
    'All rights are assumed to be reserved by the author.' \
    > "$pkgdir/usr/share/licenses/$pkgname/LICENSE-unknown.txt"
}
