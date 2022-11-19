# Maintainer: Sławomir Śpiewak <slawekwaga@gmail.com>
# Contributors: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B'
'7FDB657970703F784830708E55242301DDCE0A32')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Since this is a development build and people may want to have both the latest stable AND development,
# it installs alongside rather than as a conflict of zandronum2.
# Adapted from https://wiki.zandronum.com/Compiling_Zandronum_on_Linux#Arch_Linux
pkgname=zandronum-hg
pkgver=r10948+.83b6cd3bc9e6+
pkgrel=1
_fmod_ver_true="4.44.64"
_fmod_ver="$(echo ${_fmod_ver_true} | sed -e 's/\.//g')"
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer. (Development branch checkout)"
arch=('i686' 'x86_64')
url="https://zandronum.com"
license=('custom')
depends=('sdl' 'libjpeg6-turbo' 'glu' 'openssl' 'fluidsynth' 'fmodex') #we really should not depend into AURs...
optdepends=('timidity++: midi support'
            'freedoom: free IWAD'
	    'doomseeker: a GUI server browser'
            'gtk2: for a GUI selection screen')
makedepends=('zlib' 'sdl' 'libjpeg-turbo' 'nasm' 'gtk2' 'cmake' 'mercurial' 'fluidsynth' 'mesa' 'glu')
_pkgname=zandronum
#provides=("zandronum")
conflicts=("zandronum-dev")
install=zandronum-hg.install
changelog=
noextract=()
source=("zandronum::hg+https://hg.osdn.net/view/zandronum/zandronum-stable"
	"LICENSE"
        "${pkgname}.launcher"
        "${pkgname}-server.launcher"
	"${pkgname}.png"
	"${pkgname}.desktop"
        "${pkgname}.launcher.sig"
        "${pkgname}-server.launcher.sig"
        "LICENSE.sig"
	"${pkgname}.png.sig"
	"${pkgname}.desktop.sig"

	"fix_unsafe_printf.patch"

	"fix_unsafe_printf.patch.sig")
#source_x86_64=("http://zandronum.com/essentials/fmod/fmodapi${_fmod_ver}linux64.tar.gz"
#	       "fmodapi${_fmod_ver}linux64.tar.gz.sig")
#source_i686=("http://zandronum.com/essentials/fmod/fmodapi${_fmod_ver}linux.tar.gz"
#	     "fmodapi${_fmod_ver}linux.tar.gz.sig")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP'
	    'b928f3211ff31f17fc2d754728e299b5783e1b946b4019713718b7613e13ff0a7c4f02087c0ab4f137f7a0de57a2bfeaa6ed63285d0e6063d2b4734b097ce9e1'
            '994d8aeba3a7eb13a0bdf9eaf1497b262b51c146bfc0f4769de41d64a640e411236f388d266cd80fcd19d93a04c67d27666fb2132407a1841d11dace886ec8b9'
            'bef074f7d9b68fd61c1ed978525e7ef3385a986565be64478e41eaccccdb57e157cab1910f02ad467b07bef82f6d6200faf7a1dc1ce2322197101fab259f1325'
	    'baad2256990455c275b23c56984a1db3b1ced921b69f2688c84d99eda996f7b61466543c7bd649e295c12b48dc288dce79ad911e2b5b5e0640a899f5281712a4'
	    '90b0ba290018bf446e926d3591105fd7608de3eab7ea790a0291bc0146e682e5e6ae1af056554cad7b7eda38a18106c8dfbafaeb4d443cc4816c99e3164258aa'
            'SKIP'
            'SKIP'
            'SKIP'
	    'SKIP'
	    'SKIP'
	    '8b1d525532d0c341529d1afa24e579dbb512f53baefa6ae7b2620e65eda8fb441c1c1afe515dd716027325f7e730998351c0fa4f8d10de08beaeba8850263cec'
	    'SKIP')
#sha512sums_x86_64=('edc851730c81da4423bd0f10a433c46b4a8bdad901b32f628087b40cec088760a441228ee47a75e17844c195e7abf79e02439c39b5fdeeb9689572dcd9104ade'
#		   'SKIP')
#sha512sums_i686=('5d4350de3683a8f990447cd8d870ef5b10787ae06e0533f4376ee3c8113fffa8723fcc7a8703bb556c8e9600915087ea078a77049aee34e7f79adf9ae32ebdc4'
#		 'SKIP')
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
prepare() {
   if [[ "${CARCH}" == 'x86_64' ]];
   then
     export fmod_dir_suffix='64'
   else
     export fmod_dir_suffix=''
	fi
	cd "${srcdir}/${_pkgname}"
	hg patch --no-commit  ../../fix_unsafe_printf.patch
}
build() {
	#export FMODFOLDER="${srcdir}/fmodapi${_fmod_ver}linux${fmod_dir_suffix}"
	export FMODFILE="libfmodex${fmod_dir_suffix}-${_fmod_ver_true}"

	# Client/Server
        cd "${srcdir}/${_pkgname}"
	if [ -d "client" ];
	then
	  cd client
	  make clean
          cd "${srcdir}/${_pkgname}"
	  rm -rf client
	  mkdir -p client
	else
	  mkdir -p client
	fi
	cd "${srcdir}/${_pkgname}/client"
	cmake -DCMAKE_BUILD_TYPE=Release -DFMOD_LIBRARY=/usr/lib/${FMODFILE}.so -DFMOD_INCLUDE_DIR=/usr/include/fmodex  ..
	#cmake -DCMAKE_BUILD_TYPE=Release -DFMOD_LIBRARY=${FMODFOLDER}/api/lib/${FMODFILE}.so -DFMOD_INCLUDE_DIR=${FMODFOLDER}/api/inc ..
        make prefix=${pkgdir}/usr

	# Dedicated Server
        cd "${srcdir}/${_pkgname}"
	if [ -d "server" ];
	then
	  cd server
	  make clean
          cd "${srcdir}/${_pkgname}"
	  rm -rf server
	  mkdir -p server
	else
	  mkdir -p server
	fi
	cd "${srcdir}/${_pkgname}/server"
	cmake -DCMAKE_BUILD_TYPE=Release -DSERVERONLY=ON ..
        make prefix=${pkgdir}/usr
}
package() {
        install -d -m 755 "${pkgdir}/usr/share/${pkgname}/lib"
        install -D -m 644 "${srcdir}/${_pkgname}/client/${_pkgname}.pk3" "${pkgdir}/usr/share/${pkgname}/"
        install -D -m 644 "${srcdir}/${_pkgname}/client/skulltag_actors.pk3" "${pkgdir}/usr/share/${pkgname}/"
        install -D -m 755 "${srcdir}/${_pkgname}/client/output_sdl/liboutput_sdl.so" "${pkgdir}/usr/share/${pkgname}/lib/"
        install -D -m 755 "${srcdir}/${_pkgname}/client/${_pkgname}" "${pkgdir}/usr/share/${pkgname}/"
        install -D -m 755 "${srcdir}/${_pkgname}/server/${_pkgname}-server" "${pkgdir}/usr/share/${pkgname}/"
        install -D -m 755 "${srcdir}/${pkgname}.launcher" "${pkgdir}/usr/share/${pkgname}/"
        install -D -m 755 "${srcdir}/${pkgname}-server.launcher" "${pkgdir}/usr/share/${pkgname}/"
	install -Dm644 "zandronum-hg.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "zandronum-hg.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
#	install -D -m 755 "${srcdir}/fmodapi${_fmod_ver}linux${fmod_dir_suffix}/api/lib/libfmodex${fmod_dir_suffix}-${_fmod_ver_true}.so" "${pkgdir}/usr/share/${pkgname}/lib/"

        install -d -m 755 "${pkgdir}/usr/bin"
        cd ${pkgdir}/usr/bin
        ln -sf /usr/share/${pkgname}/${pkgname}.launcher ${pkgname}
        ln -sf /usr/share/${pkgname}/${pkgname}-server.launcher ${pkgname}-server

}
