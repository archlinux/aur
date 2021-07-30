# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Jiachen YANG <farseerfc@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: beatgammit

_install_libs=false

pkgname=servo-git
pkgver=43157.858bb432988
pkgrel=2
pkgdesc='Parallel Browser Project: web browser written in Rust'
arch=(x86_64 i686)
url=https://github.com/servo/servo
license=(MPL)
depends=(bzip2
         fontconfig
         freetype2
         glu
         gst-plugins-bad
         libgl
         libxcursor
         libxi
         libxmu
         libxrandr
         mesa
         python-dbus
         ttf-font
         xcb-util)
install="$pkgname.install"
makedepends=(autoconf2.13
             clang
             cmake
             curl
             depot-tools-git
             git
             gperf
             llvm
             python2
             python2-distlib
             python2-virtualenv
             rustup)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$pkgname"
	# fixes build error
	# possibly _FORTIFY_SOURCE? https://bugs.archlinux.org/task/34759
	#unset CPPFLAGS
	./mach build --release
}

package() {
	servopath=$pkgname/target/release
	install -Dm755 "$servopath/servo" "$pkgdir/opt/servo/servo"
	if [ "$_install_libs" = true ] ; then
		mkdir -p "$pkgdir/usr/lib"
		find "$servopath/deps" -name "*-*.so" -exec basename {} \; | sort | uniq | while read _f; do
			_file=$(find "$servopath/deps" -name "$_f" -print | head -n 1)
			if [ -z "$_file" ]; then
				echo "Skipping: $_f"
				continue
			fi
			install -Dm644 "$_file" "$pkgdir/usr/lib"
		done
	fi
	mkdir -p "$pkgdir/opt/servo/resources"
	cp -r $pkgname/resources/* "$pkgdir/opt/servo/resources"
	mkdir -p "$pkgdir/etc/profile.d"
	echo 'export PATH=$PATH:/opt/servo' > "$pkgdir/etc/profile.d/${pkgname%-git}.sh"
	echo 'setenv PATH ${PATH}:/opt/servo' > "$pkgdir/etc/profile.d/${pkgname%-git}.csh"
	chmod 755 "$pkgdir/etc/profile.d/${pkgname%-git}".{csh,sh}
}
