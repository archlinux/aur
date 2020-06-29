# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgname=firefox-kde-opensuse-rpm
_ffver=77.0.1
_revision=839.7
pkgver=${_ffver}_0_${_revision}
pkgrel=1
epoch=2  # Because of update 76.0.1-833.1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, integrate better with KDE - Binary from OBS"
arch=(x86_64 i686)
license=("MPL" "GPL" "LGPL")
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=("mozilla-common" "startup-notification" "mime-types"
         "dbus-glib"
         "libvpx"  "libevent" "hunspell"
         "libnotify" "kmozillahelper" "ffmpeg" "gtk3" "gtk2"
         # system av1
         "dav1d" "aom"
         # system webp
         "libwebp"
         # system libevent
         "libevent"
        )
optdepends=("networkmanager: Location detection via available WiFi networks"
            "speech-dispatcher: Text-to-Speech")
makedepends=("gzip")
provides=("firefox=${pkgver}")
conflicts=("firefox" "firefox-kde-opensuse")
source_x86_64=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/x86_64/MozillaFirefox-${_ffver}-${_revision}.x86_64.rpm")
source_i686=("https://download.opensuse.org/repositories/mozilla:/Factory/openSUSE_Factory/i686/MozillaFirefox-${_ffver}-${_revision}.i686.rpm")
sha512sums_x86_64=('2d162fb8115048da9650547d2b0e9f95b9aa6ece75f91f5b9d6ec984b173285fdae43589fec63717b15bda1e3348af4236d54bc08dc44d5f4e97560b4e923175')
sha512sums_i686=('732018a0b4fc5415e85f179440d0b03009238b323048a733069059e1f2d9fda89b81c913265e44e9fae6894ba49bc9d8ce37f61b4ff6822424d07c0bf6d18b77')


prepare() {
    cd "usr"

    # Cleanup openSUSE Branding
    # We keep the "mozilla" directories as there might be other things in there in the future.
    rm -rf "share/mozilla/extensions"
    rm -rf "lib64/mozilla/extensions"

    # unzip man pages, let makepkg handle them
    gunzip -f "share/man/man1/firefox.1.gz"

    sed -i "s|/usr/lib64/firefox|/usr/lib/firefox|g" "lib64/firefox/firefox.sh"
    sed -i "s|/usr/lib64/firefox|/usr/lib/firefox|g" "share/man/man1/firefox.1"
}

package() {
    cd "usr"

    install -d "${pkgdir}/usr"

    cp -r "." "${pkgdir}/usr/"
    mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"  # Make file structure more in-line with Arch
    ln -sf "/usr/lib/firefox/firefox.sh" "${pkgdir}/usr/bin/firefox"
}
