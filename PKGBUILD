# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: Eugene Yudin aka Infy <Eugene dot Yudin at gmail dot com>
# Contributor: aksr <aksr at t-com dot me>
# Maintainer: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng-git
pkgver=23.06.02.r4829.fc7a67d7
pkgrel=1
pkgdesc="The next generation GoldenDict (Supports Qt WebEngine & Qt6)."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/xiaoyifang/goldendict-ng"
license=('GPL3')
depends=('ffmpeg' 'hunspell' 'libvorbis' 'libxtst' 'lzo' 'libzim' 'zlib' 'xz' 'libeb' 'opencc' 'xapian-core'
	 'qt6-svg' 'qt6-tools' 'qt6-multimedia' 'qt6-webengine' 'qt6-speech' 'qt6-5compat')
makedepends=('git')
conflicts=('goldendict' 'goldendict-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt' 'goldendict-webengine-git')
source=("$pkgname::git+https://github.com/xiaoyifang/goldendict.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" "$(git describe | cut -c 2-9)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"

	# remove the default flag U_GLIBCXX_ASSERTIONS
	echo "QMAKE_CXXFLAGS += -U_GLIBCXX_ASSERTIONS" >> goldendict.pro

}

build(){
	cd "$srcdir/$pkgname"
	qmake6 "CONFIG+=release" "CONFIG+=use_xapian" "CONFIG+=zim_support" "CONFIG+=chinese_conversion_support" PREFIX="/usr" goldendict.pro
	make
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
}
