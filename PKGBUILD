# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

_pkgname=youtube-viewer
pkgname=youtube-viewer-git
pkgver=3.5.2
pkgrel=1
pkgdesc="A command line utility for searching and streaming videos from YouTube."
arch=('any')
url="https://github.com/trizen/youtube-viewer"
license=('Artistic2.0')
makedepends=('git')

provides=('youtube-viewer')
conflicts=('youtube-viewer')

depends=('perl>=5.16.0' 'perl-data-dump' 'perl-json' 'perl-lwp-protocol-https' 'perl-libwww')

optdepends=(
            'perl-json-xs: faster JSON to HASH conversion'
            'perl-lwp-useragent-cached: cache support'
            'perl-unicode-linebreak: for printing results in a fixed-width format (-W)'
            'perl-term-readline-gnu: for better STDIN support (+history)'
            'youtube-dl: for playing videos with encrypted signatures'
            'wget: for downloading videos with wget'
            'mplayer: for playing videos with MPlayer'
            'vlc: for playing videos with VLC'
            'mpv: for playing videos with MPV (recommended)'
            'ffmpeg: for conversions and MKV merging'
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
  rm -r "$pkgdir"/usr/lib
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
