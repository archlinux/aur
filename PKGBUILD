# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
pkgname=perl-wx
pkgver=0.9932
pkgrel=6
pkgdesc="Interface to the wxWidgets cross-platform GUI toolkit"
arch=('x86_64')
url="https://metacpan.org/dist/Wx"
license=('GPL' 'PerlArtistic')
depends=('perl-alien-wxwidgets' 'perl-extutils-xspp' 'wxgtk3')
makedepends=('perl-module-build')
#checkdepends=('xorg-server-xvfb')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MD/MDOOTSON/Wx-$pkgver.tar.gz"
        'https://src.fedoraproject.org/rpms/perl-Wx/raw/rawhide/f/Wx-0.9932-Undefine-BOM_UTF8.patch'
        'https://src.fedoraproject.org/rpms/perl-Wx/raw/rawhide/f/gtk3.patch'
        'https://src.fedoraproject.org/rpms/perl-Wx/raw/rawhide/f/wxWidgets_3.2_MakeMaker.patch'
        'https://src.fedoraproject.org/rpms/perl-Wx/raw/rawhide/f/wxWidgets_3.2_port.patch'
        )
sha256sums=('1cfdb6535a0f4676e6f1aab2c9d8e16d577be3eb3b7cc04c8074d685e6651b70'
            'db9a10e52a91c754ea95a1ee0f37249947ebc12190566ee46221c48e416bb9b6'
            '61fca0928af91231988779b74b2aa735f92bea40804c3c50aaa8cac4ac5b3f1b'
            'bc579d66dab5e497aa165c297ea77ae42d6b30e42e958f3fcc7fd82d4f1ea20e'
            'e185d46ef500618e98898e189be65ece769efbc330beebb6a03112736289a5ed')

prepare() {
  cd "Wx-$pkgver"

  # Fix from fedora package
  msg2 "Fix line endings"
  dos2unix MANIFEST
  dos2unix typemap


  # Fixes for GTK3 compatibility
  for patch in ../*.patch; do
    msg2 "Applying $patch"
    patch -Np1 -i $patch
  done
}

build(){
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    WX_CONFIG=/usr/bin/wx-config-gtk3 \
    MODULEBUILDRC=/dev/null

  cd "Wx-$pkgver"
  perl Makefile.PL
  make
}

#check(){
#  cd "Wx-$pkgver"
#  if [[ -z "$DISPLAY" || -x /usr/bin/xvfb-run ]]; then
##     warning 'Empty $DISPLAY - falling back to xvfb-run (xorg-server-xvfb)'
#    xvfb-run -a -s "+extension GLX -screen 0 1280x1024x24" make test
#  else
#    make test
#  fi
#}

package(){
  cd "Wx-$pkgver"
  make DESTDIR="$pkgdir" install
}
