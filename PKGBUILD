# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
pkgname=banshee-community-extensions
pkgver=2.4.0
pkgrel=2
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
             'fftw>=3' 'libsamplerate'
             # LIRC
             'lirc'
             # Telepathy
             'empathy>=2.27.91' 'telepathy-gabble>=0.9' 'telepathy-mission-control>=5.3.1')
checkdepends=() # nunit is included in mono
optdepends=(#'banshee-youtube: for banshee with youtube extension enabled'
            'libappindicator-sharp: For the AppIndicator extension'
            'notify-sharp: For the AppIndicator extension'
            'fftw>=3: For the LastFM Fingerprint and Mirage extensions'
            'libsamplerate: For the LastFM Fingerprint and Mirage extensions'
            'gstreamer0.10-base>=0.10.15: For the LastFM Fingerprint and Mirage extensions'
            'gstreamer0.10-base-plugins>=0.10.15: For the LastFM Fingerprint and Mirage extensions'
            'lcdproc: For the LCDproc extension'
            'lirc: For the LIRC extension'
            'empathy>=2.27.91: For the Telepathy extension'
            'telepathy-gabble>=0.9: For the Telepathy extension'
            'telepathy-mission-control>=5.3.1: For the Telepathy extension')
source=(http://download.banshee.fm/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('6f20404de80090bb5d88a57c043e876a192f480ac3488ce7697344f1447d48b3')

build() {
	cd ${pkgname}-${pkgver}
        # Flag rationale:
        # - Packages for ClutterFlow are not available
        # - OpenVP fails checks
        # - Packages for Zeitgeist are not available
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
            --enable-jamendo \
            --enable-karaoke \
            --enable-lastfmfingerprint \
            --enable-lcd \
            --enable-lirc \
            --enable-lyrics \
            --enable-liveradio \
            --enable-magnatune \
            --enable-mirage \
            --disable-openvp \
            --enable-radiostationfetcher \
            --enable-randombylastfm \
            --enable-streamrecorder \
            --enable-telepathy \
            --disable-zeitgeistdataprovider \
            --enable-tests \
            --disable-shave \
            DMCS=/usr/bin/mcs
	make
}

package() {
	cd ${pkgname}-${pkgver}
        make DESTDIR=$pkgdir/ install
}

check() {
    cd ${pkgname}-${pkgver}
    make check
}
