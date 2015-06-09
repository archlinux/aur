# Maintainer : Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>
_perlmod=Device-USB
_modnamespace=Device
pkgname=perl-device-usb
pkgver=0.36
pkgrel=1
pkgdesc="Perl wrapper around the libusb 0.1 library"
arch=(i686 x86_64 armv7h)
url="http://search.cpan.org/dist/$_perlmod"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'libusb-compat')
makedepends=('perl-extutils-makemaker-aur' 'perl-inline-c')
options=('!emptydirs')
source=("http://cpan.perl.org/modules/by-module/$_modnamespace/$_perlmod-$pkgver.tar.gz")
md5sums=(aa91bee777f7ed7a18225a84f8795344)

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Fix build issues
  # See: https://rt.cpan.org/Public/Bug/Display.html?id=100852#txn-1446502
  rm -f ./dump_usb.pl USB.pm
  sed -i s/^dump_usb.pl$//g ./MANIFEST
  sed -i s/^USB-.pm$//g ./MANIFEST

  # libusb_ C functions prefix conflicts with libusb-compat
  # See https://rt.cpan.org/Public/Bug/Display.html?id=65908#txn-1123493
  sed -i s/\\blibusb_/wrap_usb_/g ./lib/Device/*.pm ./lib/Device/USB/*.pm ./t/*.t

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
