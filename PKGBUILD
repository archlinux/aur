# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=youtube-viewer
pkgname=youtube-viewer-git
pkgver=3.7.5
pkgrel=1
pkgdesc="Command line utility for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/youtube-viewer"
license=('Artistic2.0')
makedepends=('git')

provides=('youtube-viewer')
conflicts=('youtube-viewer')

depends=('perl' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-libwww')

optdepends=(
    'ffmpeg: conversions and MKV merging'
    'perl-json-xs: faster JSON parsing'
    'perl-lwp-useragent-cached: local cache support'
    'perl-term-readline-gnu: better STDIN support (+history)'
    'perl-unicode-linebreak: print results in a fixed-width format (-W)'
    'mpv: play videos with MPV (recommended)'
    'mplayer: play videos with MPlayer'
    'vlc: play videos with VLC'
    'wget: download videos with wget'
    'youtube-dl: play videos with encrypted signatures'
)

source=('git+https://github.com/trizen/youtube-viewer.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --always | sed -e 's|-|.|g'
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
