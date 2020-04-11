# Maintainer: Intestinal
pkgname="xfce-simple-dark"
pkgver=9
pkgrel=2
pkgdesc="Set of dark themes for Xfce widgets, Xfce window decoration and Geany."
arch=("x86_64")
license=('GPLv3, Copyright 2017-2020 Simon Krauter')
source=("https://github.com/trustable-code/$pkgname/archive/v$pkgver.tar.gz")
url="https://github.com/trustable-code/xfce-simple-dark"
md5sums=('94dea0ec74580f118b6273624406878f')
_full_name="Xfce-Simple-Dark"
_themes="$HOME/.themes"
_dstdir="$HOME/.local/share/themes/$_full_name"
_geany_config="$HOME/.config/geany/colorschemes"
_geany_file="simple-dark.conf"

package() {
  _sub_srcdir="$srcdir/$_full_name-$pkgver"

  # Remove previous version source
  echo "Remove $_dstdir"
  rm -rf $_dstdir

  # Remove previous version links
  for ln in $_sub_srcdir/$_full_name*; do
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
  cp -r $_sub_srcdir/* $_dstdir
  echo "Copy $_full_name to $_dstdir"

  # Create Xfce themes
  for directory in $_dstdir/$_full_name*; do
    link=$_dstdir/$(basename $directory)
    ln -s $link $_themes
    echo "Create link $link -> $_themes/$(basename $directory)"
  done

  # Create Geany theme
  ln -s $_dstdir/geany/$_geany_file $_geany_config
  echo "Create link $_dstdir/geany/$_geany_file -> $_geany_config/$_geany_file"
}
