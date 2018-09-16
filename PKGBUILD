# $Id$
# Maintainer: Lars Norberg < arch-packages at cogwerkz dot org >

pkgname=wine-staging-pba-git
pkgver=3.16.r0.g7cfceb78+wine.3.16.r0.g64d9f309b7
pkgrel=1
_winesrcdir='wine-git'
_stgsrcdir='wine-staging-git'
_pbasrcdir='wine-pba-firerat-git'
pkgdesc='Wine staging branch with PBA patches for increased D3D performance. Git versions. (Also includes Path of Exile DX11 patch!)'
url='https://github.com/Firerat/wine-pba'
arch=('x86_64')
options=('staticlibs')
license=('LGPL')
depends=(
	'attr'						'lib32-attr'
	'fontconfig'				'lib32-fontconfig'
	'lcms2'						'lib32-lcms2'
	'libxml2'					'lib32-libxml2'
	'libxcursor'				'lib32-libxcursor'
	'libxrandr'					'lib32-libxrandr'
	'libxdamage'				'lib32-libxdamage'
	'libxi'						'lib32-libxi'
	'gettext'					'lib32-gettext'
	'freetype2'					'lib32-freetype2'
	'glu'						'lib32-glu'
	'libsm'						'lib32-libsm'
	'gcc-libs'					'lib32-gcc-libs'
	'libpcap'					'lib32-libpcap'
	'desktop-file-utils'
)
makedepends=(
	'git' 
	'autoconf' 
	'ncurses' 
	'bison' 
	'perl' 
	'fontforge' 
	'flex'
	'gcc>=4.5.0-2'
	'giflib'					'lib32-giflib'
	'libpng'					'lib32-libpng'
	'gnutls'					'lib32-gnutls'
	'libxinerama'				'lib32-libxinerama'
	'libxcomposite'				'lib32-libxcomposite'
	'libxmu'					'lib32-libxmu'
	'libxxf86vm'				'lib32-libxxf86vm'
	'libldap'					'lib32-libldap'
	'mpg123'					'lib32-mpg123'
	'openal'					'lib32-openal'
	'v4l-utils'					'lib32-v4l-utils'
	'alsa-lib'					'lib32-alsa-lib'
	'libxcomposite'				'lib32-libxcomposite'
	'mesa'						'lib32-mesa'
	'libgl'						'lib32-libgl'
	'opencl-icd-loader'			'lib32-opencl-icd-loader'
	'libxslt'					'lib32-libxslt'
	'libpulse'					'lib32-libpulse'
	'libva'						'lib32-libva'
	'gtk3'						'lib32-gtk3'
	'gst-plugins-base-libs'		'lib32-gst-plugins-base-libs'
	'vulkan-icd-loader'			'lib32-vulkan-icd-loader'
	'samba'
	'opencl-headers'
	'xorgproto'
	'pkg-config'
)
optdepends=(
	'giflib'					'lib32-giflib'
	'libpng'					'lib32-libpng'
	'libldap'					'lib32-libldap'
	'gnutls'					'lib32-gnutls'
	'mpg123'					'lib32-mpg123'
	'openal'					'lib32-openal'
	'v4l-utils'					'lib32-v4l-utils'
	'libpulse'					'lib32-libpulse'
	'alsa-plugins'				'lib32-alsa-plugins'
	'alsa-lib'					'lib32-alsa-lib'
	'libjpeg-turbo'				'lib32-libjpeg-turbo'
	'libxcomposite'				'lib32-libxcomposite'
	'libxinerama'				'lib32-libxinerama'
	'ncurses'					'lib32-ncurses'
	'opencl-icd-loader'			'lib32-opencl-icd-loader'
	'libxslt'					'lib32-libxslt'
	'libtxc_dxtn'				'lib32-libtxc_dxtn'
	'libva'						'lib32-libva'
	'gtk3'						'lib32-gtk3'
	'gst-plugins-base-libs'		'lib32-gst-plugins-base-libs'
	'vulkan-icd-loader'			'lib32-vulkan-icd-loader'
	'cups'
	'samba'
)
source=("$_winesrcdir"::'git://source.winehq.org/git/wine.git'
		"$_stgsrcdir"::'git+https://github.com/wine-staging/wine-staging.git'
		"$_pbasrcdir"::'git+https://github.com/Firerat/wine-pba'
		'steam.patch'
		'poe-fix.patch'
		'harmony-fix.diff'
		'30-win32-aliases.conf'
		'wine-binfmt.conf')
sha256sums=('SKIP'
			'SKIP'
			'SKIP'
			'972d6b114f7621c5f3bd34b1105dd390b318db18fbc76328001c984db488a9b0'
			'1c8be30224a67c0f279ae1324165708371aad8f290ebc6da69c686d0904e606c'
			'50ccb5bd2067e5d2739c5f7abcef11ef096aa246f5ceea11d2c3b508fc7f77a1'
			'9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
			'c589c1668851cf5973b8e76d9bd6ae3b9cb9e6524df5d9cb90af4ac20d61d152')
provides=(
	"wine=$(        printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
	"wine-wow64=$(  printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
	"wine-git=$(    printf '%s' "$pkgver" | sed 's/.*\+wine\.//')"
	"wine-staging=$(printf '%s' "$pkgver" | sed 's/\+wine.*//')"
)

conflicts=('wine' 'wine-wow64' 'wine-staging')
makedepends=(${makedepends[@]} ${depends[@]})
install=wine.install

prepare() {
	cd "${srcdir}"/"${_winesrcdir}"
	
	# restore the wine tree to its git origin state, without wine-staging patches
	# (necessary for reapllying wine-staging patches in succedent builds,
	# otherwise the patches will fail to be reapplied)
	msg2 'Cleaning wine source code tree...'
	git reset --hard HEAD 	# restore tracked files
	git clean -xdf 			# delete untracked files
	
	# change back to the wine upstream commit that this version of wine-staging is based in
	msg2 'Changing wine HEAD to the wine-staging base commit...'
	git checkout "$(../"$_stgsrcdir"/patches/patchinstall.sh --upstream-commit)"
	
	# workaround for FS#55128
	# https://bugs.archlinux.org/task/55128
	# https://bugs.winehq.org/show_bug.cgi?id=43530
	export CFLAGS="${CFLAGS/-fno-plt/}"
	export LDFLAGS="${LDFLAGS/,-z,now/}"

	# patch for 32bit font smoothing
	patch -Np1 < ../'harmony-fix.diff'

	# Patch to allow Path of Exile to run with DirectX11
	# https://bugs.winehq.org/show_bug.cgi?id=42695
	# 
	# Make a fresh 64bit wine prefix, and set the wine version to windows10. 
	# Disable antialiasing as this does not work at all in DirectX11.
	#
	# 	Run Path of Exile with the following line: 
	# 	wine 'PathOfExile_x64.exe' --garbage-generation 1 --waitforpreload
	# 
	# Note: Initial loading time after the grinding gears animation is higher, 
	# but stuttering in-game is reduced to a tolerable level. 
	# Maps are missing with DirectX11, no current way around this.
	patch -Np1 < ../'poe-fix.patch'
	
	# steam crossover hack for store/web functionality
	# https://bugs.winehq.org/show_bug.cgi?id=39403
	patch -Np1 < ../'steam.patch'

	# apply all wine-staging patches
	msg2 'Applying wine-staging patches...'
	"${srcdir}"/"${_stgsrcdir}"/patches/patchinstall.sh DESTDIR="${srcdir}/${_winesrcdir}" --all
	
	# apply wine-pba patches
	for _f in $(ls "${srcdir}"/"${_pbasrcdir}"/'patches'); do
		patch -Np1 < "${srcdir}"/"${_pbasrcdir}"/'patches'/${_f}
	done

	# fix path of opencl headers
	sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i configure*

	# delete old build dirs (from previous builds) and make new ones
	rm	-rf "${srcdir}"/"${pkgname}"-{32,64}-build
	mkdir -p "${srcdir}"/"${pkgname}"-64-build
	mkdir -p  "${srcdir}"/"${pkgname}"-32-build

}

pkgver() {
    cd "${srcdir}/${_stgsrcdir}"
    local _staging_tag="$(git tag --sort='version:refname' | tail -n1 | sed 's/-/./g;s/^v//;s/\.rc/rc/')"
    local _staging_version="$(git describe --long --tags \
                                | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/' \
                                | sed "s/^latest.release/${_staging_tag}/")"
    cd "${srcdir}/${_winesrcdir}"
    local _wine_version="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/\.rc/rc/')"
    
    printf '%s+%s' "$_staging_version" "$_wine_version"
}

build() {
	cd "${srcdir}"

	# build wine-staging 64-bit
	# (according to the wine wiki, this 64-bit/32-bit building order is mandatory)
	msg2 'Building Wine-64...'
	cd  "${srcdir}"/"${pkgname}"-64-build
	../${_winesrcdir}/configure \
		--prefix='/usr' \
		--libdir='/usr/lib' \
		--with-x \
		--with-gstreamer \
		--enable-win64 \
		--with-xattr \
		--disable-tests
		# Gstreamer was disabled for FS#33655

	make 

	# build wine-staging 32-bit
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	msg2 'Building Wine-32...'
	cd "${srcdir}/${pkgname}"-32-build
	../${_winesrcdir}/configure \
		--prefix='/usr' \
		--libdir='/usr/lib32' \
		--with-x \
		--with-gstreamer \
		--with-xattr \
		--with-wine64="${srcdir}/${pkgname}"-64-build \
		--disable-tests 

	make 
}

package() {
	
	# package wine-staging 32-bit
	# (according to the wine wiki, this reverse 32-bit/64-bit packaging order is important)
	msg2 'Packaging Wine-32...'
	cd "${srcdir}/${pkgname}"-32-build
	make 	prefix="${pkgdir}/usr" \
			libdir="${pkgdir}/usr/lib32" \
			dlldir="${pkgdir}/usr/lib32/wine" install
	
	# package wine-staging 64-bit
	msg2 'Packaging Wine-64...'
	cd "${srcdir}/${pkgname}"-64-build
	make 	prefix="${pkgdir}/usr" \
			libdir="${pkgdir}/usr/lib" \
			dlldir="${pkgdir}/usr/lib/wine" install
	
	# freetype font smoothing for win32 applications
	install -d "$pkgdir"/etc/fonts/conf.{avail,d}
	install -m644 "${srcdir}/30-win32-aliases.conf" "${pkgdir}/etc/fonts/conf.avail"
	ln -s ../conf.avail/30-win32-aliases.conf "${pkgdir}/etc/fonts/conf.d/30-win32-aliases.conf"

	# wine binfmt
	install -Dm 644 "${srcdir}/wine-binfmt.conf" "${pkgdir}/usr/lib/binfmt.d/wine.conf"
}
