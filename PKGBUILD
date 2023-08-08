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
pkgrel=14
pkgdesc='Build, find and use SDL binaries (package is specific to architecture and SDL package used at build-time)'
arch=(
  'x86_64'
  'i686'
  'aarch64'
  'armv7h'
)
license=('GPL')
url="https://metacpan.org/dist/$_realname"
depends=(
  'perl>=5.008'
  'perl-capture-tiny'
  'perl-extutils-cbuilder'
  'perl-file-sharedir>=1.00'
  'perl-file-temp'
  'perl-pathtools'
  'sdl'
)
makedepends=(
  'perl-archive-extract'
  'perl-archive-tar'
  'perl-archive-zip'
  'perl-digest-sha'
  'perl-file-fetch>=0.24'
  'perl-file-path>=2.08'
  'perl-file-which'
  'perl-module-build>=0.36'
  'perl-text-patch>=1.4'
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
}
