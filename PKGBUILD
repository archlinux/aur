# Maintainer: Tom Hale <tom[noodle]hale[point]ee>

OPTIONS=(!strip)  # Stripping an AppImage renders it non-functional

_pkgname=nixnote2
pkgname=${_pkgname}-appimage
pkgver=2.1.9.f9cbad2
pkgrel=1
pkgdesc='Evernote clone - latest AppImage release'
url="https://github.com/robert7/$_pkgname"
arch=(x86_64)
license=(GPL3)
depends=(glibc hicolor-icon-theme zlib)
makedepends=(git)
conflicts=(nixnote2-git)
provides=("nixnote=${pkgver%.r*}" "$_pkgname=${pkgver%.r*}")
replaces=(nevernote nixnote nixnote-beta)
_appimage="NixNote2-${CARCH}.AppImage"
source=('https://github.com/robert7/nixnote2/releases/download/continuous/'"$_appimage")
b2sums=(SKIP)  # Source will change as new versions are released
noextract=("${source[@]%%::*}")  # Don't auto-extract anything

shopt -s extglob  # Used to ignore .gz files below (must be set outside function)

prepare() {
  local extract_dirs=(usr/share/applications
                      usr/share/doc/nixnote2
                      usr/share/icons
                      usr/share/man/man1
                      usr/share/nixnote2)

  # Extract selected goodness from the AppImage
  # All files in the directories specified are extracted recursively
  chmod u+x "$_appimage"
   # Option --appimage-extract complains if given multiple arguments, so here we go loopy-loo
  for dir in "${extract_dirs[@]}"; do
    "./$_appimage" --appimage-extract "$dir"
  done

  # Remove non-human readable resources
  rm -r squashfs-root/usr/share/"$_pkgname"/{java,images,translations}

  # On Arch, all man pages are gzipped, but...
  # gzip can't be told not to ask about overwriting existing .gz files
  # If stdin is not a tty, it skips them, but exits non-zero.
  # So pre-filter any .gz files with an extended glob
  gzip -9 --force squashfs-root/usr/share/man/man1/!(*.gz)
}


pkgver() {
    sed 's/-/./' squashfs-root/usr/share/nixnote2/build-version.txt
}


package() {
  cd "$pkgdir"

  # User resources
  cp -pr "$srcdir"/squashfs-root/usr .

  # Copy AppImage itself as /usr/bin/nixnote2
  install -Dm755 -T "$srcdir/$_appimage" usr/bin/"$_pkgname"
}
