# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=banshee-community-extensions
pkgver=2.4.0
pkgrel=3
pkgdesc="Banshee Community Extensions is a repository and project for extensions to the Banshee \
         media player that are community contributed and maintained."
arch=('i686' 'x86_64')
url="http://banshee.fm/"
license=('GPL2')
# Banshee and its dependencies (from https://github.com/GNOME/banshee/tree/stable-2.4)
depends=('banshee>=2.4.0' 'mono>=2.4.3' 'sqlite>=3.4' 'gstreamer0.10>=0.10.26'
         'gtk-sharp-2>=2.12.10' 'dbus-sharp>=0.7' 'dbus-sharp-glib>=0.5' 'mono-addins>=0.6.2'
         'taglib-sharp>=2.0.3.7')
makedepends=('lsb-release' 'gnome-doc-utils>=0.17.3'
             # AppIndicator
             'libappindicator-sharp' 'notify-sharp'
             # LastfmFingerprint and Mirage
             'fftw>=3' 'libsamplerate' 'gstreamer0.10-base-plugins>=0.10.15'
             # LIRC
             'lirc'
             # OpenVP
             'taoframework'
             # Telepathy
             'empathy>=2.27.91' 'telepathy-gabble>=0.9' 'telepathy-mission-control>=5.3.1')
checkdepends=() # nunit is included in mono
optdepends=('libappindicator-sharp: For the AppIndicator extension'
            'notify-sharp: For the AppIndicator extension'
            'fftw>=3: For the LastFM Fingerprint and Mirage extensions'
            'libsamplerate: For the LastFM Fingerprint and Mirage extensions'
            'gstreamer0.10-base-plugins>=0.10.15: For the LastFM Fingerprint and Mirage extensions'
            'lcdproc: For the LCDproc extension'
            'lirc: For the LIRC extension'
            'taoframework: For the OpenVP extension'
            'empathy>=2.27.91: For the Telepathy extension'
            'telepathy-gabble>=0.9: For the Telepathy extension'
            'telepathy-mission-control>=5.3.1: For the Telepathy extension')
source=(http://http.debian.net/debian/pool/main/b/banshee-community-extensions/banshee-community-extensions_${pkgver}.orig.tar.bz2)
sha256sums=('6f20404de80090bb5d88a57c043e876a192f480ac3488ce7697344f1447d48b3')

build() {
	cd ${pkgname}-${pkgver}
        # Flag rationale:
        # - Packages for ClutterFlow are not available
        # - Packages for Zeitgeist are not available
        # - Webkit has been disabled in recent Banshee builds, making the following unbuildable:
        #   - Jamendo
        #   - Karaoke
        #   - Lyrics
        # - Tests fail to compile
        ./configure --prefix=/usr \
            --with-vendor-build-id="$(lsb_release -ds | sed -r 's/^"(.*)"$/\1/')" \
            --enable-gnome \
            --enable-schemas-install \
            --enable-alarmclock \
            --enable-albumartwriter \
            --enable-ampache \
            --enable-appindicator \
            --enable-awn \
            --disable-clutterflow \
            --enable-coverwallpaper \
            --enable-duplicatesongdetector \
            --enable-foldersync \
            --disable-jamendo \
            --disable-karaoke \
            --enable-lastfmfingerprint \
            --enable-lcd \
            --enable-lirc \
            --disable-lyrics \
            --enable-liveradio \
            --enable-magnatune \
            --enable-mirage \
            --enable-openvp \
            --enable-radiostationfetcher \
            --enable-randombylastfm \
            --enable-streamrecorder \
            --enable-telepathy \
            --disable-zeitgeistdataprovider \
            --disable-tests \
            --disable-shave \
            DMCS=/usr/bin/mcs
	make
}

package() {
	cd ${pkgname}-${pkgver}
        make DESTDIR=$pkgdir/ install
}
