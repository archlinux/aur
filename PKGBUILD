# Maintainer: Aditya Mahajan <adityam at umich dot edu>
pkgname=context-minimals-git
pkgver=2020.04.30
pkgrel=1
pkgdesc="A standalone ConTeXt distribution"
url="http://www.contextgarden.net"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('rsync')
optdepends=('fontconfig: xetex support'
            'ruby: pdftex support'
            'ghostscript: support for PS and EPS images'
            'graphicsmagick: support for GIF and TIFF images'
            'inkscape: support for SVG images'
            'pstoedit: support for metapost outlines for fonts'
            'zint: support for barcodes'
            'curl: loading remote content')

conflicts=()
replaces=()
backup=()

install=context-minimals-git.install

PKGEXT=".pkg.tar.gz"
options=(!strip)

# ConTeXt minimals uses a different naming convention for architectures

declare -A _platform_map

_platform_map['i686']='linux'
_platform_map['x86_64']='linux-64'

_platform=${_platform_map[$CARCH]}

_rsyncurl=rsync://contextgarden.net/minimals/setup/${_platform}/bin
_dest=/opt/context-minimals

# This is the only way to get yaourt to store the files in
# /var/abs/local/yaourtbuild so that rsyncing the next time is efficient

_gitroot="https://gitorious.org/context"
_gitname="master"

# Font directories
_texlivefontdir="/usr/share/texmf-dist/fonts/"
_userfontdir="\$HOME/.fonts"
_osfontdir="/usr/share/fonts"

pkgver() {
  cd "$scrdir"
  grep -e '\\edef\\contextversion' tex/texmf-context/tex/context/base/mkiv/context.mkiv | sed -n 's/.*{\(.*\) .*}/\1/p'
}

prepare() {
 msg "Downloading the latest scripts first"
 rsync -rlpt --info=progress2 $_rsyncurl $srcdir || return 1
 msg "Initializing download directory"

 mkdir -p $srcdir/tex/texmf-cache || return 1
 
 msg "Starting download or update of ConTeXt distribution"
 PATH=$scrdir/tex/texmf-$platform/bin:$PATH \
 $srcdir/bin/texlua $srcdir/bin/mtxrun --script $srcdir/bin/mtx-update.lua  \
      --platform=$_platform --texroot=$srcdir/tex --engine=all --modules=all \
      --flags="-rpzztl --info=progress2" \
      --context=latest  --update  --force || return 1

 # The setuptex that comes with minimals does not work in a multi-user
 # environment. So, we modify it appropriately.
 # Generate a setuptex file
 cat <<- _EOF_ > $srcdir/tex/setuptex
	_OLD_PS1=\$PS1
	_OLD_PATH=\$PATH
	TEXMFOS=${_dest}/texmf-${_platform}
	export TEXMFOS
	
	TEXMFCACHE=\$HOME/.cache/context-minimals
	export TEXMFCACHE
	
	PATH=\$TEXMFOS/bin:\$PATH
	export PATH
	
	PS1="(ctx) \$PS1"
	export PS1
	
	OSFONTDIR="$_userfontdir;$_osfontdir;" 
	export OSFONTDIR
	resettex () {
	    PATH=\$_OLD_PATH
	    export PATH
	    unset _OLD_PATH
	    
	    PS1=\$_OLD_PS1
	    export PS1
	    unset _OLD_PS1
	    
	    unset -f resettex
}
_EOF_

 # If texlive exists, use fonts from texlive
 if [ -d $_texlivefontdir ]
 then
   mkdir -p $srcdir/tex/texmf-fonts
   if [ -L $srcdir/tex/texmf-fonts/fonts ]
   then 
     rm $srcdir/tex/texmf-fonts/fonts
   fi
   ln -s $_texlivefontdir $srcdir/tex/texmf-fonts/fonts
 fi
}


package()
{
 install -d $pkgdir/opt || return 1
 msg "Copying files"
 # cp -r does not delete old files that are present in texmf-cache from
 # previous installation
 # cp -r --preserve=links $srcdir/tex $pkgdir/$_dest || return 1
 rsync -azz --links --delete --info=progress2 $srcdir/tex/ $pkgdir/$_dest || return 1
}
