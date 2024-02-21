# Maintainer: David Grimm < david[dot]grimm [replace this with the swirly a sign] vegri[dot]net >
pkgname=ov-client
pkgver="0.21.1"
pkgrel=1
epoch=
pkgdesc="Client to share and receive spatial realtime Audio"
arch=('x86_64'
	  'arm64'
	  'armhf'
	  'aarch64'
	 )
url="https://ovbox.de"
license=('GPL')
groups=()
depends=('jack2'
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
		)
makedepends=('git'
			 'bash'
			 'make'
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
	if [ "$(ls ov-client)" == "" ]
	then
		git clone https://github.com/gisogrimm/ov-client.git
	else
		cd ov-client
		git checkout master
		git pull
		cd ..
	fi
	cd ov-client
	git checkout -q 442a95c5f5f62332eee251bafc04531219e074d9
	git submodule update --init --recursive
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
$ usermod -a -G realtime \$USER
"
}
