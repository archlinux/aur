# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Old Maintainer: Ezekiel Sulastin <zekesulastin@gmail.com>

# Warning: this package is BIG - 1.6 GiB for the GOG installer,
#   2 GiB for the actual unpacked game data, and 2 GiB for
#   the finished package if uncompressed.  mv is used over cp
#   in the package phase to save a bit of space, but make sure
#   there is enough room for everything.

# This package preferentially uses GOG's installer, using the
#   build function to extract the data.  Please ensure the
#   file is available in the build directory via copy or
#   symlink, i.e. ~/aur/fs2_open-data/setup_freespace_2.exe.
#	If using a copy of the retail CD, follow the instructions
#   from the website below to extract the data. Once extracted, place
#   the data directly in the $builddir/src directory, i.e.
#	~/aur/fs2_open-data/src/.
#   http://www.hard-light.net/wiki/index.php/Fs2_open_on_Linux/Acquiring_the_Game_Data

# TODO: acquire copy of CDs to test, refine, and include CD installer
# script in pkgbuild

pkgname=fs2_open-data
pkgver=1.20
pkgrel=4
pkgdesc="Freespace 2 retail data for fs2_open"
arch=('any')
url="http://www.gog.com/en/gamecard/freespace_2"
license=('custom:freespace2')
makedepends=('innoextract' 'recode')

# This package is about 2 GiB uncompressed and takes
#	a while to recompress for not too much space savings;
#	the following PKGEXT disables compression of the
#	package.  Add .xz or similar to the end of PKGEXT
#	to compress the package.
PKGEXT=".pkg.tar"

prepare() {
  # Could possibly support older versions of the GOG installer too,
  # but it's worth it to have the latest version.
  local _gog_md5="2870b98722a1e56a360e3a959019e678"
  local _gog_exe="setup_freespace2_2.0.0.8.exe"
  if [[ -f ../$_gog_exe ]]; then
    echo "GOG installer detected; checking md5sum ..."
    if ! echo "$_gog_md5 ../$_gog_exe" | md5sum -c --status; then
      error "Invalid md5sum; verify your download and try again."
      return 1
    else
      ln -s ../$_gog_exe .
      innoextract $_gog_exe
    fi
  elif [[ -f readme.txt ]]; then
    echo "Retail CD files detected."
  else
    error "You must have either $_gog_exe or the extracted files\
 from the retail CD present (.exe in main dir or CD files in src)."
    error "Either download the game from your GOG shelf or extract the files\
 from the retail CD and try again."
    return 1
  fi
}

package() {
  cd "$srcdir"

  if [[ -r readme.txt ]]; then sed -n 416,471p readme.txt > LICENSE;
  else head -n 19 < tmp/GOG_EULA.txt | recode windows-1252/CRLF..utf8 > LICENSE;
    license=('custom:goodoldgames');
  fi

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # This whole thing goes in /opt/fs2_open as a lot of upstream stuff
  #   expects binaries and data to be together like in Windows
  mkdir -p "$pkgdir/opt/fs2_open"

  if [[ -r readme.txt ]]; then
    mv ./* "$pkgdir/opt/fs2_open"
  else
    # The GOG installer places cutscenes and data copies in folders
    #   corresponding with the original CDs; we need to move the
    #   cutscenes and delete the redundant data and folders.
    mkdir app/data/movies
    mv app/data{2,3}/*.MVE app/data/movies/
    rm -rf app/data{2,3}
    mv app/* "$pkgdir/opt/fs2_open"
  fi

  # Useless files for a Linux port. :D
  find "$pkgdir/opt/fs2_open" -iname \*.exe -print0 -or -iname \*.dll -print0 \
    -or -iname \*.ico -print0 | xargs -0 rm -f
}
