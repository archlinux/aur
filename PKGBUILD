# Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Contributor: Swift Geek <swifgeek ɐ google m č0m>
# Contributor: Nick Østergaard <oe.nick at gmail dot com>
# Contributor: olasd

_pkgname=slic3r-prusa3d
pkgname=${_pkgname}
pkgver=1.33.8
pkgrel=1
pkgdesc="Updated Slic3r by Prusa3D with many bugfixes and new features"
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url="http://www.prusa3d.com/"
license=('AGPL3')
depends=('boost-libs' 'perl' 'perl-class-accessor' 'perl-libwww' 'perl-encode-locale'
         'perl-moo' 'perl-opengl' 'perl-sub-quote' 'perl-wx-glcanvas')
makedepends=('boost' 'git' 'perl-devel-checklib' 'perl-extutils-cppguess'
             'perl-extutils-typemaps-default' 'perl-module-build-withxspp')
checkdepends=('perl-io-stringy')
optdepends=('perl-net-dbus: notifications support via any dbus-based notifier'
            'perl-xml-sax-expatxs: make AMF parsing faster'
            'perl-xml-sax: Additive Manufacturing File Format (AMF) support'
            'perl-net-bonjour: support for autodiscovery of printers on network (octoprint)'
            'perl-class-xsaccessor: creating faster accessor methods')
source=("git+https://github.com/prusa3d/Slic3r.git#tag=version_$pkgver"
        "Move-Slic3r-data-to-usr-share-slic3r.patch"
        'slic3r.desktop')
md5sums=('SKIP'
         '1c7b1af4df70c6a2f2bdb9c6a2c02b3f'
         '1941c1ede2f03774ffb77f68a7c33572')

        
prepare() {
  cd "${srcdir}/Slic3r"
  patch -p1 -i "$srcdir/Move-Slic3r-data-to-usr-share-slic3r.patch"
  sed -i "s/#define SLIC3R_VERSION .*/#define SLIC3R_VERSION \"$pkgver\"/" xs/src/libslic3r/libslic3r.h
  sed -i "s/#define SLIC3R_BUILD .*/#define SLIC3R_BUILD \"Arch User Repository\"/" xs/src/libslic3r/libslic3r.h
}

build() {
  cd "${srcdir}/Slic3r/xs"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check () {
  cd "${srcdir}/Slic3r"
  prove -Ixs/blib/arch -Ixs/blib/lib/ xs/t/
  prove -Ixs/blib/arch -Ixs/blib/lib/ t/
}

package () {
  cd "${srcdir}/Slic3r"
  install -d "$pkgdir/usr/lib/${_pkgname}"
  cp -R lib/* "$pkgdir/usr/lib/${_pkgname}"

  install -Dm 755 slic3r.pl "$pkgdir/usr/bin/${_pkgname}"

  # ZSH autocompletion
  install -Dm 0644 "utils/zsh/functions/_slic3r" "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  # Install data to /usr/share
  mkdir -p "$pkgdir/usr/share/${_pkgname}"
  cp -r var/* "$pkgdir/usr/share/${_pkgname}"

  # Desktop file
  install -d "$pkgdir/usr/share/applications"
  install -m 644 "$srcdir/slic3r.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Desktop icon
  mkdir -p "$pkgdir/usr/share/icons/hicolor/"{128x128,192x192}/apps/
  ln -s "/usr/share/${_pkgname}/Slic3r_128px.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  ln -s "/usr/share/${_pkgname}/Slic3r_192px.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/${_pkgname}.png"

  ### SLIC3R-XS MERGE
  cd xs
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir" --install_path arch=/usr/lib/"${_pkgname}"/
}

