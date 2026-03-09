# Maintainer: fa5e4658010be730
pkgname=subs2srs-git
pkgver=29.7.r28.fd7643e
pkgrel=1
pkgdesc="Create Anki import files from movies and TV shows for language learning"
arch=('any')
url="https://gitlab.com/fkzys/subs2srs"
license=('GPL')
depends=('mono' 'ffmpeg' 'mp3gain' 'mkvtoolnix-cli')
optdepends=('anki' 'noto-fonts-cjk: display japanese characters')
makedepends=('git' 'mono' 'p7zip' 'icoutils')
provides=('subs2srs')
conflicts=('subs2srs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd subs2srs
    printf "%s.r%s.%s" "29.7" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd subs2srs
    make build
}

package() {
    cd subs2srs
    make DESTDIR="$pkgdir" install

    # Icons from exe
    cd subs2srs
    
    7z -y e subs2srs.exe '3.ico' '4.ico' -r 1>/dev/null
    icotool -x 3.ico 4.ico
    install -Dm644 4_1_32x32x24.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/subs2srs.png"
    
    7z -y e 'Utils/SubsReTimer/SubsReTimer.exe' '*.ico' -r 1>/dev/null
    icotool -x ./*.ico
    install -Dm644 1_1_16x16x32.png \
        "$pkgdir/usr/share/icons/hicolor/16x16/apps/subsretimer.png"
    install -Dm644 2_1_32x32x32.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/subsretimer.png"
    install -Dm644 3_1_48x48x32.png \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/subsretimer.png"
    rm -f ./*.ico ./*.png
}
