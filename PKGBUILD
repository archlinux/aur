# Maintainer: somini <dev@somini.xyz>
# Contributor: Sebastian Morr <sebastian@morr.cc>

_pkgname=bucklespring
pkgname=bucklespring-libinput-git
pkgver=latest
pkgrel=2
pkgdesc="Nostalgia bucklespring keyboard sound, sampled from IBM's Model-M. libinput version"
arch=('i686' 'x86_64')
url='https://github.com/zevv/bucklespring'
license=('MIT')
depends=('openal' 'alure' 'libxtst' 'libinput')
makedepends=('git')
source=(
  'git+https://github.com/zevv/bucklespring'
  'nl.zevv.bucklespring.run.policy'
  'bucklespring.rules'
)
sha1sums=('SKIP'
          '9338bf7235e9a366b349bd780cdbf329cc409210'
          '04b8a433d9d93d7cdc63303b433978f16348a78e')

build() {
  cd "$srcdir/$_pkgname"
  make libinput=1 PATH_AUDIO=/usr/share/bucklespring
}

package() {
  cd "$srcdir/$_pkgname"
  # Program
  install -Dm755 buckle "$pkgdir"/usr/bin/buckle

  # Audio
  install -Dm644 -t "$pkgdir"/usr/share/bucklespring/ wav/*

  # Polkit
  install -dD -m750 "$pkgdir/usr/share/polkit-1/rules.d"
  install -D -m644 "$srcdir/nl.zevv.bucklespring.run.policy" -t "$pkgdir/usr/share/polkit-1/actions"
  install -D -m644 "$srcdir/bucklespring.rules" "$pkgdir/usr/share/polkit-1/rules.d"
}
