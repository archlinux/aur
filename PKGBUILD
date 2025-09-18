# Maintainer: David Grimm < david[dot]dg[dot]grimm [replace this with the swirly a sign] gmail[dot]com >
pkgname=ov-client
pkgver="0.31.1"
pkgrel=2
epoch=
pkgdesc="Client to share and receive spatial realtime Audio"
arch=('x86_64'
	  'arm64'
	  'armhf'
	  'aarch64'
	 )
url="https://ovbox.de"
license=('GPL-3.0-only')
groups=()
depends=('jack'
		 'liblo'
		 'libsndfile'
		 'fftw'
		 'gsl'
		 'gtkmm3'
		 'gtk3'
		 'cairomm'
		 'hicolor-icon-theme'
		 'xerces-c'
		 'glibmm'
		 'atkmm'
		 'libsamplerate'
		 'libmatio'
		 'libltc'
		 'libsigc++'
		 'alsa-lib'
		 'gcc-libs'
		 'glibmm'
		 'glibc'
		 'glib2'
		 'nlohmann-json'
		 'realtime-privileges'
		 'eigen'
		 'boost'
		 'libxml++2.6'
		 'curl'
		 'nodejs'
		 'libsodium'
		)
makedepends=('git'
			 'bash'
			 'make'
			 'cmake'
			 'cunit'
			 'gcc'
			 'vim'
			 'pkg-config')
checkdepends=()
optdepends=()
provides=('ov-client'
		  'ovbox')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
b2sums=()
validpgpkeys=()

prepare() {
	if ! [ -d ov-client ]
	then
		git clone https://github.com/gisogrimm/ov-client.git
	else
		cd ov-client
		git checkout master
		cd ..
	fi
	cd ov-client
	git pull
	git submodule update --init --recursive
	git checkout -q fe1348ca05297ec0337b37bcf162914344cf04ef
}

build() {
	cd ov-client
	# the make routine only works on a clean repository
	make clean
	make -j
	rm build/*.*
}

# cmake fails to detect a working c++ compiler and is needed by google test
#check() {
#	cd ov-client
#	make libtest
#}

package() {
	cd ov-client
	make PREFIX="${pkgdir}/usr" install
	echo "
INFO:
To use OV-Client, please create an account at https://box.orlandoviols.com
To use a different server, start with the option \"-s [URL]\"

For minimal stuttering, please enable realtime privileges:
\$ usermod -a -G realtime \$USER
"
}
