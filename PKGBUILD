# Maintainer: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=cubicsdr-git
_pkgname=cubicsdr
pkgver=r969.786f5ba
pkgrel=1
epoch=2
pkgdesc="Cross-Platform Software-Defined Radio Application"
arch=('any')
url="https://github.com/cjcliffe/CubicSDR"
license=('GPL2')
depends=('fftw' 'wxgtk' 'soapysdr' 'liquid-dsp-git')
optdepends=('soapyrtlsdr-git: RTL-SDR dongle support'	'soapyremote-git: remote SDR support')
makedepends=('git' 'automake' 'cmake' 'libicns')
conflicts=('cubicsdr')
install="${pkgname}.install"
source=(cubicsdr-git::"git+https://github.com/cjcliffe/cubicsdr.git")
sha256sums=('SKIP')


build() {
	cd "${srcdir}/cubicsdr-git"
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ../
	make -j2


}




pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}






package()	{

cd "$srcdir/$pkgname/build"


#TODO: make this work
#PREFIX="$pkgdir" make install



	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share"
	install -dm755 "${pkgdir}/usr/share/cubicsdr"


#TODO: detect arch to make this work on x86 automatically
#for now change this manually on 32 bit systems



#DONE


#get architecture using uname
#arch="$(uname -m)"


#if arch is x86_64 set to 64 bits, otherwise set to 32 bits
#if [ "$arch" = "x86_64" ]; then
#	bits="x64"
#else
#	bits="x86"


#fi






cd ${srcdir}/cubicsdr-git/build/x*

	install -Dm755 CubicSDR "${pkgdir}/usr/share/cubicsdr/cubicsdr"

	install -Dm755 vera_sans_mono12.fnt "${pkgdir}/usr/share/cubicsdr/vera_sans_mono12.fnt"
	install -Dm755 vera_sans_mono16.fnt "${pkgdir}/usr/share/cubicsdr/vera_sans_mono16.fnt"
	install -Dm755 vera_sans_mono18.fnt "${pkgdir}/usr/share/cubicsdr/vera_sans_mono18.fnt"
	install -Dm755 vera_sans_mono24.fnt "${pkgdir}/usr/share/cubicsdr/vera_sans_mono24.fnt"
	install -Dm755 vera_sans_mono32.fnt "${pkgdir}/usr/share/cubicsdr/vera_sans_mono32.fnt"
	install -Dm755 vera_sans_mono48.fnt "${pkgdir}/usr/share/cubicsdr/vera_sans_mono48.fnt"
	install -Dm755 vera_sans_mono12_0.png "${pkgdir}/usr/share/cubicsdr/vera_sans_mono12_0.png"
	install -Dm755 vera_sans_mono16_0.png "${pkgdir}/usr/share/cubicsdr/vera_sans_mono16_0.png"
	install -Dm755 vera_sans_mono18_0.png "${pkgdir}/usr/share/cubicsdr/vera_sans_mono18_0.png"
	install -Dm755 vera_sans_mono24_0.png "${pkgdir}/usr/share/cubicsdr/vera_sans_mono24_0.png"
	install -Dm755 vera_sans_mono32_0.png "${pkgdir}/usr/share/cubicsdr/vera_sans_mono32_0.png"
	install -Dm755 vera_sans_mono48_0.png "${pkgdir}/usr/share/cubicsdr/vera_sans_mono48_0.png"


cd $srcdir/cubicsdr-git

    # icons are trapped inside .icns format, free them.
	icns2png -x icon/CubicSDR.icns

#get a list of icon filenames for renaming
#gets names of all .pngs and puts it into iconlist file
ls -1 | grep .png > iconlist

#strip out the cubicsdr part from each line in iconlist
cut -c 10- iconlist > icons

#iterate over the icons text file, copying icon files for each entry
for word in $(cat icons); do cp CubicSDR_$word icon_$word; done

#install the icons
    for size in 16 32 128 256 512; do
	install -Dm644 "icon_${size}x${size}x32.png" \
	  "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
done



#install the desktop file
	cd $srcdir
	cd ..
		install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	}
