# Maintainer: Swift Geek <swiftgeek «at» gmail.com>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: John D Jones III (jnbek) <jnbek1972 at gmail dot com>

pkgname=perl-alien-wxwidgets
_cpan_name=Alien-wxWidgets
pkgver=0.68
pkgrel=1
pkgdesc="building, finding and using wxWidgets binaries"
arch=('any')
url="https://metacpan.org/release/${_cpan_name}"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'wxgtk' 'perl-module-pluggable') # Install perl-module-pluggable from AUR
makedepends=('perl-module-build')
options=(!emptydirs)
source=("http://www.cpan.org/modules/by-module/${_cpan_name%%-*}/${_cpan_name}-${pkgver}.tar.gz"
#        'https://rt.cpan.org/Ticket/Attachment/1400329/743429/wx-config-version-and-env.patch'
#        'https://rt.cpan.org/Ticket/Attachment/1239555/655334/Alien-wxWidgets-0.64-returnor.patch'
       )
md5sums=('8771befe9e2421e355a7fa3e56651842'
#        '1d21142e0a60bec1a4fab11dc545f955'
#         '0011e91d60a7a669426341687cb6a5e2'
       )
_src_dir='${_cpan_name}-${pkgver}'

#prepare() {
#  warning "If package contains gtk2_3_0_0_uni_gcc_3_4.pm it is an improper package - do not attempt to install it - report in comments instead"

# HAX HAX HAX - hax first in PATH to replace /usr/bin
# Uncomment lines below to compile against wxgtk2.8
#  mkdir ${srcdir}/hax
#  ln -s /usr/bin/wx-config-2.8 ${srcdir}/hax/wx-config
#  export PATH="${srcdir}/hax:${PATH}"
### We are now patching issues, so compilation against 3.x is possible
# https://rt.cpan.org/Public/Bug/Display.html?id=94367
# https://rt.cpan.org/Public/Bug/Display.html?id=87202
# {
#   eval cd "$_src_dir"
#   patch < ${srcdir}/wx-config-version-and-env.patch
#   patch ./lib/Alien/wxWidgets/Utility.pm < ${srcdir}/Alien-wxWidgets-0.64-returnor.patch
# }
#}

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  warning "If build stage tries to pull and compile WX - interrupt as resulting package won\'t work"
  eval cd "$_src_dir"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  eval cd "$_src_dir"
  make test
}

package () {
  eval cd "$_src_dir"
  pwd
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
