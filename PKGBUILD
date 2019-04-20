_pkgname="xamarin-android"
pkgname=("${_pkgname}-git")
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages such as C#. (git version)"
pkgver=0
pkgrel=0
arch=('x86_64')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')
depends=(
	'mono>=5.18'
	'java-environment=8'
	# these should be reused, but it looks like makefile doesn't care
	#'android-ndk' 'android-sdk'
 	#"android-platform-"{15,24,26} 
	#'android-x86-64-system-image-22'
	#'android-support-repository'
	#base-devel: autoconf (autotools)
	)
makedepends=(
	'git'
	'cmake' 'gdk-pixbuf2' 'wget' 'msbuild'
	'lsb-release' 'openssh'
	# these should be also reused, but the same happens
	#'llvm' 'nuget'
	)
source=(
	"${_pkgname}::git+${url}.git"
	"ext_debugger-libs::git+git://github.com/mono/debugger-libs.git#branch=master"
	"ext_dlfcn-win32::git+https://github.com/dlfcn-win32/dlfcn-win32.git#branch=v1.1.1"
	"ext_Java.Interop::git+https://github.com/xamarin/java.interop.git#branch=master"
	"ext_libzip::git+https://github.com/nih-at/libzip.git#branch=rel-1-5-1"
	"ext_LibZipSharp::git+https://github.com/grendello/LibZipSharp.git#branch=master"
	"ext_llvm::git+https://github.com/mono/llvm.git#branch=release_60"
	"ext_mman-win32::git+https://github.com/witwall/mman-win32.git#branch=master"
	"ext_mono::git+https://github.com/mono/mono.git#branch=2018-10"
	"ext_mxe::git+https://github.com/xamarin/mxe.git#branch=xamarin"
	"ext_nrefactory::git+git://github.com/icsharpcode/NRefactory.git#branch=master"
	"ext_opentk::git+https://github.com/mono/opentk.git#branch=master"
	"ext_proguard::git+https://github.com/xamarin/proguard.git#branch=master"
	"ext_sqlite::git+https://github.com/xamarin/sqlite.git#branch=3.27.1"
	"ext_xamarin-android-api-compatibility::git+https://github.com/xamarin/xamarin-android-api-compatibility.git#branch=master"
	"ext_xamarin-android-tools::git+https://github.com/xamarin/xamarin-android-tools#branch=master"
	)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
	'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	# Submodules are hell
	git submodule init
	git config submodule.external/debugger-libs.url "$srcdir/ext_debugger-libs"
	git config submodule.external/dlfcn-win32.url "$srcdir/ext_dlfcn-win32"
	git config submodule.external/Java.Interop.url "$srcdir/ext_Java.Interop"
	git config submodule.external/libzip.url "$srcdir/ext_libzip"
	git config submodule.external/LibZipSharp.url "$srcdir/ext_LibZipSharp"
	git config submodule.external/llvm.url "$srcdir/ext_llvm"
	git config submodule.external/mman-win32.url "$srcdir/ext_mman-win32"
	git config submodule.external/mono.url "$srcdir/ext_mono"
	git config submodule.external/mxe.url "$srcdir/ext_mxe"
	git config submodule.external/nrefactory.url "$srcdir/ext_nrefactory"
	git config submodule.external/opentk.url "$srcdir/ext_opentk"
	git config submodule.external/proguard.url "$srcdir/ext_proguard"
	git config submodule.external/sqlite.url "$srcdir/ext_sqlite"
	git config submodule.external/xamarin-android-api-compatibility.url "$srcdir/ext_xamarin-android-api-compatibility"
	git config submodule.external/xamarin-android-tools.url "$srcdir/ext_xamarin-android-tools"
	git submodule update

	make prepare MSBUILD=msbuild
}

build() {
	cd "${srcdir}/${_pkgname}"
	make MSBUILD=msbuild all
}

package() {
	cd "${srcdir}/${_pkgname}"
	make prefix="${pkgdir}/opt/xamarin-android" install
}

