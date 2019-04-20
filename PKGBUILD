_pkgname="xamarin-android"
pkgname=("${_pkgname}-git")
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages such as C#. (git version)"
pkgver=0
pkgrel=0
arch=('x86_64' 'i686')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')
depends=(
	'mono>=5.18'
	'java-environment=8'
	'android-ndk' 'android-sdk'
	#base-devel: autoconf (autotools)
	)
makedepends=('git'
	'cmake' 'gdk-pixbuf2' 'wget' 'msbuild'
	'lsb-release'
	'llvm' 'ssh'
	)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	make prepare-external-git-dependencies
	make prepare MSBUILD=msbuild
}

build() {
	cd "${srcdir}/${_pkgname}"
	make MSBUILD=msbuild
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

