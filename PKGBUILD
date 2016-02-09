# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=openmusic
pkgver=6.10.1
pkgrel=2
pkgdesc="A visual programming language designed for music composition. (32 bit)"
arch=('i686' 'x86_64')
url="http://repmus.ircam.fr/openmusic/linux"
license=('GPL')
case "$CARCH" in
i686)
    depends=('desktop-file-utils' 'gdk-pixbuf2' 'jack' 'portmidi' 'libsndfile'
             'libsdif')
    optdepends=('libsamplerate: speed up audio-waveform drawing')
    ;;
x86_64)
    depends=('desktop-file-utils' 'lib32-gdk-pixbuf2>=2.31.3-2' 'lib32-jack'
             'lib32-portmidi' 'lib32-libsndfile' 'lib32-libsdif')
    optdepends=('lib32-libsamplerate: speed up audio-waveform drawing')
    ;;
esac
# Note that the openmusic executable may not be compressed/stripped.
# (http://www.lispworks.com/kb/a15fc2ea99b4f8f5802571fe0057705a.html)
options=(!strip)
install="$pkgname.install"
# ircam.fr uses a self-signed SSL certificate which may lead to download problems.
# The following environment variable, and source file .curlrc add option --insecure
# to curl for the duration of this build process. By default, curl is configured as
# download agent in makepkg.conf. If the download still does not work, check section
# DLAGENTS in /etc/makepkgconf and add an option to allow insecure downloads to the
# respective agent configuration.
export CURL_HOME="$startdir"
source=('.curlrc'
        "http://forge.ircam.fr/p/OM/downloads/get/OM_${pkgver}-${pkgrel}.tar.bz2")
sha256sums=('21473828e9f743d216caf06dc13ec1dfc78d500e7e58d13414c682653388ea7e'
            '94ac8332a609f2ad6ae94ac3f274f66d773b130afc43ca99de54c7ff4cb2e200')

package() {
	cd "$srcdir/OM_${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}

