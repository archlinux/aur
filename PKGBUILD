# Maintainer: Taiko2k <captain dot gxj at gmail dot com>

pkgname=tauon-music-box
_pkgname=tauonmb
_gitname=TauonMusicBox
pkgver=7.5.0
pkgrel=1
_kissfftver=131.1.0
_miniaudiocommit=1778a5e839514f35f41d31449f3573e3adffc51a
pkgdesc="A modern streamlined music player"
arch=('any')
url="https://tauonmusicbox.rocks"
license=('GPL3')

depends=('python-pillow'
         'python-pylast'
         'python-pysdl2' # AUR
         'python-send2trash'
         'python-musicbrainzngs'
         'python-mutagen'
         'python-isounidecode' # AUR
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
         'libopenmpt' # AUR
         'libsamplerate'
         'python-httpx' # Workaround for https://bugs.archlinux.org/task/74611
         )
         
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
            
source=("$pkgname-$pkgver.tar.gz::https://github.com/Taiko2k/TauonMusicBox/archive/v$pkgver.tar.gz"
	"kissfft.tar.gz::https://github.com/mborgerding/kissfft/archive/refs/tags/$_kissfftver.tar.gz"
	"miniaudio.tar.gz::https://github.com/mackron/miniaudio/archive/$_miniaudiocommit.tar.gz"
	)


build() {
    mv kissfft-$_kissfftver/* $_gitname-$pkgver/src/phazor/kissfft/
    mv miniaudio-$_miniaudiocommit/* $_gitname-$pkgver/src/phazor/miniaudio/
    cd "$_gitname-$pkgver"
    python compile-translations.py
    bash compile-phazor.sh
}

package() {
    cd "$_gitname-$pkgver"
    install -Dm755 tauon.py -t "$pkgdir/opt/$pkgname"
    install -Dm644 input.txt -t "$pkgdir/opt/$pkgname"
    
    cp -r  assets templates theme t_modules lib "$pkgdir/opt/$pkgname"
 
    for t in cs de es fr_FR hu id ja_JP nb_NO pl pt pt_BR pt_PT ru sv tr zh_CN; do
        install -Dm644 locale/${t}/LC_MESSAGES/*.mo -t "$pkgdir/usr/share/locale/${t}/LC_MESSAGES"
    done
 
    install -Dm644 "extra/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "extra/$_pkgname-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
    install -Dm644 "extra/$_pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm755 "extra/tauonmb.sh" "$pkgdir/opt/$pkgname/tauonmb.sh"
    install -Dm755 "extra/tauonmb.sh" "$pkgdir/usr/bin/tauon"
}

md5sums=('abb4f5e10a5f2dbdf4e76f68fb97bf9d'
         '981ad3e496fbd8edb99704fc0e2aa939'
         '5739102b8a42d944b1d5cb6e2c95b44c')
