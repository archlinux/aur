packager='Aditya Mahajan <adityam at umich dot edu>'
pkgname=luametatex
pkgver=2023.02.23
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

# Manually add the modules that you want to download here
modules=(
         "https://mirrors.ctan.org/macros/context/contrib/context-filter.zip"
         "https://mirrors.ctan.org/macros/context/contrib/context-vim.zip"
         "https://mirrors.ctan.org/macros/context/contrib/context-visualcounter.zip"
         "http://mirrors.ctan.org/install/graphics/pgf/contrib/pgfplots.tds.zip"
         "http://mirrors.ctan.org/install/graphics/pgf/contrib/circuitikz.tds.zip"
         )

pgf_modules=(
         "http://mirrors.ctan.org/install/graphics/pgf/base/pgf.tds.zip"
)

module_names=("${modules[@]##*/}")
pgf_module_names=("${pgf_modules[@]##*/}")

module_count=${#modules[@]}
pgf_module_count=${#pgf_modules[@]}

_dest=/opt/luametatex

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
  msg "Starting download or update of ConTeXt distribution"
  chmod +x $srcdir/bin/mtxrun
  $srcdir/bin/mtxrun --script $srcdir/bin/mtx-install.lua --update \
                     --server="${_lmtxserverlist}" \
                     --instance="install-lmtx" --erase \
                     || return 1
  PATH=$OLDPATH
  # Make sure the binaries are executable
  chmod +x $srcdir/tex/texmf-${_platform}/bin/{context,luametatex,mtxrun}
 
  # Copy mtxrun for next install
  cp $srcdir/tex/texmf-${_platform}/bin/mtxrun $srcdir/bin
  cp $srcdir/tex/texmf-context/scripts/context/lua/{mtxrun.lua,mtx-install.lua} $srcdir/bin

  echo "Installing $module_count + $pgf_module_count modules ..."
  mkdir -p $srcdir/tex/texmf-modules

  # PKGBUILD doesn't seem to support brace expansion
  declare -i count=0
  while [ $count -lt $module_count ]
  do
      wget -O $srcdir/${module_names[$count]} ${modules[$count]}
      unzip -o -d $srcdir/tex/texmf-modules $srcdir/${module_names[$count]}
      count+=1
  done

  mkdir -p $srcdir/tex/texmf-modules

  declare -i pgf_count=0
  while [ $pgf_count -lt $pgf_module_count ]
  do
      wget -O $srcdir/${pgf_module_names[$pgf_count]} ${pgf_modules[$pgf_count]}
      unzip -o -d $srcdir/tex/texmf-modules $srcdir/${pgf_module_names[$pgf_count]} \
            -x "**/t-*.*" 
      pgf_count+=1
  done


 # Generate a setuptex file
 mkdir -p $srcdir/tex
 cat <<- _EOF_ > $srcdir/tex/setuptex
	_OLD_PATH=\$PATH
    _OLD_CONTEXTDIST=$CONTEXTDIST

	TEXMFOS=${_dest}/texmf-${_platform}
	export TEXMFOS

	TEXMFCACHE=\$HOME/.cache/luametatex
	export TEXMFCACHE

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
 rsync -az --links --delete --info=progress2 $srcdir/tex/ $pkgdir/$_dest || return 1
}
