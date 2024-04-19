# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

# This package must not be "any" arch.
# The Build.PL script's '--with-sdl-config' acquires arch-specific library paths
# from the installed SDL instance, and puts that into the created package.
# Requires rebuild with every arch/config change in the provided SDL package.

pkgname='perl-alien-sdl'
_realname='Alien-SDL'
pkgver=1.446
pkgrel=15
pkgdesc='Build, find and use SDL binaries (package is specific to architecture and SDL package used at build-time)'
arch=(
  'x86_64'
  'i686'
  'aarch64'
  'armv7h'
)
license=('LicenseRef-GPL-1.0-or-later OR Artistic-1.0-Perl')
url="https://metacpan.org/dist/$_realname"
depends=(
  'perl'
  'perl-capture-tiny'
  'perl-file-sharedir'
  'sdl'
)
makedepends=(
  'perl-archive-extract'
  'perl-archive-zip'
  'perl-file-which'
  'perl-module-build'
  'perl-text-patch'
)
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/F/FR/FROGGS/$_realname-$pkgver.tar.gz")
sha256sums=('c9aa2c9dc3c63d89773c7d7203f2a46d1b924d0c72d9f801af147a3dc8bc512a')

prepare() {
  cd "$_realname-$pkgver"

  # Workaround bug with --with-sdl-config
  sed -i '/^GetOptions/d' Build.PL
}

build() {
  cd "$_realname-$pkgver"

  # install module in vendor directories
  perl Build.PL --with-sdl-config
  perl Build
}

package() {
  cd "$_realname-$pkgver"
  perl Build install installdirs=vendor destdir="$pkgdir"

  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
