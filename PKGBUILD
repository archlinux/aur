# Maintainer: Conrad Hoffmann <ch@bitfehler.net>

pkgname=digitd
pkgver=r11.a5df4f5
pkgrel=1
pkgdesc='Finger client & server'
arch=('any')
url='https://git.sr.ht/~sircmpwn/digitd'
license=('GPL-3.0-or-later')
depends=('hare-ev')
makedepends=('git' 'scdoc')
_commit='a5df4f574b77eac7fa5cd01a2971c2a7c06874ec'
source=("$pkgname::git+$url#commit=$_commit" 'make.patch')
b2sums=('SKIP'
        '269983b0c293111ebea44c12477edb1a960404bc3fb38f64d1b86c910fa2a1686e15bd5c703fc03a672a54ce06b8dbe7ec082af75f21e9ccea8dd32adc2bf0e0')


pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

  patch --verbose < "$srcdir/make.patch"
}

build() {
  cd "$pkgname"

  # remove '-Wl,' prefix if present, since it is only required when
  # the linker is invoked indirectly. Keeping it will cause the linker to
  # fail.
  export LDFLAGS=${LDFLAGS#"-Wl,"}

  make all docs
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
