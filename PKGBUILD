# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=traverso
pkgver=0.49.4
pkgrel=1
pkgdesc="Digital Audio Workstation with an innovative User Interface"
arch=('i686' 'x86_64')
url="http://traverso-daw.org/"
license=('GPL')
depends=('qt4' 'jack' 'fftw' 'wavpack' 'lame' 'libmad' 'shared-mime-info' 'lilv')
makedepends=('cmake')
install="traverso.install"
# files traverso.1 01-fix_build.patch 02-fix_spelling.patch taken from:
# http://ftp.debian.org/debian/pool/main/t/traverso/traverso_0.49.4-1.debian.tar.xz
source=("http://ftp.debian.org/debian/pool/main/t/traverso/traverso_$pkgver.orig.tar.gz"
		traverso.1 01-fix_build.patch 02-fix_spelling.patch )

md5sums=('35711db624ccb09044ea1a8dad2695ed'
         'da7454cb60b276aa1637ad79250e9ffb'
         'cb4c62ff0f38600c235216f87bace9f0'
         'd9839ac123cddb63692fc1258297877f')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i ../01-fix_build.patch
	patch -p1 -i ../02-fix_spelling.patch
}

build() {
	cd "$pkgname-$pkgver"
	[[ -d bld ]] || mkdir bld && cd bld
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_SHARED_LINKER_FLAGS+=" -Wl,--no-undefined -Wl,--as-needed" \
        -DCMAKE_MODULE_LINKER_FLAGS+=" -Wl,--no-undefined -Wl,--as-needed" \
        -DUSE_SYSTEM_SLV2_LIBRARY=ON \
        -DWANT_MP3_ENCODE=ON
	make
}

package(){
  cd "$pkgname-$pkgver"
  cd bld; make DESTDIR="$pkgdir/" install
  cd ../resources
  # desktop file
  sed '/Path/d' -i traverso.desktop 
  install -Dm644  traverso.desktop "$pkgdir"/usr/share/applications/traverso.desktop

  # icons
  install -dm755 "$pkgdir"/usr/share/icons/hicolor
  cp -a freedesktop/icons/* "$pkgdir"/usr/share/icons/hicolor

  # mime & docs & man
  install -Dm644 x-traverso.xml "$pkgdir"/usr/share/mime/packages/x-traverso.xml
  install -Dm644 help.text "$pkgdir"/usr/share/doc/traverso/help.txt
  install -Dm644 "${srcdir}"/traverso.1 "$pkgdir"/usr/share/man/man1/traverso.1
}
