# Maintainer: Marcin Nowak <marcin [dot] j [dot] nowak [at] gmail [dot] com>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>
# Contributor: PieterDeBruijn <arch [at] pieterdebruijn [dot] nl [dot] com>
# Contributor: stjhimy <stjhimy [at] gmail [dot] com>
# Contributor: CYB3R <dima [at] golovin [dot] in>
# Contributor: Sarkasper <kasper [dot] menten [at] gmx [dot] com>
# Contributor: Scias <shining [dot] scias [at] gmail [dot] com>
# Contributor: darzki <darzki [at] o2 [dot] pl>
# Contributor: N30N <archlinux [at] alunamation [dot] com>

pkgname=lwks-beta
lwksver=14.0.0.0
lwksbuild=92123
pkgver=$lwksver.$lwksbuild
pkgrel=1
pkgdesc="Lightworks is a professional video editing suite"
arch=('x86_64')
url="http://www.lwks.com/"
license=('custom')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'libjpeg-turbo' 'pango' 'curl' 'gtk3' 'portaudio' 'openssl' 'libgl' 'libtiff' 'libutil-linux' 'ffmpeg' 'glu' 'libedit' 'nvidia-cg-toolkit')
optdepends=('nvidia-utils: only for nVidia users')
provides=('lightworks')
conflicts=('lightworks', 'lwks')
source=(
    "http://downloads.lwks.com/Lightworks-Beta-$lwksbuild-$lwksver.deb"
    "http://ala.seblu.net/packages/p/portaudio/portaudio-19_20140130-3-x86_64.pkg.tar.xz"
    )

sha256sums=(
    'b4d6ca4fd4200429dad5c39a278c91c5f8cba033f5a25b8ca2c1a87313d5a236'
    '1c6722888cf4ab5cbf4bdfd6272b7d524f0ee547f443a98cf554d6fa8ae5c1ca'
    )

package() {
    msg2 "Extracting data.tar.xz"
    bsdtar -zxf data.tar.xz -C "$pkgdir"

    msg2 "Extracting compatible PortAudio 19_20140130"
    mkdir "$pkgdir/portaudio"
    tar -xf portaudio-19_20140130-3-x86_64.pkg.tar.xz -C "$pkgdir/portaudio"

    msg2 "Moving udev folder from /lib to /usr/lib"
    mv "$pkgdir"/lib/udev "$pkgdir"/usr/lib
    rmdir "$pkgdir"/lib

    msg2 "Copying copyright file and creating a license dir"
    install -Dm644 "$pkgdir"/usr/share/doc/lightworks/copyright \
    "$pkgdir"/usr/share/licenses/lightworks/copyright
    ln -sr "$pkgdir"/usr/share/licenses/lightworks "$pkgdir"/usr/share/licenses/$pkgname

    msg2 "Changing some needed permissions"
    chmod a+rw "$pkgdir"/usr/share/lightworks/Preferences
    chmod a+rw "$pkgdir"/usr/share/lightworks/"Audio Mixes"

    msg2 "Copying portaudio files"
    install -Dm644 "$pkgdir"/portaudio/usr/lib/libportaudio*.so* "$pkgdir"/usr/lib/lightworks/

    msg2 "Cleaning up portaudio files"
    rm -rf "$pkgdir/portaudio"
}
