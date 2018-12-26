# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Sean Anderson <seanga2@gamil.com>
pkgname=proton-git
_pkgname=proton
pkgver=6.0
pkgrel=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components"
arch=('x86_64')
url="https://github.com/ValveSoftware/Proton/"
license=('BSD')
depends=('python2'
		 'wine')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${pkgname}::git+https://github.com/ValveSoftware/Proton.git")
sha512sums=('SKIP')

pkgver() {
  local version count

  cd "${pkgname}"

  version="$(git describe --abbrev=0 --tags)"
  count="$(git rev-list --count ${version}..)"
  printf '%s.%s' "${version#proton-*-}" "${count}"
}

prepare() {
	cd "${pkgname}"
	sed -i 's/openvr_v0.9.16//g' vrclient_x64/vrclient_x64/*
}

build() {
	cd "${pkgname}"

	export CXXFLAGS="$CXXFLAGS -Wno-attributes"
	export WINEMAKEFLAGS="--nosource-fix --nolower-include --nodlls --nomsvcrt --dll"
	export WINEMAKEFLAGS32="$WINEMAKEFLAGS --wine32"

	# The build script provided has so much cruft that it's easier to make everything manually
	mkdir -p build/lsteamclient.win32
	cp -a lsteamclient/* build/lsteamclient.win32
	cd build/lsteamclient.win32
	winemaker $WINEMAKEFLAGS32 -DSTEAM_API_EXPORTS .
	make
	cd ../..
	
	mkdir -p build/lsteamclient.win64
	cp -a lsteamclient/* build/lsteamclient.win64
	cd build/lsteamclient.win64
	winemaker $WINEMAKEFLAGS -DSTEAM_API_EXPORTS .
	make
	cd ../..

	# Currently depends on the custom bundled wine
	# Will be re-enabled after I can make a package for it
	#mkdir -p build/vrclient.win32
	#cp -a vrclient_x64/* build/vrclient.win32
	#cd build/vrclient.win32/vrclient_x64
	#winemaker $WINEMAKEFLAGS32 .
	#CXXFLAGS="$CXXFLAGS --std=c++0x" make
	#winebuild --dll --fake-module -E vrclient_64.spec -o vrclient.dll.fake
}

package() {
	cd "${pkgname}"
	
	install -d -m755 $pkgdir/usr/share/licenses/$pkgname
	install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -m644 LICENSE.proton $pkgdir/usr/share/licenses/$pkgname/LICENSE.proton
	install -m644 dist.LICENSE $pkgdir/usr/share/licenses/$pkgname/dist.LICENSE

	install -d -m755 $pkgdir/usr/share/doc/$pkgname
	install -m644 README.md $pkgdir/usr/share/doc/$pkgname/README.md

	install -d -m755 $pkgdir/usr/lib32/wine
	install -m755 build/lsteamclient.win32/lsteamclient.dll.so $pkgdir/usr/lib32/wine/
	#install build/vrclient.win32/vrclient.dll.so $pkgdir/usr/lib32/wine/

	#install -d $pkgdir/usr/lib32/wine/fakedlls
	#install build/vrclient.win32/vrclient.dll.fake $pkgdir/lib/wine/fakedlls/vrclient.dll

	install -d -m755 $pkgdir/usr/lib/wine
	install -m755 build/lsteamclient.win64/lsteamclient.dll.so $pkgdir/usr/lib/wine/
}
