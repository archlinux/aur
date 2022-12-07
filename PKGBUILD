# Maintainer: éclairevoyant
# Contributor: Anthony Wang <ta180m at pm dot me>
# Contributor: Chris Lane <aur at chrislane dot com>

_pkgname=digikam
pkgname="$_pkgname-git"
pkgver=8.0.0.r3363.9223eb7bec
pkgrel=1
pkgdesc='An advanced digital photo management application'
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.digikam.org/'
depends=('akonadi-contacts' 'exiv2' 'glu' 'imagemagick' 'jasper' 'kcalendarcore'
         'kfilemetadata' 'kio' 'knotifyconfig' 'lensfun' 'libass' 'libgphoto2'
         'libksane' 'marble-common' 'opencv' 'perl-image-exiftool'
         'qt5-networkauth' 'qt5-webengine' 'qt5-xmlpatterns' 'threadweaver')
makedepends=('boost' 'doxygen' 'eigen' 'extra-cmake-modules' 'git' 'kdoctools')
optdepends=('darktable: RAW import'
            'hugin: panorama tool'
            'perl: for digitaglinktree'
            'qt5-imageformats: TIFF, WEBP support'
            'rawtherapee: RAW import')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://invent.kde.org/graphics/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "%s.%s" $(git blame -s -L/DIGIKAM_MAJOR_VERSION/,+3 CMakeLists.txt | awk 'BEGIN { ORS = "."; }
	{
		gsub("[\")]", "");
		"git rev-list --count "$1"..HEAD" | getline x;
		if (NR==1 || min>x) {
			min = x;
			min_hash = $1;
		}
		print $4;
	}
	END {
		ORS="";
		print "r"min;
	}') $(git rev-parse --short HEAD)
}

build() {
	cmake -B build -S $_pkgname \
		-DBUILD_TESTING=OFF \
		-DENABLE_KFILEMETADATASUPPORT=ON \
		-DENABLE_MEDIAPLAYER=ON \
		-DENABLE_AKONADICONTACTSUPPORT=ON \
		-DENABLE_MYSQLSUPPORT=ON \
		-DENABLE_APPSTYLES=ON \
		-DENABLE_QWEBENGINE=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
