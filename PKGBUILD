# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: adro79 <adro79@users.noreply.github.com>

pkgbase=moonray
pkgname=($pkgbase $pkgbase-gui)
_pkgname=openmoonray
pkgver=1.4.0.0
pkgrel=1
pkgdesc='DreamWorks’ production MCRT renderer'
arch=(x86_64)
license=(Apache)
url="https://$_pkgname.org"
_url="https://github.com/dreamworksanimation"
depends=('optix>=7.6.0' # can be built with earlier versions, but patches target this
         bash
         gcc-libs
         libglvnd
         libsm
         curl
         imath
         python
         cuda
         glibc
         materialx
         python-pyqt5
         libmicrohttpd
         openimageio
         libcgroup
         opencolorio
         openimagedenoise
         boost-libs
         opensubdiv
         jemalloc
         jsoncpp
         libice
         libxext
         libx11
         libjpeg-turbo
         python-setuptools
         cppunit
         openvdb
         openexr
         random123
         embree
         python-requests
         log4cplus
         openssl
         lua
         'usd>=23.11-7' # pkgrel 7 has MONOLITHIC=OFF which is required
         usd-extras
         util-linux-libs
         onetbb)
makedepends=(boost
             curl
             cmake
             clang
             cppunit
             ispc
             libmicrohttpd
             openimageio
             openssl
             git
             qt5-base
             qt5-script)
optdepends=('intel-oneapi-mkl: Intel Math Kernel Library')
source=("$_pkgname::git+$_url/$_pkgname#tag=openmoonray-$pkgver"
        "$_pkgname+arras+arras4_core::git+$_url/arras4_core.git#commit=90cbe6b30c114c63072d6b8cfd80f38131361885"
        "$_pkgname+arras+arras_render::git+$_url/arras_render.git#commit=e313b812ccb47c6576eb2a0235e974de1a260d26"
        "$_pkgname+arras+distributed+arras4_node::git+$_url/arras4_node.git#commit=b8d8ae006471a99942e4c0b1fc676f52bb125dbb"
        "$_pkgname+arras+distributed+minicoord::git+$_url/minicoord.git#commit=5645d99de6f70efba6d1306a12a4e40ae03c19fd"
        "$_pkgname+cmake_modules::git+$_url/cmake_modules.git#commit=f50b73d1a4365479444c17cba530a897b54aeeb8"
        "$_pkgname+moonray+hydra+hdMoonray::git+$_url/hdMoonray.git#commit=0cbd7f7ab8db76a352e45696a727cdf9973f9740"
        "$_pkgname+moonray+hydra+moonray_sdr_plugins::git+$_url/moonray_sdr_plugins.git#commit=eabdcd2bddc529085e410192889f6b9080fad4f1"
        "$_pkgname+moonray+mcrt_denoise::git+$_url/mcrt_denoise.git#commit=70a73f677d644c583413c16aacd9b67e2474de21"
        "$_pkgname+moonray+moonray::git+$_url/moonray.git#commit=4663ce1b5b493460fe67128ba5ca4859eeaffa39"
        "$_pkgname+moonray+moonray_arras+mcrt_computation::git+$_url/mcrt_computation.git#commit=eda4831b4ff28c6d83c220e8d90d0fd5aa473b99"
        "$_pkgname+moonray+moonray_arras+mcrt_dataio::git+$_url/mcrt_dataio.git#commit=59841215ffa9aaf9ee8a80d7bdb969ad42de8456"
        "$_pkgname+moonray+moonray_arras+mcrt_messages::git+$_url/mcrt_messages.git#commit=11a4b29b8ecad85ef5869b4e1b928c284cb21578"
        "$_pkgname+moonray+moonray_dcc_plugins::git+$_url/moonray_dcc_plugins.git#commit=e90ad4cdc4086c9e952e211d1570e0416af467c6"
        "$_pkgname+moonray+moonray_gui::git+$_url/moonray_gui.git#commit=399de3db99be0258eae6dda4bd077d51d571dbba"
        "$_pkgname+moonray+moonshine::git+$_url/moonshine.git#commit=69fad0143ffff03c73a347f1a7e41a580a2dff7f"
        "$_pkgname+moonray+moonshine_usd::git+$_url/moonshine_usd.git#commit=5c4fff2d7f840fce1677d746b5b02b9dcc64599c"
        "$_pkgname+moonray+render_profile_viewer::git+$_url/render_profile_viewer.git#commit=cd6959e7cd6a4d37bdafdfc3489d39156023edee"
        "$_pkgname+moonray+scene_rdl2::git+$_url/scene_rdl2.git#commit=217f7779bc6dd07b5fba0100c9b2c9ab801c1e22"
        moonray.patch
        optix.patch
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
            'fa7e6b6b58ac274ebffb42c3c40fd6279effaf9625775deff4b843ff98c2f329'
            '4f125a12cb5031ba7c5d3488bd9b6cb6a7075a5d0ba0e6aed62b746eb0bf734f'
            '602354f937f73c3d61d5bfd38316bcaf8e502d2c0e2c18c04d303eac1cec7008')
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

	patch -Np1 -i "$srcdir/moonray.patch"
	patch -Np1 -i "$srcdir/optix.patch"
}

build() {
	export CMAKE_PREFIX_PATH=/usr/lib/cmake/OpenImageIO:/opt/optix
	_CMAKE_FLAGS+=(
		-DCMAKE_INSTALL_PREFIX:PATH=/opt/"$pkgbase"
		-DCMAKE_CXX_STANDARD=17
		-DCMAKE_EXE_LINKER_FLAGS:STRING='-Wl,-O1,--sort-common,-z,relro,-z,now'
		-DCMAKE_CXX_FLAGS:STRING=''
		-DCMAKE_C_FLAGS:STRING=''
		-DCMAKE_MODULE_LINKER_FLAGS:STRING=''
		-DCMAKE_SHARED_LINKER_FLAGS:STRING=''
		-DABI_VERSION=0
		-DBUILD_QT_APPS=YES # Build moonray_gui
	)

	cmake -S $_pkgname -B build "${_CMAKE_FLAGS[@]}"
	make -C build ${MAKEFLAGS:--j12}
	DESTDIR="$srcdir"/moonray make install -C build
}

package_moonray() {
	moondir="$pkgdir"/opt/moonray
	cp -r "$srcdir"/moonray/opt "$pkgdir"

	# Remove Houdini files since it needs different build config
	rm -r $moondir/{houdini,plugin/houdini}

	rm $moondir/bin/{arras_render,moonray_gui}
	rm -r $moondir/lib/cmake/{ArrasRender-6.0.0.0,MoonrayGui-15.0.0.0}
	rm $moondir/sessions/mcrt_progressive*

	mkdir -p $pkgdir/usr/bin
	for file in $pkgdir/opt/moonray/bin/*; do
		ln -s /opt/moonray/bin/$(basename "$file") $pkgdir/usr/bin/
	done
        
	install -Dm644 ${srcdir}/$_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgbase/LICENSE
	install -Dm644 ${srcdir}/$_pkgname/THIRD-PARTY.md $pkgdir/usr/share/licenses/$pkgbase/THIRD-PARTY.md

	install -Dm755 "${srcdir}"/$pkgbase.sh "${pkgdir}"/etc/profile.d/$pkgbase.sh # Add env vars
}

package_moonray-gui() {
	depends+=($pkgbase
	          qt6-base
	          qt5-script)
	moondir="$srcdir"/moonray/opt/moonray

	mkdir -p "$pkgdir"/opt/moonray/{bin,lib/cmake,sessions}

	cp $moondir/bin/{arras_render,moonray_gui} "$pkgdir"/opt/moonray/bin
	cp -r $moondir/lib/cmake/{ArrasRender-6.0.0.0,MoonrayGui-15.0.0.0} "$pkgdir"/opt/moonray/lib/cmake
	cp $moondir/sessions/mcrt_progressive* "$pkgdir"/opt/moonray/sessions
	
	mkdir -p $pkgdir/usr/bin
	for file in $pkgdir/opt/moonray/bin/*; do
		ln -s /opt/moonray/bin/$(basename "$file") $pkgdir/usr/bin/
	done
}
