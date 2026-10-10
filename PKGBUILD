# Maintainer: isaacangello <isaacangello@inf.ufpell.edu.br>
#
# This is the fork of alien with native Arch Linux pacman (.pkg.tar.zst)
# package format support, including --to-pacman, --pkg-name and --name.
#
# Note: alien Package.pm uses the Perl module namespace Alien::*
# but it is NOT related to the Alien::* CPAN distro for building
# external library dependencies.

pkgname=alien
pkgver=8.95.9
pkgrel=2
pkgdesc='Convert between package formats: deb, rpm, tgz, slp, pkg, lsb, and pacman (.pkg.tar.zst)'
arch=('any')
url='https://github.com/isaacangello/alien'
license=('GPL-2.0-or-later')
depends=('perl')
optdepends=(
  'rpm-tools: for RPM package conversion'
  'dpkg: for Debian package operations'
  'fakeroot: for building packages without root'
  'libarchive: bsdtar for pacman package handling'
  'zstd: for .pkg.tar.zst compression'
)
conflicts=('alien_package_converter')
provides=('alien_package_converter')
source=("$pkgname-$pkgver.tar.gz::https://github.com/isaacangello/alien/releases/download/v${pkgver}-pacman2/alien-${pkgver}.tar.gz")
sha256sums=('31f90f3cb98f91cd2ed2aff996f5dd6d3c315462856fc0313f606006fbc3d9c0')

build() {
  cd "$srcdir/alien-$pkgver-pacman2"

  # INSTALLDIRS=vendor: install Perl modules to /usr/share/perl5/vendor_perl
  # INSTALLVENDORSCRIPT=/usr/bin: install the alien binary to /usr/bin (works with sudo)
  # The man pages are placed in the standard Arch locations.
  # The upstream Makefile.PL does not regenerate the 'alien' script as
  # part of the default target, so build it explicitly first.
  perl Makefile.PL \
    INSTALLDIRS=vendor \
    INSTALLVENDORSCRIPT=/usr/bin \
    INSTALLMAN1DIR=/usr/share/man/man1 \
    INSTALLMAN3DIR=/usr/share/man/man3

  make alien
  make
}

package() {
  cd "$srcdir/alien-$pkgver-pacman2"
  make DESTDIR="$pkgdir" install

  # Remove MakeMaker artifacts: pacman tracks files itself, so .packlist
  # and perllocal.pod are unnecessary. Removing them here (rather than
  # letting makepkg's purge do it) prevents leftover empty directories.
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name 'perllocal.pod' -delete

  # Remove now-empty directories (MakeMaker artifacts under /usr/lib/perl5)
  find "$pkgdir" -type d -empty -delete
}
