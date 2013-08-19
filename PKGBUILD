# Contributor: Prurigro
# Maintainer: Prurigro & Anish
# gcc4.6_soname.patch fixes -soname flag for correct use
# sparse_boxee_make.patch drops unneded make options from makefile
# libjpeg_cflags.patch adds -fPIC flag to hte jpegturbo library compile
# config.patch fixes sql library version
# libpng.patch adds missing changes for libpng1.4

pkgname=boxee
pkgver=1.1.1.19092
_flashlib_pkgver=6684
pkgrel=1
pkgdesc="A freeware cross-platform media center software with social networking features that is a fork of the open source XBMC media center"
arch=('i686')
license=( 'GPL' )
depends=('fribidi' 'libpng' 'mesa' 'libsamplerate' 'libjpeg-turbo' 'libmad' 'jasper' 'libogg' 'libvorbis' 'libmysqlclient' 'libmms' 'sdl_mixer' 'libcdio' 'enca' 'hal' 'zip' 'libvdpau' 'gperf' 'unzip' 'faad2' 'smbclient' 'lzo2' 'fontconfig' 'libtiff' 'libxtst' 'libxinerama' 'libxrandr' 'faac' 'avahi')
makedepends=('autoconf' 'boost' 'cmake' 'nasm' 'coreutils' 'rsync' 'glew')
options=('!makeflags')
url="http://www.boxee.tv/"
#install='boxee-source.install'
source=(http://dl.boxee.tv/version/dlink.dsm380/1.1.1.19092/boxee-ce4100-$pkgver-ff659dd-source.tar.xz
	gcc4.6_soname.patch
	sparse_boxee_make.patch
	libjpeg_cflags.patch
	config.patch
	libpng.patch
	samba.patch
	smbno.h)
md5sums=('4f490189a3742cfe8c268bede4ca956a'
         '502ca56fc7008bb128d62895b569a147'
         'e12f7f878ef97d4d0b91eb3c8f74e845'
         'acacd13c8169bfc5f3fa15807a5bf789'
         '9dfd31d5336d002a94b3ca8df046c9dd'
         'fcbca3c8ffab5402fec84d6d05db5d3d'
         'a28c4cf86d1eba78d7f66bdbc4dafcf0'
         '3e53f9a60344dad366b230fb2ac876ec')

_src=${srcdir}/boxee-ce4100-"$pkgver"-ff659dd

build() {
	pushd ${_src} || return 1
		#if anyone wants pulseaudio, simply remove "--disable-pulse"
		patch -p0 < ../config.patch
		patch -p0 < ../gcc4.6_soname.patch
		patch -p0 < ../sparse_boxee_make.patch
		patch -p0 < ../libpng.patch
		patch -p0 < ../samba.patch
		patch -p0 < ../libjpeg_cflags.patch
		./bootstrap
		./configure --prefix=/opt/boxee --enable-mid --disable-debug --disable-pulse --enable-xrandr --disable-ccache --enable-vdpau --enable-faac --disable-ss-rsxs --disable-boxee-hal
		cp ../smbno.h xbmc/cores/paplayer/MACDll/Source/MACLib/.
		make
	popd

}
