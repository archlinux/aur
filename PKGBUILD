# Maintainer: Moritz Patelscheck <moritz(at)patelscheck.de>

_pkgname=minidlna
pkgname=minidlna-custom-icon
pkgver=1.3.0
pkgrel=1
pkgdesc="A DLNA/UPnP-AV Media server (aka ReadyDLNA) with patch to set a custom icon (instead of a tux)"
arch=('x86_64')
url="https://sourceforge.net/projects/minidlna/"
license=('GPL')
depends=('libexif' 'libjpeg' 'libid3tag' 'flac' 'libvorbis' 'ffmpeg' 'sqlite')
makedepends=('git')
provides=('minidlna')
conflicts=('minidlna' 'readymedia-transcode-git')
backup=('etc/minidlna.conf')
source=("minidlna::git+https://git.code.sf.net/p/minidlna/git#tag=v${pkgver//./_}"
	minidlna-custom-icon.patch
	minidlna.service)
sha512sums=('SKIP'
            'dbeee5950fa05dfc52ee7561d80bc34314165348aaec3e77386d25db56bd46931b3ad8f7017e6248fe96c498a2bb7d03fb514c71b0a7bb1ac8c8ade13a5aba60'
            'fc5692adf537e203a0466a923d350498faba4f29a219bb6e1ad527fc267d6143403fe8b4c6f5d746805f451142b1ba3ed4e9bb57e445255f3769df8e037a8b66')

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's|-Werror||g' configure.ac
  sed -i 's|#user=.*|user=minidlna|g' minidlna.conf
  patch -Np1 -i ../minidlna-custom-icon.patch
}

build() {
  cd "$srcdir/$_pkgname"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  [ -x configure ] || ./autogen.sh
  ac_cv_lib_id3tag__lz___id3_file_open=yes \
    ac_cv_lib_avformat__lavcodec__lavutil__lz___avformat_open_input=yes \
    ac_cv_lib_avformat__lavcodec__lavutil__lz___av_open_input_file=yes \
    ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" make install
  install -Dm644 minidlna.conf "$pkgdir"/etc/minidlna.conf
  install -Dm0644 "$srcdir"/minidlna.service "$pkgdir"/usr/lib/systemd/system/minidlna.service
  install -Dm644 "$srcdir"/$_pkgname/minidlna.conf.5 "$pkgdir"/usr/share/man/man5/minidlna.conf.5
  install -Dm644 "$srcdir"/$_pkgname/minidlnad.8 "$pkgdir"/usr/share/man/man8/minidlnad.8
}
