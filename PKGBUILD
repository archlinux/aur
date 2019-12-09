# Contributor: Ben Ward <benjamin.ward@bathspa.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=rstudio-desktop
pkgver=1.2.5019
_gwtver=2.8.1
_ginver=2.1.2
_clangver=3.6.1
pkgrel=1
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
makedepends=('cmake>=3.4.3' 'boost>=1.69' 'java-environment=8' 'patchelf>=0.9' apache-ant openssl pam)
conflicts=(rstudio-desktop-bin rstudio-desktop-git rstudio-desktop-preview-bin)
source=(
	"rstudio-$pkgver.tar.gz::https://github.com/rstudio/rstudio/tarball/v$pkgver"
	"https://s3.amazonaws.com/rstudio-buildtools/gin-$_ginver.zip"
	"https://s3.amazonaws.com/rstudio-buildtools/gwt-$_gwtver.zip"
	'https://s3.amazonaws.com/rstudio-dictionaries/core-dictionaries.zip'
	'boost-1.70.patch::https://github.com/rstudio/rstudio/commit/217ce0962734ae85621fd82f0eed86129c991a79.patch'
)
noextract=('core-dictionaries.zip' "gin-$_ginver.zip")
sha256sums=(
	'104becf4394484adf53d92611c68db884a6adef52e643fc371183f8106b67970'
	'b98e704164f54be596779696a3fcd11be5785c9907a99ec535ff6e9525ad5f9a'
	'0b7af89fdadb4ec51cdb400ace94637d6fe9ffa401b168e2c3d372392a00a0a7'
	'4341a9630efb9dcf7f215c324136407f3b3d6003e1c96f2e5e1f9f14d5787494'
	'd252111e28a7de8602b4df1f66b36dded260061f094b504895e5c789f8681091'
)

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

prepare() {
	cd "$srcdir/$_pkgname-$_pkgname-"*
	_check_version GIN_VER     $_ginver 'dependencies/common/install-gwt' || exit 1
	_check_version GWT_SDK_VER $_gwtver 'dependencies/common/install-gwt' || exit 1
	unzip -o "$srcdir/gin-$_ginver.zip" -d "../gin-$_ginver"
}

build() {
	cd "$srcdir/$_pkgname-$_pkgname-"*
	
	install -d src/gwt/lib/{gin/$_ginver,gwt/$_gwtver}
	
	cp -r "$srcdir/gin-$_ginver/"* "src/gwt/lib/gin/$_ginver"
	cp -r "$srcdir/gwt-$_gwtver/"* "src/gwt/lib/gwt/$_gwtver"
	
	(
		cd 'dependencies/common'
		install -d dictionaries libclang/{3.5,builtin-headers}
		
		unzip -qfod 'dictionaries' "$srcdir/core-dictionaries.zip"
		
		ln -sfT '/usr/share/mathjax'                mathjax-26
		ln -sfT '/usr/bin'                          pandoc
		ln -sfT '/usr/lib/libclang.so'              libclang/3.5/libclang.so
		ln -sfT "/usr/lib/clang/$_clangver/include" libclang/builtin-headers/3.5
		
		#TODO: https://github.com/rstudio/rsconnect.git
		#TODO: https://github.com/rstudio/rmarkdown.git
		bash 'install-packages'
	)
	
	# The previous comparison doesn’t seem to work with Boost_VERSION being 1.71.0
	sed -i 's/Boost_VERSION LESS 106900/Boost_VERSION VERSION_LESS 1.69.0/g' src/cpp/CMakeLists.txt
	# The second boost 1.71 problem: tcp::resolver::get_io_service got removed
	patch -p1 <'../boost-1.70.patch'
	
	# Prevent java error: “Could not lock User prefs. Lock file access denied.”
	# Because gwt desperately needs to add a “firstLaunch” entry there…
	export JAVA_TOOL_OPTIONS="-Djava.util.prefs.userRoot=$srcdir"
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
