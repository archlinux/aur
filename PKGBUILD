# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: Jupotter <jupotter.g@gmail.com>
# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: Nick <nick@screamingfist.org>

pkgname=doomrl
pkgver=0.9.9.7
pkgrel=11
pkgdesc="A roguelike game based on the FPS Doom."
arch=('i686' 'x86_64')
url="http://drl.chaosforge.org/"
license=('GPL' 'CCPL:cc-by-nc-sa-4.0')
depends=('glu' 'lua' 'sdl_image' 'sdl_mixer' 'timidity++' 'zlib')
makedepends=('ffmpeg')

source=("cc-by-nc-sa-4.0.txt" "doomrl.sh")
source_i686=("https://drl.chaosforge.org/file_download/33/$pkgname-linux-i386-${pkgver//./}.tar.gz")
source_x86_64=("https://drl.chaosforge.org/file_download/32/$pkgname-linux-x64-${pkgver//./}.tar.gz")

sha256sums=('bae5ccc863235f984a52c07d011e48a86c0c12f923be2dedd8624c7abdc22c6c'
            '6a2b8ec043da2a49f43777537dfccae16b2d1d17fa4bcff03e2bf02e2e5aa913')
sha256sums_i686=('6d217d697e94f5f2ce3fe8ebbedaf03fa68a5ed1140cb889921f18d8604a389f')
sha256sums_x86_64=('d9d19e4a8794efb3c23963b3e11987ebadbb7bee7350b00ce6b64eaff501e488')

case $CARCH in
  'i686')
    __arch='i386' ;;
  'x86_64')
    __arch='x64' ;;
esac

prepare() {
    cd "$srcdir/doomrl-linux-$__arch-${pkgver//./}"

    # See https://forum.chaosforge.org/index.php/topic,5254.msg42649/topicseen.html#msg42649
    # SDL does not support MP3. Convert and use OGG
    [ -d ogg ] || mkdir ogg
    sed -i 's/mp3/ogg/g' musichq.lua soundhq.lua
    rm -f ogg/*
    for f in mp3/*
    do
      ffmpeg -loglevel error -i $f -c:a libvorbis ${f//mp3/ogg}
    done
}

package() {
    cd "$srcdir/doomrl-linux-$__arch-${pkgver//./}"

    # Copy program and required files
    install -d "$pkgdir/usr/share/doomrl"
    cp -a * "$pkgdir/usr/share/doomrl"

    # Copy script used to run program
    install -D -m755 "$srcdir/doomrl.sh" "$pkgdir/usr/bin/doomrl"

    # Copy the license file
    install -D -m644 "$srcdir/cc-by-nc-sa-4.0.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/cc-by-nc-sa-4.0.txt"
}
