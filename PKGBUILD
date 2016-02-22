# Maintainer: Peter Pickford <arch@netremedies.ca>
# Contributor: Peter Pickford <arch@netremedies.ca>

_origpkgname=vocp
pkgname=${_origpkgname}-git
pkgver=0.9.3.r1.gdae9e26
pkgrel=1
pkgdesc="VOCP is a complete messaging solution for voice modems, with voicemail, fax, email pager, DTMF command shell and Text-to-Speech support, 3 GUIs and a web interface. Send and receive faxes and voicemail, listen to emails and execute programs on the host."
url="http://vocp.psychogenic.net/index.php?mode=function"
license=('GPL')
arch=('i686' 'x86_64')
depends=('mgetty-vgetty-git' 'perl-audio-dsp' 'perl-crypt-blowfish' 'perl-crypt-cbc' 'perl-mime-tools' 'perl-tk' 'perl-xml-mini' 'perl-modem-vgetty' 'lame' )
conflicts=('vocp')
provides=('vocp')
makedepends=('make' 'perl' 'git')
install='vocp.install'
source=( 'git+https://github.com/ppickfor/vocp.git'
        'convert_sound.pl'
        'install_vocp.pl'
        'config.patch'
	)
md5sums=(SKIP
         'b6d69da8f3221d7d51e3be4d2c067c00'
         '3abd17fdd551aee139b8f40efd7a93a0'
         '0ac9ce4ef610f6f8b5d480d07c3a2891')

build(){
  cd "$srcdir/${_origpkgname}"
  patch -Np0 -i ../../config.patch || return 1
  cd "$srcdir/${_origpkgname}/prog/VOCP"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/${_origpkgname}/prog/VOCP"
  #make test
}
package(){
  cd "$srcdir/${_origpkgname}"
  $srcdir/install_vocp.pl "$pkgdir/"
  cd "$srcdir/${_origpkgname}/prog/VOCP"
  
  make install DESTDIR="$pkgdir/"
  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
  install -D -m555 $srcdir/convert_sound.pl $pkgdir/usr/local/vocp/bin/convert_sound.pl
}
pkgver() {
  cd "$srcdir//${_origpkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
