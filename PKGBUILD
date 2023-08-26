# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: adro79 <adro79@users.noreply.github.com>

pkgbase=moonray
pkgname=($pkgbase $pkgbase-gui)
_pkgname=openmoonray
pkgver=1.3.0.0
pkgrel=1
pkgdesc='DreamWorks’ production MCRT renderer'
arch=(x86_64)
license=(Apache2)
url="https://$_pkgname.org"
_url="https://github.com/dreamworksanimation"
depends=(optix
         python
         cuda
         qt5-script
         python-pyqt5
         libmicrohttpd
         openimageio
         libcgroup
         openimagedenoise
         jsoncpp
         python-setuptools
         cppunit
         openvdb
         embree3
         log4cplus
         lua
         onetbb-2019
         lua53)
makedepends=(boost
             curl
             cmake
             clang
             cppunit
             libmicrohttpd
             openimageio
             openssl
             git
             qt5-base
             qt5-script)
optdepends=('usd: hydra plugins and USD geometry objects'
            'intel-oneapi-mkl: Intel Math Kernel Library')
source=("$_pkgname::git+$_url/$_pkgname#tag=openmoonray-$pkgver"
        "$_pkgname+arras+arras4_core::git+$_url/arras4_core.git#commit=8e22420076dfb6e75429379196c874bd342611aa"
        "$_pkgname+arras+arras_render::git+$_url/arras_render.git#commit=b706280daf059d39677f57a490362d9699c1100d"
        "$_pkgname+arras+distributed+arras4_node::git+$_url/arras4_node.git#commit=bf57bb1f34b338eaf4bcacc49b714b1a5321ba0b"
        "$_pkgname+arras+distributed+minicoord::git+$_url/minicoord.git#commit=2fe91917f731073cdfc91a8bb4935b87fafcf246"
        "$_pkgname+cmake_modules::git+$_url/cmake_modules.git#commit=f50b73d1a4365479444c17cba530a897b54aeeb8"
        "$_pkgname+moonray+hydra+hdMoonray::git+$_url/hdMoonray.git#commit=6de7142ecfbb54dede2606176307a3d26d6cd310"
        "$_pkgname+moonray+hydra+moonray_sdr_plugins::git+$_url/moonray_sdr_plugins.git#commit=eabdcd2bddc529085e410192889f6b9080fad4f1"
        "$_pkgname+moonray+mcrt_denoise::git+$_url/mcrt_denoise.git#commit=a27c59f398fdae1856e4de9718efdd1d8a958332"
        "$_pkgname+moonray+moonray::git+$_url/moonray.git#commit=a84653d0622baa575542be642d80d968f97f2c6c"
        "$_pkgname+moonray+moonray_arras+mcrt_computation::git+$_url/mcrt_computation.git#commit=b3190ce32008445b08b1e09a691a1b7540147ef5"
        "$_pkgname+moonray+moonray_arras+mcrt_dataio::git+$_url/mcrt_dataio.git#commit=29411cc02786e2626c9afa34cac201aa5fda28ea"
        "$_pkgname+moonray+moonray_arras+mcrt_messages::git+$_url/mcrt_messages.git#commit=41ec28cc7f0de6675fc57ab20ed65fec5457bfe5"
        "$_pkgname+moonray+moonray_dcc_plugins::git+$_url/moonray_dcc_plugins.git#commit=e90ad4cdc4086c9e952e211d1570e0416af467c6"
        "$_pkgname+moonray+moonray_gui::git+$_url/moonray_gui.git#commit=1f00f0bcdae8ca9b40d8923fdc3c17c1b787836e"
        "$_pkgname+moonray+moonshine::git+$_url/moonshine.git#commit=963c933892f8d1dbb6a794834c72de06df88dd7e"
        "$_pkgname+moonray+moonshine_usd::git+$_url/moonshine_usd.git#commit=1d850a4cdd40220e7ccd62157f360f2c36977b75"
        "$_pkgname+moonray+render_profile_viewer::git+$_url/render_profile_viewer.git#commit=4c35f67ed99fbfb13f523de39278cb2e45d4bb61"
        "$_pkgname+moonray+scene_rdl2::git+$_url/scene_rdl2.git#commit=69412c549b8d3c7d992a8471d7973b774e5cda89"
        jsoncpp.patch
        moonray.patch
        optix.patch
        tbb.patch
        $pkgbase.sh
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'cd42e2ee9d1ec8df8d0742c014a6ccc2416d749387cec07a85149bfbad9d8317'
            '0d8aae92050d499679a376148d2220ff08d8f38ff631096922498c1ad2f75526'
            '31826f021bf78da6560aebe2b1427de9eb11fafbb983ec0def94dce1718dd8c6'
            '1b3a201caf3db095574d4bc3800fc6ee111c5050587a1ff58bfdff57352d2c85'
            '3eec69b719270c027a90c0219bf552642431da2922e1e843a727710d2edf0a9b')
install=moonray.install

# git submodule status | cut -c2- | awk '{s=$2; gsub("/", "+", s); gsub(".*/", "", $2); print "\"$_pkgname+" s "::git+$_url/" $2 ".git#commit=" $1 "\"" }'

prepare() {
	cd "$_pkgname"
	git submodule init
	for s in ${source[@]%%::*}; do
		case "$s" in
			$_pkgname+*)
				local module=${s#$_pkgname+}
				local path=${module//+//}
				git config submodule.$path.url "$srcdir/$s"
				;;
		esac
	done
	git -c protocol.file.allow=always submodule update

	patch -Np1 -i "$srcdir/jsoncpp.patch"
	patch -Np1 -i "$srcdir/moonray.patch"
	patch -Np1 -i "$srcdir/optix.patch"
# 	patch -Np1 -i "$srcdir/tbb.patch" TESTING
}

build() {
	cd "${srcdir}"
	export CC=clang && export CXX=clang++ # Doesn't support GCC 13

	export CMAKE_PREFIX_PATH=/usr/lib/cmake/OpenImageIO:/opt/optix
	_CMAKE_FLAGS+=(
		-DCMAKE_INSTALL_PREFIX:PATH=/opt/"$pkgbase"
		-DCMAKE_CXX_STANDARD=17
		-DCMAKE_EXE_LINKER_FLAGS:STRING='-Wl,-O1,--sort-common,-z,relro,-z,now' # Fix Boost linking error on arras4_test
		-DCMAKE_CXX_FLAGS:STRING=''
		-DCMAKE_C_FLAGS:STRING=''
		-DCMAKE_MODULE_LINKER_FLAGS:STRING=''
		-DCMAKE_SHARED_LINKER_FLAGS:STRING=''
		-DTBB_ROOT=/opt/tbb2019
		-DBUILD_QT_APPS=YES # Build moonray_gui
	)

	cmake -S $_pkgname -B build "${_CMAKE_FLAGS[@]}"
	make -C build ${MAKEFLAGS:--j12}
	DESTDIR="$srcdir"/moonray make install -C build
}

package_moonray() {
	moondir="$pkgdir"/opt/moonray
	cp -r "$srcdir"/moonray/opt "$pkgdir"

	rm $moondir/bin/{arras_render,moonray_gui}
	rm -r $moondir/lib/cmake/{ArrasRender-5.3.7.0,MoonrayGui-14.6.0.0}
	rm $moondir/sessions/mcrt_progressive*

	install -Dm755 "${srcdir}"/$pkgbase.sh "${pkgdir}"/etc/profile.d/$pkgbase.sh # Add env vars
}

package_moonray-gui() {
	depends+=($pkgbase
	          qt6-base)
	moondir="$srcdir"/moonray/opt/moonray

	mkdir -p "$pkgdir"/opt/moonray/{bin,lib/cmake,sessions}


	cp $moondir/bin/{arras_render,moonray_gui} "$pkgdir"/opt/moonray/bin
	cp -r $moondir/lib/cmake/{ArrasRender-5.3.7.0,MoonrayGui-14.6.0.0} "$pkgdir"/opt/moonray/lib/cmake
	cp $moondir/sessions/mcrt_progressive* "$pkgdir"/opt/moonray/sessions
}
