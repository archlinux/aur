# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=loopauditioneer-svn
pkgver=r47
pkgrel=1
pkgdesc="Software for loop and cue handling in .wav files"
arch=('i686' 'x86_64')
url="http://loopauditioneer.sourceforge.net/"
license=('GPL3')
depends=('wxgtk' 'alsa-lib' 'gcc-libs-multilib')
makedepends=('svn')
provides=('loopauditioneer')
conflicts=('loopauditioneer')
source=("${pkgname%-*}"::'svn://svn.code.sf.net/p/loopauditioneer/code/trunk'
        "${pkgname%-*}.sh"
        "${pkgname%-*}.desktop")
md5sums=(SKIP
         '1ea7cc51c813bfe8e37a7ebb15184948'
         '0e2286c155701065663461be6c1056ba')

pkgver(){
	cd "$srcdir/${pkgname%-*}"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build(){
	cd "$srcdir/${pkgname%-*}/lib-src/libsndfile"
	sed -i "s/am__api_version='1.15'/am__api_version='1.16'/" configure
	chmod +x configure
	./configure --disable-external-libs
	make
	cd ..
	ln -sf libsndfile/src/.libs/libsndfile.a .
	cd rtaudio
	./configure --with-alsa
	make
	cd ..
	ln -sf rtaudio/.libs/librtaudio.a .
	cd ../src
	g++ -D__LINUX_ALSA__ -o LoopAuditioneer LoopAuditioneer.cpp MyFrame.cpp \
	MyPanel.cpp CueMarkers.cpp LoopMarkers.cpp FileHandling.cpp MySound.cpp \
	WaveformDrawer.cpp LoopParametersDialog.cpp BatchProcessDialog.cpp \
	AutoLoopDialog.cpp AutoLooping.cpp PitchDialog.cpp CrossfadeDialog.cpp \
	LoopOverlay.cpp FFT.cpp StopHarmonicDialog.cpp CutNFadeDialog.cpp \
	MyListCtrl.cpp -I../lib-src/libsndfile/src -I../lib-src/rtaudio \
	../lib-src/libsndfile.a ../lib-src/librtaudio.a -lasound -lpthread \
	-lm `wx-config --cxxflags --unicode=yes --libs`
	strip --strip-all LoopAuditioneer

}

package() {
	cd "$srcdir"
	install -Dm755 "${pkgname%-*}.sh" "$pkgdir/usr/bin/${pkgname%-*}"
	install -Dm644 "${pkgname%-*}.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"
    cd "$srcdir/${pkgname%-*}"
    install -Dm755 src/LoopAuditioneer "$pkgdir/opt/${pkgname%-*}/bin/LoopAuditioneer"
    install -dm755 src/icons "$pkgdir/opt/${pkgname%-*}/bin/icons"
    install -Dm755 src/icons/* "$pkgdir/opt/${pkgname%-*}/bin/icons/"
    install -dm755 src/help "$pkgdir/opt/${pkgname%-*}/bin/help"
    for i in $(ls src/help | grep -v images)
    do
        install -Dm755 src/help/$i "$pkgdir/opt/${pkgname%-*}/bin/help/$i"
    done
    install -dm755 src/help/images "$pkgdir/opt/${pkgname%-*}/bin/help/images"
    install -Dm755 src/help/images/* "$pkgdir/opt/${pkgname%-*}/bin/help/images/"
    install -dm755 icons "$pkgdir/opt/${pkgname%-*}/icons"
    install -Dm755 icons/index.url "$pkgdir/opt/${pkgname%-*}/icons/index.url"
    install -Dm755 icons/readme.txt "$pkgdir/opt/${pkgname%-*}/icons/index.readme"
    install -dm755 icons/24x24 "$pkgdir/opt/${pkgname%-*}/icons/24x24"
    install -Dm755 icons/24x24/* "$pkgdir/opt/${pkgname%-*}/icons/24x24/"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    cd "$pkgdir/usr/share/pixmaps"
    ln -s "../../../opt/${pkgname%-*}/bin/icons/LoopyIcon-48.png" "${pkgname%-*}.png"
    cd "$srcdir/${pkgname%-*}"
    install -Dm644 README.txt "$pkgdir/usr/share/doc/${pkgname%-*}/README"
}

