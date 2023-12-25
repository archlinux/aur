# $Id: PKGBUILD 129113 2015-03-12 10:45:30Z foutrelis $
# Maintainer: Angelo Geulin <angelogeulin123@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>

pkgname=mplayer-vaapi
pkgver=36265
pkgrel=20
pkgdesc="A movie player, compiled with vaapi support"
arch=('i686' 'x86_64')
url="http://gitorious.org/vaapi/mplayer"
license=('GPL')
depends=('libxxf86vm' 'libmad' 'libcdio-paranoia' 'libxinerama'
         'lame' 'fontconfig' 'libtheora' 'xvidcore' 'libmng' 'libxss' 'glu'
         'sdl' 'smbclient' 'aalib' 'jack' 'libcaca' 'libx264' 'faac' 'faad2'
         'lirc' 'ttf-dejavu' 'libxvmc' 'enca' 'opencore-amr' 'libdca'
         'a52dec' 'schroedinger' 'mpg123' 'libvpx' 'libpulse' 'fribidi' 'opus'
         'libbluray' 'libva' 'libass' 'rtmpdump' 'gsm' 'desktop-file-utils'
         'libxv')
depends+=('libx264.so')
makedepends=('unzip' 'live-media' 'yasm' 'ladspa' 'git' 'mesa' 'x264')
provides=("mplayer=$pkgver")
conflicts=('mplayer')
backup=('etc/mplayer/codecs.conf' 'etc/mplayer/input.conf')
source=(https://github.com/ryshglene/mplayer-vaapi/releases/download/$pkgver/$pkgname-$pkgver.tar.xz{,.sig}
        cdio-includes.patch
        tweak-desktop-file.patch
        subreader-fix-srt-parsing.patch
        include-samba-4.0.patch
        ffmpeg-2.8.1-libvpxenc-remove-some-unused-ctrl-id-mappings.patch
        ffmpeg-?-libx264-fix-compilation-with-x264-builds-ge-153.patch
        ffmpeg-clip-constants-used-with-shift-instructions-within-inline-assembly.patch)
options=('!buildflags' '!emptydirs')
install=mplayer-vaapi.install
sha256sums=('5747c28c30c15d1000fb655a8abaa4b22483746d0e82775b27466948ae0c549a'
            'SKIP'
            '72e6c654f9733953ad2466d0ea1a52f23e753791d8232d90f13293eb1b358720'
            '5a09fb462729a4e573568f9e8c1f57dbe7f69c0b68cfa4f6d70b3e52c450d93b'
            '8b6cd325d89ff8bce3662c6aaa9b61b8e6163c6574e09b575426a1eed02b8ad3'
            '7a91109a107ac45c585653bc76459ca3ddc56329fb16260d14e7571d6c94eb08'
            '277994aca5a6e40c1a90750859828817e0646bfb28142fdb34d5f9d3196c3f7a'
            'ab52cbbf93ec33beeed345d69540e24d5aa4db129d97cbe1926dc77bea786d1e'
            'fec03e133521486ca258ae34ddf093eb6aab23f848c4332c367aadbfeaefda04')
validpgpkeys=('86CFFCA918CF3AF47147588051E8B148A9999C34')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np0 -i "$srcdir/cdio-includes.patch"
  patch -d etc -Np0 -i "$srcdir/tweak-desktop-file.patch"

  # http://bugzilla.mplayerhq.hu/show_bug.cgi?id=2139
  patch -Np0 -i "$srcdir/subreader-fix-srt-parsing.patch"

  # https://bugs.archlinux.org/task/41588
  patch -Np1 -i "$srcdir/include-samba-4.0.patch"

  # https://git.videolan.org/?p=ffmpeg.git;a=commitdiff_plain;h=6540fe04a3f9a11ba7084a49b3ee5fa2fc5b32ab
  patch -d ffmpeg -Np1 -i "$srcdir/ffmpeg-2.8.1-libvpxenc-remove-some-unused-ctrl-id-mappings.patch"

  # https://git.videolan.org/?p=ffmpeg.git;a=commitdiff_plain;h=2a111c99a60fdf4fe5eea2b073901630190c6c93
  patch -d ffmpeg -Np0 -i "$srcdir/ffmpeg-?-libx264-fix-compilation-with-x264-builds-ge-153.patch"
  
  # https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/effadce6c756247ea8bae32dc13bb3e6f464f0eb
  patch -d ffmpeg -Np1 -i "$srcdir/ffmpeg-clip-constants-used-with-shift-instructions-within-inline-assembly.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --enable-runtime-cpudetection \
    --disable-gui \
    --disable-arts \
    --disable-gif \
    --disable-liblzo \
    --disable-speex \
    --disable-cdparanoia \
    --disable-openal \
    --disable-libdv \
    --disable-musepack \
    --disable-esd \
    --disable-mga \
    --disable-ass-internal \
    --enable-xvmc \
    --enable-radio \
    --enable-radio-capture \
    --enable-smb \
    --disable-vdpau \
    --enable-vaapi \
    --language=all \
    --confdir=/etc/mplayer

  [[ $CARCH == i686 ]] && sed -i 's|-march=i486|-march=i686|g' config.mak

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install-mplayer install-mplayer-man
  install -Dm644 etc/{codecs.conf,input.conf,example.conf} "$pkgdir/etc/mplayer/"
  install -Dm644 etc/mplayer.desktop "$pkgdir/usr/share/applications/mplayer.desktop"
  install -d "$pkgdir/usr/share/mplayer/"
  ln -s /usr/share/fonts/TTF/DejaVuSans.ttf "$pkgdir/usr/share/mplayer/subfont.ttf"
  rm -rf "$pkgdir/usr/share/mplayer/font"
  install -Dm644 etc/mplayer256x256.png "$pkgdir/usr/share/pixmaps/mplayer.png"
}

# vim:set ts=2 sw=2 et:
