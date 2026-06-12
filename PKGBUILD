# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: loathingkernel <loathingkernel @at gmail .dot com>
pkgname=d7vk
pkgver=1.11
pkgrel=1
pkgdesc="Vulkan-based implementation of D3D7, 6, 5 and 3 for Linux / Wine, spun off from DXVK."
arch=('x86_64' 'i686')
url="https://github.com/WinterSnowfall/d7vk"
license=('Zlib')
depends=('bash')
makedepends=('mingw-w64-gcc' 'meson' 'ninja' 'python' 'git' 'glslang')
install="${pkgname}.install"
source=("git+$url.git#tag=v${pkgver}"
	"git+https://github.com/WinterSnowfall/mingw-directx-headers.git"
	"git+https://github.com/KhronosGroup/Vulkan-Headers.git"
	"git+https://github.com/KhronosGroup/SPIRV-Headers.git"
	"git+https://github.com/doitsujin/libdisplay-info.git"
	"git+https://github.com/doitsujin/dxbc-spirv.git"
	"dxvk-extraopts.patch"
	"setup_d7vk"
	"setup_d7vk.sh"
	)
sha256sums=('b3264d2e7e6052a8cbf0784b074b59d0c4539f6fc68873842191451d1b43e360'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'bcc15521e4c7f966a0192a1dabb7fb4935b33db39344ab5b861f9d81486f1362'
            '7ef10365d3926f928461f302a35429d13c0fb730a4062d487879c519a3c46b4e'
            '32b036bea35aa457e4d5a6ed7f2d2883cf97fe97967371b30916d5b9890cab44')

prepare() {
	cd "$srcdir/${pkgname}"
	patch -Np1 < "$srcdir/dxvk-extraopts.patch"
    # By default export FLAGS used by proton and ignore makepkg
    # This overrides FLAGS from makepkg.conf, if you comment these you are on your own

    local -a split=($CFLAGS)
    local -A flags
    for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done
    local march="${flags["-march"]:-nocona}"
    local mtune="${flags["-mtune"]:-core-avx2}"

    CFLAGS="-O3 -march=$march -mtune=$mtune -pipe -mno-avx"
    CXXFLAGS="-O3 -march=$march -mtune=$mtune -pipe -mno-avx"
    LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    # These flags are taken from Proton
    CFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing"
    CXXFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing"
    LDFLAGS+=" -Wl,--file-alignment,4096"

    export CFLAGS CXXFLAGS LDFLAGS

    local cross_ldflags="$LDFLAGS"

    local cross_cflags="$CFLAGS -mcmodel=small"
    local cross_cxxflags="$CXXFLAGS -mcmodel=small"
    sed -i build-win64.txt \
        -e "s|@CARGS@|\'${cross_cflags// /\',\'}\'|g" \
        -e "s|@CXXARGS@|\'${cross_cxxflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${cross_ldflags// /\',\'}\'|g"

    local cross_cflags="$CFLAGS -mstackrealign -mpreferred-stack-boundary=2"
    local cross_cxxflags="$CXXFLAGS -mstackrealign -mpreferred-stack-boundary=2"
    sed -i build-win32.txt \
        -e "s|@CARGS@|\'${cross_cflags// /\',\'}\'|g" \
        -e "s|@CXXARGS@|\'${cross_cxxflags// /\',\'}\'|g" \
        -e "s|@LDARGS@|\'${cross_ldflags// /\',\'}\'|g"
	git submodule init
	git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
	git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
	git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
	git config submodule.subprojects/libdisplay-info.url "$srcdir/libdisplay-info"
	git config submodule.subprojects/dxbc-spirv.url "$srcdir/dxbc-spirv"
	git -c protocol.file.allow=always submodule update
	cd "$srcdir/${pkgname}/subprojects/dxbc-spirv"
	git submodule init
	git config submodule.submodules/spirv_headers.url "$srcdir/SPIRV-Headers"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname}"
	meson setup ./ "${srcdir}/build/x64" \
	--cross-file "${srcdir}/${pkgname}/build-win64.txt" \
	--prefix "/usr/share/${pkgname}/x64" \
	--bindir "" --libdir "" \
	-Dbuild_id=true \
	-Db_ndebug=if-release \
	-Denable_dxgi=false \
	-Denable_d3d8=false \
	-Denable_d3d10=false \
	-Denable_d3d11=false \
	--force-fallback-for=libdisplay-info \
	--buildtype "plain" \
	--strip
	ninja -C "${srcdir}/build/x64"
	meson setup ./ "${srcdir}/build/x32" \
	--cross-file "${srcdir}/${pkgname}/build-win32.txt" \
	--prefix "/usr/share/${pkgname}/x32" \
	--bindir "" --libdir "" \
	-Dbuild_id=true \
	-Db_ndebug=if-release \
	-Denable_dxgi=false \
	-Denable_d3d8=false \
	-Denable_d3d10=false \
	-Denable_d3d11=false \
	--force-fallback-for=libdisplay-info \
	--buildtype "plain" \
	--strip
	ninja -C "${srcdir}/build/x32"
}

package() {
	cd "$srcdir"
	DESTDIR="${pkgdir}" ninja -C build/x64 install
	DESTDIR="${pkgdir}" ninja -C build/x32 install
	for _arch in {x32,x64}
	do
		rm "${pkgdir}/usr/share/${pkgname}/${_arch}/ddraw.dll.a"
	done
	install -Dm755 "$srcdir/setup_d7vk" "$pkgdir/usr/bin/setup_d7vk"
	install -Dm755 "$srcdir/setup_d7vk.sh" "$pkgdir/usr/share/${pkgname}/setup_d7vk.sh"
	install -Dm644 "$srcdir/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
