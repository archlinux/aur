# Maintainer: Aditya Mahajan <adityam at umich dot edu>

pkgname=context-lmtx-bin
pkgver=2023.06.22
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

makedepends=('rsync' 'curl')
conflicts=()
replaces=()
backup=()

install=context-lmtx-bin.install
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

# List of _modules to be installed
# Can use '--all' to install all modules
_modules=('filter' 'visualcounter' 'vim' 'tikz' 'typescripts')

_dest=/opt/context-lmtx

# Font directories
_texlivefontdir="/usr/share/texmf-dist/fonts/"
_contextmodulesdir="/opt/context-minimals/texmf-modules"
_userfontdir="\$HOME/.fonts"
_osfontdir="/usr/share/fonts"

pkgver() {
  cd "$scrdir"
  grep -e '\\edef\\contextversion' tex/texmf-context/tex/context/base/mkxl/context.mkxl | sed -n 's/.*{\(.*\) .*}/\1/p'
}

prepare() {
  OLDPATH=$PATH
  PATH=$scrdir/bin:$scrdir/tex/texmf-${_platform}/bin:$PATH
  echo "Starting download or update of ConTeXt distribution"
  chmod +x $srcdir/bin/mtxrun
  $srcdir/bin/mtxrun --script $srcdir/bin/mtx-install.lua --update \
                     --server="${_lmtxserverlist}" \
                     --instance="install-lmtx" \
                     || return 1
  PATH=$OLDPATH
  # Make sure the binaries are executable
  chmod +x $srcdir/tex/texmf-${_platform}/bin/{context,luametatex,mtxrun}
 
  # Copy mtxrun for next install
  cp $srcdir/tex/texmf-${_platform}/bin/mtxrun $srcdir/bin
  cp $srcdir/tex/texmf-context/scripts/context/lua/{mtxrun.lua,mtx-install.lua} $srcdir/bin

# Install modules
OLDPATH=$PATH
PATH=$scrdir/tex/texmf-${_platform}/bin:$PATH
cd $srcdir/tex && texmf-${_platform}/bin/mtxrun --script texmf-context/scripts/context/lua/mtx-install-modules.lua --install ${_modules[@]}

# Erase cache, must be built by user:
$srcdir/tex/texmf-${_platform}/bin/mtxrun --script texmf-context/scripts/context/lua/mtx-cache --erase --all

PATH=$OLDPATH

 # Generate a setuptex file
 mkdir -p $srcdir/tex
 cat <<- _EOF_ > $srcdir/tex/setuptex
    _OLD_PATH=\$PATH
    _OLD_CONTEXTDIST=$CONTEXTDIST

    TEXMFOS=${_dest}/texmf-${_platform}
    export TEXMFOS

    TEXMFCACHE=\$HOME/.cache/context-lmtx
    export TEXMFCACHE

    # Set variable name to be used in terminal prompt
    CONTEXTDIST="lmtx"
    export CONTEXTDIST

    PATH=\$TEXMFOS/bin:\$PATH
    export PATH

    OSFONTDIR="$_userfontdir;$_osfontdir;"
    export OSFONTDIR

    resettex () {
        PATH=\$_OLD_PATH
        export PATH
        unset _OLD_PATH

        CONTEXTDIST=$_OLD_CONTEXTDIST
        export CONTEXTDIST
        unset _OLD_CONTEXTDIST

        unset -f resettex
    }
_EOF_
}


package()
{
 install -d $pkgdir/opt || return 1
 echo "Copying files"
 # cp -r does not delete old files that are present in texmf-cache from
 # previous installation
 # cp -r --preserve=links $srcdir/tex $pkgdir/$_dest || return 1
 rsync -az --links --delete --exclude='*.tma' --info=progress2 $srcdir/tex/ $pkgdir/$_dest || return 1
}
