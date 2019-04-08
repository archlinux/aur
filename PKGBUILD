# Maintainer: Aditya Mahajan <adityam at umich dot edu>
pkgname=luametatex
pkgver=2019.04.06
pkgrel=1
pkgdesc="ConTeXt LuaMetaTeX distribution"
url="http://www.contextgarden.net"
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('ghostscript: support for PS and EPS images'
            'graphicsmagick: support for GIF and TIFF images'
            'inkscape: support for SVG images'
            'pstoedit: support for metapost outlines for fonts'
            'zint: support for barcodes'
            'curl: loading remote content')

makedepends=('rsync')
conflicts=()
replaces=()
backup=()

install=luametatex.install
PKGEXT=".pkg.tar.gz"
options=(!strip)

# ConTeXt minimals uses a different naming convention for architectures

declare -A _platform_map

_platform_map['i686']='linux-32'
_platform_map['x86_64']='linux-64'
_platform=${_platform_map[$CARCH]}

_lmtxserver=lmtx.pragma-ade.nl
_lmtxserverlist=lmtx.contextgarden.net,lmtx.pragma-ade.com,lmtx.pragma-ade.nl
_zipfile=context-${_platform}.zip

source=("http://${_lmtxserver}/install-lmtx/${_zipfile}")
md5sums=('SKIP')

_dest=/opt/luametatex

# Font directories
_texlivefontdir="/usr/share/texmf-dist/fonts/"
_contextmodulesdir="/opt/context-minimals/texmf-modules"
_userfontdir="\$HOME/.fonts"
_osfontdir="/usr/share/fonts"

pkgver() {
  cd "$scrdir"
  grep -e '\\edef\\contextversion' tex/texmf-context/tex/context/base/mkiv/context.mkiv | sed -n 's/.*{\(.*\) .*}/\1/p'
}

prepare() {
 OLDPATH=$PATH
 PATH=$scrdir/bin:$scrdir/tex/texmf-${_platform}/bin:$PATH
 msg "Starting download or update of ConTeXt distribution"
 chmod +x $srcdir/bin/mtxrun
 $srcdir/bin/mtxrun --script $srcdir/bin/mtx-install.lua --update \
                    --server="${_lmtxserverlist}" \
                    --instance="install-lmtx" || return 1
 PATH=$OLDPATH
 # Make sure the binaries are executable
 chmod +x $srcdir/tex/texmf-${_platform}/bin/{context,luametatex,mtxrun}

 # Generate a setuptex file
 cat <<- _EOF_ > $srcdir/tex/setuptex
	_OLD_PS1=\$PS1
	_OLD_PATH=\$PATH
	TEXMFOS=${_dest}/texmf-${_platform}
	export TEXMFOS
	
	TEXMFCACHE=\$HOME/.cache/luametatex
	export TEXMFCACHE
	
	PATH=\$TEXMFOS/bin:\$PATH
	export PATH
	
	PS1="(lmtx) \$PS1"
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

 # If context-minimal exists, use modules from minimals
 if [ -d $_contextmodulesdir ]
 then
   if [ -L $srcdir/tex/texmf-modules ]
   then 
     rm $srcdir/tex/texmf-modules || return 1
   elif [ -d $srcdir/tex/texmf-modules ]
   then
     rmdir $srcdir/tex/texmf-modules || return 1
   fi
   ln -s $_contextmodulesdir $srcdir/tex/texmf-modules || return 1
 fi 
}


package()
{
 install -d $pkgdir/opt || return 1
 msg "Copying files"
 # cp -r does not delete old files that are present in texmf-cache from
 # previous installation
 # cp -r --preserve=links $srcdir/tex $pkgdir/$_dest || return 1
 rsync -az --links --delete --info=progress2 $srcdir/tex/ $pkgdir/$_dest || return 1
}
