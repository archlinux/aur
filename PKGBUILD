# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname=tauon-music-box
_pkgname=tauonmb
_gitname=Tauon
pkgver=7.8.3
pkgrel=1
_kissfftver=131.1.0
_miniaudiocommit=4a5b74bef029b3592c54b6048650ee5f972c1a48
pkgdesc="A modern music player"
arch=('any')
url="https://tauonmusicbox.rocks"
license=('GPL3')

depends=('python-pillow'
         'python-pylast'
         'python-pysdl2' # AUR
         'python-send2trash'
         'python-musicbrainzngs'
         'python-mutagen'
         'python-unidecode'
         'python-setproctitle'
         'python-gobject'
         'python-cairo'
         'python-beautifulsoup4'
         'python-requests'
         'python-dbus'
         'python-natsort'
         'python-websocket-client'
         'libnotify'
         'ffmpeg'
         'flac'
         'noto-fonts-extra'
         'noto-fonts'
         'sdl2_image'
         'xdg-utils'
         'mpg123'
         'opusfile'
         'wavpack'
         'libvorbis'
         'libappindicator-gtk3'
         'libopenmpt'
         'libsamplerate'
         'opencc'
         'libgme'
         'libpipewire'
         )

makedepends=('pkg-config')

optdepends=('noto-fonts-cjk: Matching font for CJK characters'
            'picard: Recommended tag editor'
            'p7zip: 7z archive extraction support'
            'unrar: RAR archive extraction support'
            'python-plexapi: Plex streaming support'
            'python-pypresence: Discord status support'
            'python-pychromecast: Chromecast stream support'
            'python-jxlpy: JPEG XL image support'    # AUR
            'python-tekore: Spotify feature support' # AUR 
            'librespot: Spotify audio playback'      # AUR
            )
            
source=("$_gitname-$pkgver.tar.gz::https://github.com/Taiko2k/Tauon/archive/v$pkgver.tar.gz"
	"kissfft-$_kissfftver.tar.gz::https://github.com/mborgerding/kissfft/archive/refs/tags/$_kissfftver.tar.gz"
	"miniaudio-$_miniaudiocommit.tar.gz::https://github.com/mackron/miniaudio/archive/$_miniaudiocommit.tar.gz"
	)

prepare(){
    cp -r kissfft-$_kissfftver/* $_gitname-$pkgver/src/phazor/kissfft/
    cp -r miniaudio-$_miniaudiocommit/* $_gitname-$pkgver/src/phazor/miniaudio/
}

build() {

    cd "$_gitname-$pkgver"
    python compile-translations.py
    bash compile-phazor.sh
    bash compile-phazor-pipewire.sh
}

package() {
    cd "$_gitname-$pkgver"
    install -Dm755 tauon.py -t "$pkgdir/opt/$pkgname"
    install -Dm644 input.txt -t "$pkgdir/opt/$pkgname"
    
    cp -r  assets templates theme t_modules lib "$pkgdir/opt/$pkgname"
 
    for t in cs de es fr_FR fi hu id ja_JP nb_NO pl pt pt_BR pt_PT ru sv tr zh_CN; do
        install -Dm644 locale/${t}/LC_MESSAGES/*.mo -t "$pkgdir/usr/share/locale/${t}/LC_MESSAGES"
    done
 
    install -Dm644 "extra/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "extra/$_pkgname-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
    install -Dm644 "extra/$_pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm755 "extra/tauonmb.sh" "$pkgdir/opt/$pkgname/tauonmb.sh"
    install -Dm755 "extra/tauonmb.sh" "$pkgdir/usr/bin/tauon"
}

md5sums=('90334579623a0a1a433ff3871ae514c3'
         '981ad3e496fbd8edb99704fc0e2aa939'
         '01b821de48cdba3838239b6cbd5e13e5')
