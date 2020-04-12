# Maintainer: Intestinal
pkgname="xfce-simple-dark"
pkgver=9
pkgrel=3
pkgdesc="Set of dark themes for Xfce widgets, Xfce window decoration and Geany."
arch=("x86_64")
license=('GPLv3, Copyright 2017-2020 Simon Krauter')
source=("https://github.com/trustable-code/$pkgname/archive/v$pkgver.tar.gz")
url="https://github.com/trustable-code/xfce-simple-dark"
md5sums=('94dea0ec74580f118b6273624406878f')
install=".install"

#==> Custom <==#
_home="/home/$(logname)"
_pretty_pkgname="Xfce-Simple-Dark"
_themes="$_home/.themes"
_dstdir="$_home/.local/share/themes/$_pretty_pkgname"
_geany_config="$_home/.config/geany/colorschemes"
_geany_file="simple-dark.conf"

_remove_package() {
  # Remove previous version source
  if [ -d $_dstdir ]; then
    echo "Remove $_dstdir"
    rm -r $_dstdir
  fi
  # Remove previous version links
  for ln in $_themes/$_pretty_pkgname*; do
    link=$_themes/$(basename $ln)
    if [ -L $link ]; then
      echo "Unlink $link"
      unlink $link
    fi
  done
  if [ -L $_geany_config/$_geany_file ]; then
    echo "Unlink $_geany_config/$_geany_file"
    unlink $_geany_config/$_geany_file
  fi
}
#==> End of custom <==#

package() {
  _remove_package

  # Create directories
  if [ ! -d $_themes ]; then
    echo "Create $_themes"
    mkdir -p $_themes
  fi
  if [ ! -d $_geany_config ]; then
    echo "Create $_geany_config"
    mkdir -p $_geany_config
  fi
  if [ ! -d $_dstdir ]; then
    echo "Create $_dstdir"
    mkdir -p $_dstdir
  fi

  # Copy new version
  cp -r $srcdir/$_pretty_pkgname-$pkgver/* $_dstdir
  echo "Copy $_pretty_pkgname to $_dstdir"

  # Create Xfce themes
  for directory in $_dstdir/$_pretty_pkgname*; do
    link=$_dstdir/$(basename $directory)
    ln -s $link $_themes
    echo "Create link $link -> $_themes/$(basename $directory)"
  done

  # Create Geany theme
  ln -s $_dstdir/geany/$_geany_file $_geany_config
  echo "Create link $_dstdir/geany/$_geany_file -> $_geany_config/$_geany_file"
}
