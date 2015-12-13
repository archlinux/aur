# Maintainer: valvetime <valvetimepackages@gmail.com>
pkgname=tetra-codec
pkgver=20151213_2
pkgrel=1
epoch=1
pkgdesc="installer script for TETRA codecs , based on https://github.com/sq5bpf/install-tetra-codec/. This PKGBUILD does not contain source code or binaries from ETSI, it 
merely downloads and compiles them"
arch=("any")
url="https://github.com/sq5bpf/install-tetra-codec"
license=('GPL2')

#needed to add this to shut up makepkg
source=("http://example.com")


groups=()
depends=()
makedepends=('wget' 'unzip')
checkdepends=()
optdepends=()
provides=("tetra-codec")


#install=.install
#changelog=
md5sums=('SKIP')




build() {


#this is the actual script with slight modifications done by me
#it does all the heavy lifting


#download the patch file neccessary to build the codec on 64 bit systems
wget https://raw.githubusercontent.com/sq5bpf/install-tetra-codec/master/codec.diff

#create a directory for (temporarily) holding the binaries
mkdir -p "$srcdir/tmp"

URL="http://www.etsi.org/deliver/etsi_en/300300_300399/30039502/01.03.01_60/en_30039502v010301p0.zip"
CODECFILE=`basename "$URL"`
CODECSUM=a8115fe68ef8f8cc466f4192572a1e3e

#the original path
#WORKDIR="$srcdir/tmp/codec-$$"

#our path
WORKDIR="$srcdir/tmp/codec" 

  #NOTE:in the original this was set to /tetra , however we need to package this
BASEDIR=$srcdir/tetra #change this if you want to install in another directory
INSTALLDIR=$BASEDIR/bin
SCRIPT_VERSION=1.1

check_codec() {
	TMPSUM=`md5sum "$CODECFILE" 2>/dev/null |cut -d ' ' -f 1`
	if [ "$TMPSUM" = "$CODECSUM" ]; then
		echo "Codec checksum ok"
		return 0
	else
		echo "Bad codec checksum. is $TMPSUM , but should be $CODECSUM"
		echo "Deleting the codec file $CODECFILE , please download a correct version"
		rm "$CODECFILE"
		exit 1
	fi
}

get_codec() {
	RET=0
	echo "*****  Getting codec"
	if [ -f "$CODECFILE" ]; then
		echo "We already have the codec sources in $CODECFILE"
	else
		echo "Downloading codec $URL"
		wget -v -O "$CODECFILE" "$URL"; RET=$?
		if [ "$RET" != 0 ]; then
			#should use here-documents, but they don't indent well under vim
			echo "Couldn't get codec from $URL"
			echo
			echo "***  PLEASE MAKE SURE YOU HAVE INTERNET ACCESS  !! ***" #ok, i know capitals are rude, but maybe someone will read it
			echo
			echo "You can also try to download it yourself, put it in $CODECFILE"
			echo "and run this script again."
			exit 1
		fi
	fi

}

check_prerequisites() {
	for i in unzip wget make gcc patch sudo
	do
		A=`which $i`
		if [ -x "$A" ]; then
			:
		else
			echo "You don't seem to have >> $i << installed."
			echo 	"Please install it and try again"
			exit 1
		fi
	done
}

compile_codec() {
	echo "*****  Building in $WORKDIR"
	mkdir -p $WORKDIR 
	TMPPWD=`pwd`



#this was just me trying to understand how the script works
#echo $TMPPWD



	(
	cd $WORKDIR && unzip -L "$TMPPWD/$CODECFILE" && patch -p1 -N -E < "$TMPPWD/codec.diff" && cd c-code && make
	) ; RET=$?
	if [ "$RET" != 0 ]; then
		echo "Something went wrong during the build. You can o to $WORKDIR/c-code and"
		echo "try to figure out what is the problem."
		echo "Or just remove the $WORKDIR if you don't want to debug the problem yourself"
		exit 1
	fi

echo $PWD
}


#commented out because we are packaging, not installing directly

#install_codec() {
#	echo "******  Installing codec."
#	echo "Will try without sudo first, and then with sudo if that fails"
#	MYUSER=`id -nu`
#	MYGROUP=`id -ng`
#	( cd "$WORKDIR/c-code" || exit $?
#	#try without sudo first
#	mkdir -p "$INSTALLDIR" || sudo mkdir -p "$INSTALLDIR"
#	cp sdecoder scoder cdecoder ccoder "$INSTALLDIR" || \
#		sudo cp sdecoder scoder cdecoder ccoder "$INSTALLDIR"
#	chown -R ${MYUSER}.${MYGROUP} "$BASEDIR" || sudo chown -R ${MYUSER}.${MYGROUP} "$BASEDIR"
#	) ; RET=$?
#	if [ "$RET" != 0 ]; then
#		echo "There was some problem installing, maybe you don't have sudo privileges?"
#		echo "Try to copy sdecoder, scoder, cdecoder, and ccoder from $WORKDIR/c-code to $INSTALLDIR"
#		exit 1
#	fi
#}

cleanup_install() {
	rm -fr "$WORKDIR"
}

check_install() {
	for i in sdecoder scoder cdecoder ccoder
	do
		[ -x "${INSTALLDIR}/$i" ] || return 1
	done
	return 0
}

######### main
echo "******  TETRA Codec installer [$0 v$SCRIPT_VERSION]"
echo "******  (c) 2015 Jacek Lipkowski <sq5bpf@lipkowski.org>"
check_prerequisites
get_codec
#check_codec #you can comment out this line if you know what you're doing :)
compile_codec
#install_codec && cleanup_install
#check_install && echo "******  Codec installed [$0 v$SCRIPT_VERSION]"


}





package() {


#debug stuff
#echo $PWD    
#CODECINSTALLATIONDIR=sudo cat "$srcdir/path"
#cd $CODECINSTALLATIONDIR
#echo $PWD



# create /tetra and copy the binaries to there
cd /home/david/builds/tetra/install-tetra-codecs/src/tmp/codec/c-code
mkdir -p $pkgdir/tetra/bin
cp ccoder cdecoder scoder sdecoder $pkgdir/tetra/bin

#make the /tetra dir writeable by users of group wheel (on most setups they can sudo anyways, might as well make it less of a pain)
chown -R :wheel $pkgdir/tetra

}
