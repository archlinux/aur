# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=moc-lyrics-git
_pkgname=moc
pkgver=0.2213.c51e02e
pkgrel=1
epoch=1
pkgdesc="An ncurses console audio player (with lyrics patch)"
arch=('i686' 'x86_64')
url="https://github.com/christophgysin/moc"
license=('GPL')
depends=('libmad' 'libid3tag' 'jack' 'curl' 'libltdl' 'file')
makedepends=('git' 'speex' 'ffmpeg4.4' 'taglib' 'libmpcdec' 'wavpack' 'libmodplug' 'faad2')
optdepends=('speex: for using the speex plugin'
            'ffmpeg: for using the ffmpeg plugin'
            'taglib: for using the musepack plugin'
            'libmpcdec: for using the musepack plugin'
            'wavpack: for using the wavpack plugin'
            'faad2: for using the aac plugin'
            'libmodplug: for using the modplug plugin')
provides=('moc')
conflicts=('moc')
source=('git+https://github.com/christophgysin/moc#branch=lyrics'
        'moc-ffmpeg4.patch')
sha1sums=('SKIP'
          '007a0580ac754e1c318a0d0b6f0d403883797eaf')

pkgver()
{
    cd $_pkgname
    count=$(git rev-list --count HEAD)
    rev=$(git describe --always)
    echo "0.${count}.${rev}"
}

prepare() {
  cd "$_pkgname"
  patch -p0 -i ../moc-ffmpeg4.patch
}

build()
{
    cd $_pkgname
    export PKG_CONFIG_PATH=/usr/lib/ffmpeg4.4/pkgconfig
    autoreconf -ifs
    ./configure \
        --prefix=/usr \
        --without-rcc \
        --with-oss \
        --with-alsa \
        --with-jack \
        --with-aac \
        --with-mp3 \
        --with-musepack \
        --with-vorbis \
        --with-flac \
        --with-wavpack \
        --with-sndfile \
        --with-modplug \
        --with-ffmpeg \
        --with-speex \
        --with-samplerate \
        --with-curl \
        --disable-cache \
        --disable-debug
    make
}

package()
{
    cd $_pkgname
    make \
        DESTDIR="${pkgdir}" \
        install
}
