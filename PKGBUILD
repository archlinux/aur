# Maintainer: Tom Hale <tom[noodle]hale[point]ee>

_pkgname=nixnote2
pkgname=${_pkgname}-appimage-bin
pkgver=2.1.0.beta4j
pkgrel=1
pkgdesc='Evernote clone (formerly Nevernote) - latest binary release'
url="https://github.com/robert7/$_pkgname"
arch=(x86_64)
license=(GPL3)
depends=(zlib)  # For --appimage-extract
makedepends=(git)
provides=("nixnote=${pkgver%.r*}" "$_pkgname=${pkgver%.r*}")
replaces=(nevernote nixnote nixnote-beta)
source=("$_pkgname.AppImage::$url/releases/download/continuous/NixNote2-${CARCH}.AppImage")
#  https://github.com/robert7/nixnote2/releases/tag/continuous-develop
sha256sums=('SKIP')
OPTIONS=(!strip)  # Stripping an AppImage makes it non-functional

# Directories which contain files to unpack / install
# Note that --appimage-extract currently doesn't support recursive extraction
# Also, `install` doesn't support directories, only files:
# https://unix.stackexchange.com/questions/475242/install-directories-recursively-with-gnu-install
_extract_dirs=(usr/share/applications
               usr/share/doc/nixnote2
               usr/share/man/man1
               usr/share/nixnote2
               usr/share/icons/hicolor/48x48/apps)
prepare() {
  chmod 755 "$_pkgname.AppImage"

  # Due to this issue, all --appimage-extract target directories must already exist
  # https://github.com/AppImage/AppImageKit/issues/363
  local dir
  for dir in "${_extract_dirs[@]}"; do
    mkdir -p squashfs-root/"$dir"
    "./$_pkgname.AppImage" --appimage-extract "$dir/*"
  done
}

pkgver() {
  cat squashfs-root/usr/share/nixnote2/version.txt | sed 's/-/./g'
}

package() {
  cd "$pkgdir"

  install -Dm755 -t "opt/$_pkgname" "$SRCDEST/$_pkgname.AppImage"

  local dir file
  for dir in "${_extract_dirs[@]}"; do
    for file in "$srcdir/squashfs-root/$dir"/*; do
      # install fails if given a directory, so check:
      [[ -f $file ]] && install -Dm644 -t "$dir" "$file"
    done
  done

  # Create symlink to AppImage
  install -d usr/bin
  # Install copies symlink targets rather than the symlink itself
  # https://unix.stackexchange.com/q/475246/143394
  (cd usr/bin && ln -fs "/opt/$_pkgname/$_pkgname.AppImage" "$_pkgname")
}
