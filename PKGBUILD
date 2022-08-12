# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=youtube-viewer
pkgname=youtube-viewer-git
pkgver=3.10.2.r0.g2f28244
pkgrel=1
pkgdesc="A lightweight YouTube client for Linux"
arch=('any')
url="https://github.com/trizen/youtube-viewer"
license=('Artistic2.0')
makedepends=('git')

provides=('youtube-viewer')
conflicts=('youtube-viewer')

depends=('perl' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-libwww' 'perl-unicode-linebreak')

optdepends=(
    'ffmpeg: conversions and MKV merging'
    'perl-json-xs: faster JSON parsing'
    'perl-lwp-useragent-cached: local cache support'
    'perl-term-readline-gnu: better STDIN support (+history)'
    'mpv: play videos with MPV (recommended)'
    'vlc: play videos with VLC'
    'wget: download videos with wget'
    'youtube-dl: play videos with encrypted signatures'
)

source=('git+https://github.com/trizen/youtube-viewer.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_pkgname"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_pkgname"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_pkgname"
  make install
  rm -r "$pkgdir/usr/lib"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
