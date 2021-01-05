# Contributor: Ben Ward <benjamin.ward@bathspa.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=rstudio-desktop
pkgver=1.3.1093
_clangver=3.6.1
pkgrel=2
pkgdesc="Open source and enterprise-ready professional software for the R community"
arch=(i686 x86_64)
url="http://www.rstudio.com/"
license=(AGPL)
# TODO: what to remove? extra-x86_64-build says
# - it doesn’t need mathjax, clang, qt5-{sensors,svg,xmlpatterns}
# - and qt5-{base,declarative,location}, pango, shared-mime-info are auto-included
depends=(
	'r>=3.0.1' 'boost-libs>=1.63'
	pango shared-mime-info mathjax clang
	'qt5-base>=5.12.5' qt5-declarative qt5-location qt5-sensors qt5-svg qt5-webengine qt5-xmlpatterns
)
optdepends=(pandoc)
# java-environment=8 prevents:
#    [ERROR] Hint: Check that your module inherits 'com.google.gwt.core.Core'
#    either directly or indirectly (most often by inheriting module 'com.google.gwt.user.User')
makedepends=('cmake>=3.4.3' 'boost>=1.69' 'java-environment=8' 'patchelf>=0.9' apache-ant openssl pam r-testthat)
conflicts=(rstudio-desktop-bin rstudio-desktop-git rstudio-desktop-preview-bin)
source=(
	"rstudio-$pkgver.tar.gz::https://github.com/rstudio/rstudio/tarball/v$pkgver"
	'https://s3.amazonaws.com/rstudio-dictionaries/core-dictionaries.zip'
	'https://gist.githubusercontent.com/trap000d/22b11a58c064046478967e60b3394214/raw/8bd457515431ec8c139e8f07fd86b0d2cb420d5d/rstudio-aee4453_libboost175.diff'
)
noextract=('core-dictionaries.zip' "gin-$_ginver.zip")
sha256sums=('6ea169a0d59f0c3eba408d74a2590f7bf9f1e6f911b266a02f6266bf4975cec9'
            '4341a9630efb9dcf7f215c324136407f3b3d6003e1c96f2e5e1f9f14d5787494'
            '77e3e1cfec3c3ffebc9151f62b80db2840db022c84359c7bf17e92c288ab4973')

_pkgname=rstudio

_check_version() {
	local varname=$1
	local real=$2
	local path=$3
	msg2 "Checking if $varname in file “$path” is “$real”"
	
	local test=$(grep -P "$varname=[\\d.]+" "$path" | cut -d= -f2)
	if [[ "$test" != "$real" ]]; then
		msg2 "Check failed: $varname is $test" >&2
		exit 1
	fi
}

build() {
	if [[ $(archlinux-java get) != 'java-8'* ]]; then
		echo 'You need to have Java 8 active when building this package.' >&2
		echo 'Please execute `sudo archlinux-java set java-8-openjdk`' >&2
		exit 1
	fi
	cd "$srcdir/$_pkgname-$_pkgname-"*
	
	(
		cd 'dependencies/common'
		install -d dictionaries libclang/{3.5,builtin-headers}
		
		unzip -qfod 'dictionaries' "$srcdir/core-dictionaries.zip"
		
		ln -sfT '/usr/share/mathjax'                mathjax-27
		ln -sfT '/usr/bin'                          pandoc
		ln -sfT '/usr/lib/libclang.so'              libclang/3.5/libclang.so
		ln -sfT "/usr/lib/clang/$_clangver/include" libclang/builtin-headers/3.5
		
		#TODO: https://github.com/rstudio/rsconnect.git
		#TODO: https://github.com/rstudio/rmarkdown.git
		bash 'install-packages'
	)
	
	# The previous comparison doesn’t seem to work with Boost_VERSION being 1.71.0
	sed -i 's/Boost_VERSION LESS 106900/Boost_VERSION VERSION_LESS 1.69.0/g' src/cpp/CMakeLists.txt
	patch -p1 <'../rstudio-aee4453_libboost175.diff'
	
	# Prevent java error: “Could not lock User prefs. Lock file access denied.”
	# Because gwt desperately needs to add a “firstLaunch” entry there…
	export JAVA_TOOL_OPTIONS="-Djava.util.prefs.userRoot=$srcdir"
	
	# Set information for Cmake and build
	local shortver="${pkgver%.*}"
	export RSTUDIO_VERSION_MAJOR="${pkgver%%.*}"
	export RSTUDIO_VERSION_MINOR="${shortver#*.}"
	export RSTUDIO_VERSION_PATCH="${pkgver##*.}"
	export GIT_COMMIT="${PWD##*-}"
	export BUILD_ID="local"
	export PACKAGE_OS="Arch Linux"
	cmake -DRSTUDIO_TARGET=Desktop \
		-Wno-dev \
		-DRSTUDIO_USE_SYSTEM_BOOST=Yes \
		-DCMAKE_BUILD_TYPE=Release \
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5 \
		-DCMAKE_INSTALL_PREFIX=/usr/lib/rstudio
}

package() {
	cd "$srcdir/$_pkgname-$_pkgname-"*
	
	make DESTDIR="$pkgdir/" install
	
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -d "$pkgdir/usr/bin"
	ln -sfT ../lib/rstudio/bin/rstudio "$pkgdir/usr/bin/rstudio"
}
