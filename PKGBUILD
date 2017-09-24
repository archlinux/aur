# Maintainer: NikkyAI <root@nikky.moe>
pkgname=ripcord-bin # '-bzr', '-git', '-hg' or '-svn'
pkgver=0.2.18
pkgrel=1
pkgdesc=""
arch=( 'x86_64' )
url=""
license=( '' )
groups=()
depends=('qt5-base' 'qt5-imageformats' 'qt5-multimedia' 'qt5-websockets')
makedepends=('libxml2' 'p7zip' 'curl') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
replaces=()
backup=()
options=()
install=
 # TODO 
 # https://wiki.archlinux.org/index.php/PKGBUILD#install
 # install script for clean upgrades and removing package
source=(
	ripcord.sh
	ripcord.desktop
	ripcord.png
)
noextract=()
md5sums=('SKIP'
	'SKIP'
	'SKIP')

util() {
    if [ ! -f bucket.xml ]; then
        curl https://d2p8ngm6ymn7xy.cloudfront.net > bucket.xml
    fi
    # wget -N https://d2p8ngm6ymn7xy.cloudfront.net #-O bucket.xml

    let itemsCount=$(xmllint --xpath 'count(//*[local-name()="Key"])' bucket.xml)

    keys=($(
        for (( i=1; i <= $itemsCount; i++ )) ; do
            echo $(xmllint --xpath "(//*[local-name()='Key'])[$i]/text()" bucket.xml)
        done | grep arch | sort -r
    ))

    file=${keys[0]}
    filename="${file%.*}"
    version="${filename#ripcord-arch-64bit-}"

    # version=$(echo $filename | awk -F"-" '{ print $NF }')

    for arg in "$@"
    do
        case $arg in
            "version" )
            echo "RC_VERSION=$version;";;
            "file" )
            echo "RC_FILE=$file;";;
            "filename" )
            echo "RC_FILENAME=$filename;";;
            "url" )
            echo RC_URL="https://d2p8ngm6ymn7xy.cloudfront.net/$file;";;
            
    esac
    done
}
# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	# grab latest avalaible version from https://d2p8ngm6ymn7xy.cloudfront.net
	#cd "$srcdir/${pkgname%-git}"
	source <(util version)

	echo $RC_VERSION
}

prepare() {
	echo "$srcdir"
	echo ""
	if [ -f bucket.xml ]; then
        rm bucket.xml
    fi

	source <(util url file filename)
	if [ ! -f $RC_FILE ]; then
		curl -s $RC_URL > $RC_FILE
	fi
	#cd "$srcdir/${pkgname%-bin}"
	# patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

# build() {
# 	# cd "$srcdir/${pkgname%-bin}"
# }

# check() {
# 	cd "$srcdir"
# 	# make -k check
# }

package() {
	# cd "$srcdir/${pkgname%-bin}"
	cd "$srcdir"
	source <(util file)
	echo $RC_FILE

    # extract 7z to usr/local/share
	7z x $RC_FILE -o"$pkgdir/usr/share/${pkgname%-bin}"
	#chmod 755 "$pkgdir/usr/share/${pkgname%-bin}"
	ls -la $pkgdir/usr/share/${pkgname%-bin}
	chmod -R +r "$pkgdir/usr/share/${pkgname%-bin}"
	chmod +x "$pkgdir/usr/share/${pkgname%-bin}"
	chmod +x "$pkgdir/usr/share/${pkgname%-bin}/Ripcord"
	ls -la $pkgdir/usr/share/${pkgname%-bin}
	
	# copy launcher file
	mkdir --parents "$pkgdir/usr/bin/"
	cp ripcord.sh -T "$pkgdir/usr/bin/${pkgname%-bin}"
	chmod +x "$pkgdir/usr/bin/${pkgname%-bin}"

	# copy desktop file
	mkdir --parents "$pkgdir/usr/share/applications/"
	cp ripcord.desktop "$pkgdir/usr/share/applications/"
	chmod 0644 "$pkgdir/usr/share/applications/ripcord.desktop"

	# copy icon file
	mkdir --parents "$pkgdir/usr/share/icons/"
	cp ripcord.png "$pkgdir/usr/share/icons/"
}
