# Maintainer: tjhexf <jhonatan@justin.com.br>
# Contributor: Eden Rose <eenov1988@gmail.com>
# Contributor: M Novick <mnovick1988@gmail.com>
# Contributor: M Rawash <mrawash@gmail.com>
# Contributor: MrBougo <bougospam at gmail dot com>
# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: Alexander Suhoverhov <cy at ngs dot ru>

pkgname=xonotic-git
pkgver=20220415.r2077.4b05ca1
pkgrel=1
pkgdesc="A free, fast-paced crossplatform first-person shooter. GIT version. PLEASE SEE AUR COMMENTS."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'armv8h')
url="http://xonotic.org"
license=('GPL')
depends=(
	'libxpm'
	'libjpeg'
	'libpng>=1.4.0'
	'libmodplug'
	'libvorbis'
	'libxxf86dga'
	'libxxf86vm'
	'alsa-lib'
	'sdl2'
	'curl'
	'unzip'
)
makedepends=('git' 'p7zip' 'zip' 'unzip' 'sdl2' 'mesa' 'imagemagick')
optdepends=(
	'libtheora: recording in ogv'
)
provides=('xonotic' 'xonotic-glx' 'xonotic-sdl' 'xonotic-dedicated' 'xonotic-icons' 'xonotic-tools' 'xonotic-git' 'nexuiz-compatible.pk3')
conflicts=('xonotic' 'xonotic-glx' 'xonotic-sdl' 'xonotic-dedicated' 'xonotic-icons' 'xonotic-tools' 'xonotic-git')

## NOTE: the way makepkg handles git checkouts, strips the .git directory and breaks the 'all' script.
## Disabling until its fixed...
#source=('git://git.xonotic.org/xonotic/xonotic.git')
#md5sums=('SKIP')

_gitroot="https://gitlab.com/xonotic/xonotic.git"
_gitname="xonotic"
_releasename="git-AUR"
_compression=5

_compress() {
	find $1 -type f -print0 |
		git_src_repo=$2              \
		CACHEDIR="$srcdir"/datacache 
}

_git_extract() {
	_from=$1
	_to=$2
	shift 2
	{ cd "$_from"; git archive --format=tar HEAD -- "$@"; } \
		| {
			cd "$_to"
			tar xvf -
		}
}

# 7z compresses nicely but can't deal with flags and symlinks
_mkzip() {
	_archive=$1
	shift
	_ziplist=`mktemp`
	find "$@" -xtype f \( -executable -or -type l \) -print > "$_ziplist"
	7za a -tzip -mx=$_compression -x@"$_ziplist" "$_archive" "$@" || true
	zip         -$_compression -y -@<"$_ziplist" "$_archive"      || true
	rm -f "$_ziplist"
}

date="$(date +%Y%m%d)"


prepare() {
if [ ! -d $_gitname  ] ; then
git clone $_gitroot
else
cd $_gitname
./all update -l best
./all update-maps
cd ../
fi
}

pkgver() {
  cd $srcdir
  if [ ! -d $_gitname  ] ; then
   git clone $_gitroot
   cd "$srcdir"/$_gitname/
   printf "$date"."r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
   cd "$srcdir"/$_gitname/
   printf "$date"."r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}


build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	#if [ ! -e "$srcdir"/$_gitname/d0_blind_id.no ] ; then
	#	cd $_gitname
	#	touch d0_blind_id.no
	#	cd ../
	#fi
	if [ ! -e "$srcdir"/$_gitname/netradiant.yes ] ; then
		cd $_gitname
		touch netradiant.yes
		cd ../
	fi	
	if [ ! -e "$srcdir"/$_gitname/data/xonotic-nexcompat.pk3dir.yes ] ; then
		cd $_gitname
		touch data/xonotic-nexcompat.pk3dir.yes
		cd ../
	fi	
	#if [ ! -d "$srcdir"/$_gitname/d0_blind_id ] ; then
	#	cd $_gitname
	#	mkdir d0_blind_id
	#	cd ../
	#fi
	
	cd ${_gitname}

	./all update -l best
	
        if [ `ls -l misc/builddeps/linux64/d0_blind_id/include/d0_blind_id | grep -c ">"` = "1" ]; then
        msg "symlink set"
        else
        if [ -d /usr/include/d0_blind_id ]; then
                cd misc/builddeps/linux32/d0_blind_id/include/
                mv d0_blind_id d0_blind_id_
                ln -s /usr/include/d0_blind_id d0_blind_id
                cd ../../../
                cd linux64/d0_blind_id/include/
                mv d0_blind_id d0_blind_id_
                ln -s /usr/include/d0_blind_id d0_blind_id
                cd ../../../../../
        fi
        fi
        if [ `ls -l misc/builddeps/linux64/d0_blind_id/lib/libd0_blind_id.so.0.0.0 | grep -c ">"` = "1" ]; then
        msg "symlink set"
        else
        if [ -e /usr/lib/libd0_blind_id.so.0.0.0 ]; then
                cd misc/builddeps/linux64/d0_blind_id/lib/
                mv libd0_blind_id.so.0.0.0 libd0_blind_id.so.0.0.0_
                ln -s /usr/lib/libd0_blind_id.so.0.0.0 libd0_blind_id.so.0.0.0
                cd ../../../../../
                cd misc/builddeps/linux32/d0_blind_id/lib/
                mv libd0_blind_id.so.0.0.0 libd0_blind_id.so.0.0.0_
                ln -s /usr/lib32/libd0_blind_id.so.0.0.0 libd0_blind_id.so.0.0.0
                cd ../../../../../
        fi
        fi
        if [ `ls -l misc/builddeps/linux64/d0_blind_id/lib/libd0_blind_id.a | grep -c ">"` = "1" ]; then
        msg "symlink set"
        else
        if [ -e /usr/lib/libd0_blind_id.a ]; then
                cd misc/builddeps/linux64/d0_blind_id/lib/
                mv libd0_blind_id.a libd0_blind_id.a_
                ln -s /usr/lib/libd0_blind_id.a libd0_blind_id.a
                cd ../../../../../
                cd misc/builddeps/linux32/d0_blind_id/lib/
                mv libd0_blind_id.a libd0_blind_id.a_
                ln -s /usr/lib32/libd0_blind_id.a libd0_blind_id.a
                cd ../../../../../

        fi
        fi
        if [ `ls -l misc/builddeps/linux64/d0_blind_id/lib/libd0_rijndael.so.0.0.0 | grep -c ">"` = "1" ]; then
        msg "symlink set"
        else
        if [ -e /usr/lib/libd0_rijndael.so.0.0.0 ]; then
                cd misc/builddeps/linux64/d0_blind_id/lib/
                mv libd0_rijndael.so.0.0.0 libd0_rijndael.so.0.0.0_
                ln -s /usr/lib/libd0_rijndael.so.0.0.0 libd0_rijndael.so.0.0.0
                cd ../../../../../
                cd misc/builddeps/linux32/d0_blind_id/lib/
                mv libd0_rijndael.so.0.0.0 libd0_rijndael.so.0.0.0_
                ln -s /usr/lib32/libd0_rijndael.so.0.0.0 libd0_rijndael.so.0.0.0
                cd ../../../../../
        fi
        fi
        if [ `ls -l misc/builddeps/linux64/d0_blind_id/lib/libd0_rijndael.a | grep -c ">"` = "1" ]; then
        msg "symlink set"
        else
        if [ -e /usr/lib/libd0_rijndael.a ]; then
                cd misc/builddeps/linux64/d0_blind_id/lib/
                mv libd0_rijndael.a libd0_rijndael.a_
                ln -s /usr/lib/libd0_rijndael.a libd0_rijndael.a
                cd ../../../../../
                ## NOTE: this is temporary...
                cd misc/builddeps/linux32/d0_blind_id/lib/
                mv libd0_rijndael.a libd0_rijndael.a_
                ln -s /usr/lib32/libd0_rijndael.a libd0_rijndael.a
                cd ../../../../../
        fi
        fi
        
#         if [ `ls -l misc/builddeps/linux64//lib/.a | grep -c ">"` = "1" ]; then
#         msg "symlink set"
#         else
#         if [ -e /usr/lib/libd0_rijndael.a ]; then
#                 cd misc/builddeps/linux64/d0_blind_id/lib/
#                 mv libd0_rijndael.a libd0_rijndael.a_
#                 ln -s /usr/lib/libd0_rijndael.a libd0_rijndael.a
#                 cd ../../../../../
#                 cd misc/builddeps/linux32/d0_blind_id/lib/
#                 mv libd0_rijndael.a libd0_rijndael.a_
#                 ln -s /usr/lib32/libd0_rijndael.a libd0_rijndael.a
#                 cd ../../../../../
#         fi
#         fi
#         
#         if [ `ls -l misc/builddeps/linux64/d0_blind_id/lib/libd0_rijndael.a | grep -c ">"` = "1" ]; then
#         msg "symlink set"
#         else
#         if [ -e /usr/lib/libd0_rijndael.a ]; then
#                 cd misc/builddeps/linux64/d0_blind_id/lib/
#                 mv libd0_rijndael.a libd0_rijndael.a_
#                 ln -s /usr/lib/libd0_rijndael.a libd0_rijndael.a
#                 cd ../../../../../
#                 cd misc/builddeps/linux32/d0_blind_id/lib/
#                 mv libd0_rijndael.a libd0_rijndael.a_
#                 ln -s /usr/lib32/libd0_rijndael.a libd0_rijndael.a
#                 cd ../../../../../
#         fi
#         fi
#         
#         if [ `ls -l misc/builddeps/linux64/d0_blind_id/lib/libd0_rijndael.a | grep -c ">"` = "1" ]; then
#         msg "symlink set"
#         else
#         if [ -e /usr/lib/libd0_rijndael.a ]; then
#                 cd misc/builddeps/linux64/d0_blind_id/lib/
#                 mv libd0_rijndael.a libd0_rijndael.a_
#                 ln -s /usr/lib/libd0_rijndael.a libd0_rijndael.a
#                 cd ../../../../../
#                 cd misc/builddeps/linux32/d0_blind_id/lib/
#                 mv libd0_rijndael.a libd0_rijndael.a_
#                 ln -s /usr/lib32/libd0_rijndael.a libd0_rijndael.a
#                 cd ../../../../../
#         fi
#         fi
        
	./all compile -r
	
        msg "Building data pk3's..."
	rm -rf "$srcdir"/temp # just in case it was interrupted previously
	mkdir "$srcdir"/temp
	cd "$srcdir"/temp
	for _subrepo in font-dejavu font-unifont font-nimbussansl font-xolonium xonotic-data xonotic-music xonotic-maps xonotic-nexcompat; do
		mkdir $_subrepo
		_git_extract "$srcdir"/$_gitname/data/$_subrepo.pk3dir "$srcdir"/temp/$_subrepo
	done

	rm -rf "$srcdir"/temp/xonotic-data/qcsrc
	mv "$srcdir"/$_gitname/data/xonotic-data.pk3dir/progs.dat "$srcdir"/$_gitname/data/xonotic-data.pk3dir/csprogs.dat "$srcdir"/$_gitname/data/xonotic-data.pk3dir/menu.dat "$srcdir"/temp/xonotic-data

	cd "$srcdir"/temp/xonotic-maps
	#2x40 question marks. That's as many as eight tens. And that's terrible.
	for X in "$srcdir"/$_gitname/data/*-????????????????????????????????????????-????????????????????????????????????????.pk3; do
		if [ -f "$X" ]; then
			unzip "$X"
			rm -f maps/*.log maps/*.irc maps/*.lin
		fi
	done

	msg "Compressing data..."
	cd "$srcdir"/temp/
	# don't compress the font files
	for _subrepo in xonotic-data xonotic-music xonotic-maps xonotic-nexcompat; do
		_compress $_subrepo "$srcdir"/$_gitname/data/$_subrepo.pk3dir
	done

	msg "Packing data..."
	for _subrepo in font-nimbussansl font-xolonium xonotic-data xonotic-music xonotic-maps xonotic-nexcompat; do
		cd "$srcdir"/temp/$_subrepo
		_mkzip "$srcdir"/$_subrepo.pk3 * # this wildcard excludes dot files
	done

	msg "Removing temporary files..."
	rm -rf "$srcdir"/temp
	
#        make

}

package() {
	msg "Building Package..."
 	mkdir -p "$pkgdir"/opt/$pkgname/
 	_git_extract "$srcdir"/$_gitname/ "$pkgdir"/opt/$pkgname \
 		Docs \
 		server \
 		xonotic-linux-glx.sh xonotic-linux-sdl.sh \
 		key_0.d0pk
 	chmod 755 "$pkgdir"/opt/$pkgname/xonotic-linux-glx.sh \
 	          "$pkgdir"/opt/$pkgname/xonotic-linux-sdl.sh
 
 	# Binaries -- those names are needed by the launcher script
 	case "$CARCH" in
 		x86_64)  _arch="linux64" ;;
 		*)       _arch="linux32" ;;
 	esac
 	install -m755 "$srcdir"/$_gitname/darkplaces/darkplaces-glx "$pkgdir"/opt/$pkgname/xonotic-$_arch-glx
 	install -m755 "$srcdir"/$_gitname/darkplaces/darkplaces-sdl "$pkgdir"/opt/$pkgname/xonotic-$_arch-sdl
 	install -m755 "$srcdir"/$_gitname/darkplaces/darkplaces-dedicated "$pkgdir"/opt/$pkgname/xonotic-$_arch-dedicated
 
 	mkdir -p "$pkgdir"/opt/$pkgname/data/
 	mv -f "$srcdir"/*.pk3 "$pkgdir"/opt/$pkgname/data || true # those files are too big to be copied
 	mv -f "$srcdir"/$_gitname/data/*.pk3 "$pkgdir"/opt/$pkgname/data || true # those files are too big to be copied
 
 	# Launch scripts
 	mkdir -p "$pkgdir"/usr/bin
 	mv -f "$pkgdir"/opt/$pkgname/server/server_linux.sh "$pkgdir"/opt/$pkgname/
 	ln -sf /opt/$pkgname/xonotic-linux-glx.sh "$pkgdir"/usr/bin/xonotic-glx
 	ln -sf /opt/$pkgname/xonotic-linux-sdl.sh "$pkgdir"/usr/bin/xonotic-sdl
 	ln -sf /opt/$pkgname/server_linux.sh "$pkgdir"/usr/bin/xonotic-dedicated
 	
 	mkdir -p "$pkgdir"/usr/share/icons
 	install -m644 "$srcdir"/$_gitname/misc/logos/xonotic_icon.svg "$pkgdir"/usr/share/icons
 	install -m755 "$srcdir"/xonotic-glx.desktop "$pkgdir"/usr/share/applications
 	install -m755 "$srcdir"/xonotic-sdl.desktop "$pkgdir"/usr/share/applications
 	install -m755 "$srcdir"/xonotic-dedicated.desktop "$pkgdir"/usr/share/applications
	#readded these, sorry upstream! doubt anyone cares tho, since this package is basically dead.
#        msg "NOT WRITTEN YET!"
}
