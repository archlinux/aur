# Maintainer: Pierre Choffet <peuc@wanadoo.fr>

# Note: unlike the ring-daemon-git and libringclient-git, this package doesn't
# use pinned commit, so you may encounter some compatibility issues with lower
# level librairies if their packages are not updated. In this case, just append
# #commit=<commit_id> in source url.

pkgname=ring-kde-git
pkgver=2.0.0.r138.g18ff797
pkgrel=2
pkgdesc="KDE client for Ring"
arch=("i686" "x86_64")
url="http://ring.cx/"
license=("GPL3")
groups=("ring")
depends=("libringclient-git" "ring-daemon-git" "qt5-base" "qt5-svg"
         "attica-qt5" "kconfig" "kguiaddons" "kdbusaddons" "ki18n"
         "kwindowsystem" "kxmlgui" "kiconthemes" "kinit" "kio" "kcompletion"
         "kcrash" "kdelibs" "knotifications")
makedepends=("git" "cmake" "extra-cmake-modules")
provides=("ring-kde")
changelog="ChangeLog"
source=("git://anongit.kde.org/ring-kde"
        "0001-textmessages-Vastly-revamp-and-fix-the-text-messages.patch"
        "0002-contact-Enable-Akonadi-support-again.patch"
        "0003-history-De-duplicate-identical-calls.patch"
        "0004-akonadi-Make-it-optional.patch"
        "0005-Fix-CMakeLists.txt.patch"
        "0006-contact-Add-new-basic-contact-selection-dialog.patch")
sha256sums=('SKIP'
            'fe1a4a7ba6df920117adf5d57a8fcfaa784986369a50c91bd3ae5b0f69ea2c59'
            '2fce01531bcdf001b1f8cc34522c5951dcbb853ea597ffa4421cdd78661148d2'
            '1c1ff7d6244982cbf56720eeda731b5fb09933178e02d0b3d24614a906d91e29'
            'b50755d6653b417046734a29d25cdb4ff2cadcc900e119b309e4fbb0d8614894'
            'd1215e1ba920f7b359a4319caa6ea286784b32079fc647c2fe7b66a9dde4e44c'
            'c22e0d8518575d00dc6b660e5c8979659678e403947526465ceaf17cdca7c517')

pkgver() {
	cd "ring-kde"

	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "ring-kde"

	git am < '../0001-textmessages-Vastly-revamp-and-fix-the-text-messages.patch'
	git am < '../0002-contact-Enable-Akonadi-support-again.patch'
	git am < '../0003-history-De-duplicate-identical-calls.patch'
	git am < '../0004-akonadi-Make-it-optional.patch'
	git am < '../0005-Fix-CMakeLists.txt.patch'
	git am < '../0006-contact-Add-new-basic-contact-selection-dialog.patch'
}

build() {
	cd "ring-kde"

	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

	make
}

package() {
	cd "ring-kde/build"

	make DESTDIR="$pkgdir" install
}
