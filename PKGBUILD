# Maintainer: somini <dev@somini.xyz>
# Contributor: Sebastian Morr <sebastian@morr.cc>

pkgname=bucklespring-libinput-git
_pkgname=bucklespring
pkgver=latest
pkgrel=9
pkgdesc="Nostalgia bucklespring keyboard sound, sampled from IBM's Model-M. libinput version"
arch=('i686' 'x86_64')
url="https://github.com/zevv/bucklespring"
license=('MIT')
depends=('openal' 'alure' 'libxtst' 'dumb' 'mpg123' 'libinput')
makedepends=('git')
conflicts=('bucklespring' 'bucklespring-git')
source=(
  'git+https://github.com/zevv/bucklespring'
  'nl.zevv.bucklespring.run.policy'
  'bucklespring.rules'
  'bucklespring.sh'
)
sha1sums=('SKIP'
          'c2105954f4ec8972fb53aef8b1f2d7701095de79'
          '04b8a433d9d93d7cdc63303b433978f16348a78e'
          '26461f59226c610d54d3d6fb3824c537475cc8cd')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make PATH_AUDIO=/usr/share/bucklespring libinput=1
}

package() {
  cd "$srcdir/$_pkgname"
  # Program
  install -Dm755 buckle "$pkgdir"/usr/bin/buckle
  install -Dm755 "$srcdir/bucklespring.sh" "$pkgdir"/usr/bin/bucklespring

  # Audio
  install -Dm644 -t "$pkgdir"/usr/share/bucklespring/ wav/*

  # Polkit
  install -dD -m750 "$pkgdir/usr/share/polkit-1/rules.d"
  install -D -m644 "$srcdir/nl.zevv.bucklespring.run.policy" -t "$pkgdir/usr/share/polkit-1/actions"
  install -D -m644 "$srcdir/bucklespring.rules" "$pkgdir/usr/share/polkit-1/rules.d"

  # LICENSE
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
