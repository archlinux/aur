# Maintainer: Aditya Mahajan <adityam at umich dot edu>
pkgname=luametatex
pkgver=2019.04.03
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
 msg "Starting download or update of ConTeXt distribution"
 chmod +x $srcdir/bin/mtxrun
 $srcdir/bin/mtxrun --script $srcdir/bin/mtx-install.lua --update \
                    --server="${_lmtxserverlist}" \
                    --instance="install-lmtx" || return 1
 # Generate a setuptex file

 echo "TEXMFOS=${_dest}/texmf-${_platform}"   > $srcdir/tex/setuptex
 echo "export TEXMFOS"                       >> $srcdir/tex/setuptex
 echo ""                                     >> $srcdir/tex/setuptex
 echo "TEXMFCACHE=\$HOME/texmf-cache"        >> $srcdir/tex/setuptex
 echo "export TEXMFCACHE"                    >> $srcdir/tex/setuptex
 echo ""                                     >> $srcdir/tex/setuptex
 echo "unset TEXINPUTS MPINPUTS MFINPUTS"    >> $srcdir/tex/setuptex
 echo ""                                     >> $srcdir/tex/setuptex
 echo "PATH=\$TEXMFOS/bin:\$PATH"            >> $srcdir/tex/setuptex
 echo "export PATH"                          >> $srcdir/tex/setuptex
 echo ""                                     >> $srcdir/tex/setuptex
 echo "OSFONTDIR=\"$_userfontdir;$_osfontdir;\"" \
                                            >> $srcdir/tex/setuptex
 echo "export OSFONTDIR"                    >> $srcdir/tex/setuptex
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
