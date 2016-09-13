# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Since this is a development build and people may want to have both the latest stable AND development,
# it installs alongside rather than as a conflict of zandronum2.
# Adapted from https://wiki.zandronum.com/Compiling_Zandronum_on_Linux#Arch_Linux
pkgname=zandronum-hg
pkgver=r9707.dd165ac5fc29
pkgrel=1
_fmod_ver_true="4.24.16"
_fmod_ver="$(echo ${_fmod_ver_true} | sed -e 's/\.//g')"
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer. (Development branch checkout)"
arch=('i686' 'x86_64')
url="https://zandronum.com"
license=('custom')
depends=('sdl' 'libjpeg6-turbo' 'glu' 'openssl' 'fluidsynth')
optdepends=('timidity++: midi support'
            'freedoom: free IWAD'
            'gtk2: for a GUI selection screen')
makedepends=('zlib' 'sdl' 'libjpeg-turbo' 'nasm' 'gtk2' 'cmake' 'mercurial' 'fluidsynth' 'mesa' 'glu')
_pkgname=zandronum
provides=("zandronum" "zandronum2")
conflicts=("zandronum" "zandronum-dev")
install=zandronum-hg.install
changelog=
noextract=()
source=("zandronum::hg+https://bitbucket.org/Torr_Samaho/zandronum"
	"LICENSE"
        "${pkgname}.launcher"
        "${pkgname}-server.launcher"
        "${pkgname}.launcher.sig"
        "${pkgname}-server.launcher.sig"
        "LICENSE.sig")
source_x86_64=("http://zandronum.com/essentials/fmod/fmodapi${_fmod_ver}linux64.tar.gz"
	       "fmodapi${_fmod_ver}linux64.tar.gz.sig")
source_i686=("http://zandronum.com/essentials/fmod/fmodapi${_fmod_ver}linux.tar.gz"
	     "fmodapi${_fmod_ver}linux.tar.gz.sig")
# see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git_Submodules if you require git submodules
sha512sums=('SKIP'
	    'b928f3211ff31f17fc2d754728e299b5783e1b946b4019713718b7613e13ff0a7c4f02087c0ab4f137f7a0de57a2bfeaa6ed63285d0e6063d2b4734b097ce9e1'
            '7595135cc49c02278b9871afe5291e45fb6811b858b900f52f6b606239aafc02f6f046f0de516922fad4cac2236320fde9711040a18c0a639f3b1be26fd54404'
            'ffa128418e045dc8a978f10a09964f385e0097a71fb6e62396447707a0c396d7526f24b3fc74c33aecca109b79aa8a36c309774904293909182dd80637e9c5e1'
            'SKIP'
            'SKIP'
            'SKIP')
sha512sums_x86_64=('edc851730c81da4423bd0f10a433c46b4a8bdad901b32f628087b40cec088760a441228ee47a75e17844c195e7abf79e02439c39b5fdeeb9689572dcd9104ade'
		   'SKIP')
sha512sums_i686=('5d4350de3683a8f990447cd8d870ef5b10787ae06e0533f4376ee3c8113fffa8723fcc7a8703bb556c8e9600915087ea078a77049aee34e7f79adf9ae32ebdc4'
		 'SKIP')
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
}
build() {
	export FMODFOLDER="${srcdir}/fmodapi${_fmod_ver}linux${fmod_dir_suffix}"
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
	cmake -DCMAKE_BUILD_TYPE=Release -DFMOD_LIBRARY=${FMODFOLDER}/api/lib/${FMODFILE}.so -DFMOD_INCLUDE_DIR=${FMODFOLDER}/api/inc ..
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
	install -D -m 755 "${srcdir}/fmodapi${_fmod_ver}linux${fmod_dir_suffix}/api/lib/libfmodex${fmod_dir_suffix}-${_fmod_ver_true}.so" "${pkgdir}/usr/share/${pkgname}/lib/"

        install -d -m 755 "${pkgdir}/usr/bin"
        cd ${pkgdir}/usr/bin
        ln -sf /usr/share/${pkgname}/${pkgname}.launcher ${pkgname}
        ln -sf /usr/share/${pkgname}/${pkgname}-server.launcher ${pkgname}-server

}
