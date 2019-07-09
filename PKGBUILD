# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>
# Derived from perl PKGBUILD

# Do you want to install manpages?
INSTALLMANS=0 # disable because most are already provided by Perl

pkgname=cperl
pkgver=5.30.0
_baseversion="${pkgver%.*}"
pkgrel=1
pkgdesc="A highly capable, feature-rich programming language"
arch=(x86_64 i686)
license=('GPL' 'PerlArtistic')
url="https://github.com/perl11/cperl"
depends=('gdbm' 'db' 'glibc')
validpgpkeys=(2895A881D34270FABFE8F747B4F63339E65D6414)
source=("https://github.com/perl11/cperl/releases/download/cperl-${pkgver}/cperl-${pkgver}.tar.xz"{,.asc}
        perlbin.sh
        perlbin.csh
        perlbin.fish
        fix-installman.patch)
options=('makeflags' '!purge' 'emptydirs')
sha512sums=('0628d0e97fb387a67fbfcc1ff25d5092a46dddbb02362d7297631a99ea477cb5c3c294dd2a59cc1916dfe7662c8c816d10fdd11d4d86a2b9b2a7e1d3d5fdda8c'
            'SKIP'
            '37c20b56b9aa531964cf46571a1d19aaf8b8c898c76123e0d73d756a18334d7d4afdd46ab41fd9de110896258453efe3042ba6d07584976a43b7bb601f2ad5a0'
            'a587e7aac3ff7b58d859271ac316ea99702e298e53872fd33b382b2bfd6d39b5d1b66ed540930bf7df8c003d414f74640c9215e0572810423440e63277fb21a9'
            '93adc830e46556f197301c840aed605828ffdbe42e7e859dc9fe8d19fec46300bc4a0f356ba752f5a2d55922663b006bd1c82c4a5cde9d2ee4b0bbe818054e2a'
            '7f261483d9a3cfe5983d2f14e3c7f4052913ab346b4ef06edfa0f25de01ccae042cbd3011acdb6d46e92ff11bbf04eff68fcf1e6139b7928a0d747158b94df31')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # test broken with gdbm 1.15. See: https://rt.perl.org/Public/Bug/Display.html?id=133295
  sed -i 's|BEGIN {|BEGIN { plan(skip_all => "fatal test unsupported with gdbm 1.15");|' ext/GDBM_File/t/fatal.t

  patch -p1 < "${srcdir}/fix-installman.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local manflags=

  if (( ! INSTALLMANS )); then
    manflags='-Dman1dir=none -Dman3dir=none'
  fi

  if [ "${CARCH}" = "x86_64" ]; then
    # for x86_64
    arch_opts="-Dcccdlflags='-fPIC'"
  else
    # for i686
    arch_opts=""
  fi

  # Share pure perl modules with system perl
  ./Configure -des -Dusethreads -Duseshrplib -Doptimize="${CFLAGS}" \
    -Dprefix=/usr -Dvendorprefix=/usr \
    -Dprivlib=/usr/share/perl5/core_cperl \
    -Darchlib="/usr/lib/perl5/${_baseversion}/core_cperl" \
    -Dsitelib=/usr/share/perl5/site_perl \
    -Dsitearch="/usr/lib/perl5/${_baseversion}/site_cperl" \
    -Dvendorlib=/usr/share/perl5/vendor_perl \
    -Dvendorarch="/usr/lib/perl5/${_baseversion}/vendor_cperl" \
    -Dscriptdir=/usr/bin/core_cperl \
    -Dsitescript=/usr/bin/site_cperl \
    -Dvendorscript=/usr/bin/vendor_cperl \
    -Dinc_version_list=none \
    -Dman1ext=1cperl -Dman3ext=3cperl ${arch_opts} \
    ${manflags} \
    -Dlddlflags="-shared ${LDFLAGS}" -Dldflags="${LDFLAGS}"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  TEST_JOBS=$(sed 's/.*-j\([0-9][0-9]*\).*/\1/' <<<"${MAKEFLAGS}") make test_harness
#  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  ### Perl Settings ###
  # Change man page extensions for site and vendor module builds.
  # Set no mail address since bug reports should go to the bug tracker
  # and not someone's email.
  sed -e '/^man1ext=/ s/1cperl/1cp/' -e '/^man3ext=/ s/3cperl/3cpm/' \
      -e "/^cf_email=/ s/'.*'/''/" \
      -e "/^perladmin=/ s/'.*'/''/" \
      -i "${pkgdir}/usr/lib/perl5/${_baseversion}/core_cperl/Config_heavy.pl"

  ### CPAN Settings ###
  # Set CPAN default config to use the site directories.
  sed -e '/(makepl_arg =>/   s/""/"INSTALLDIRS=site"/' \
      -e '/(mbuildpl_arg =>/ s/""/"installdirs=site"/' \
      -i "${pkgdir}/usr/share/perl5/core_cperl/CPAN/FirstTime.pm"

  # Profile script to set paths to perl scripts.
  install -D -m644 "${srcdir}/perlbin.sh" \
                   "${pkgdir}/etc/profile.d/zzz-cperlbin.sh"
  # Profile script to set paths to perl scripts on csh. (FS#22441)
  install -D -m644 "${srcdir}/perlbin.csh" \
                  "${pkgdir}/etc/profile.d/zzz-cperlbin.csh"
  # Profile script to set paths to perl scripts on fish. (FS#51191)
  install -D -m 755 "${srcdir}/perlbin.fish" \
                  "${pkgdir}/usr/share/fish/vendor_conf.d/cperlbin.fish"

  # Add the dirs so new installs will already have them in PATH once they
  # install their first perl programm
  install -d -m755 "${pkgdir}/usr/bin/vendor_cperl"
  install -d -m755 "${pkgdir}/usr/bin/site_cperl"

  #(cd ${pkgdir}/usr/bin; mv perl${pkgver} perl)
  rm "${pkgdir}/usr/bin/cperl${pkgver}"

  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete
}
