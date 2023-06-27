# Maintainer: Tom Hale <tom[noodle]hale[point]ee>

OPTIONS=(!strip)  # Stripping an AppImage renders it non-functional

_pkgname=nixnote2
pkgname=${_pkgname}-appimage
pkgver=2.1.0.beta4
pkgrel=1
pkgdesc='Evernote clone (formerly Nevernote) - latest binary release'
url="https://github.com/robert7/$_pkgname"
arch=(x86_64)
license=(GPL3)
depends=(hicolor-icon-theme zlib)
makedepends=(git)
conflicts=(nixnote2-git)
provides=("nixnote=${pkgver%.r*}" "$_pkgname=${pkgver%.r*}")
replaces=(nevernote nixnote nixnote-beta)
_appimage=NixNote2-x86_64.AppImage
source=('https://github.com/robert7/nixnote2/releases/download/continuous/'"$_appimage")
b2sums=(SKIP)  # Source will change as new versions are released
noextract=("${source[@]%%::*}")  # Don't auto-extract anything


prepare() {
  wget -N "$url/$_appimage_path"  # Only download again if server version is newer

  # Make download executable
  chmod 755 "$_appimage"

  # Extract user resources from inside the AppImage
  # All files in the directories specified are extracted
  # Note that --appimage-extract currently doesn't support recursive extraction:
  # https://github.com/AppImage/AppImageKit/issues/370
  local extract_dirs=(usr/share/applications
                      usr/share/doc/nixnote2
                      usr/share/icons
                      usr/share/man/man1
                      usr/share/nixnote2
                      usr/share/nixnote2/help
                      usr/share/nixnote2/translations)

  # Due to this issue, all --appimage-extract target directories must already exist
  # https://github.com/AppImage/AppImageKit/issues/363
  local dir
  for dir in "${extract_dirs[@]}"; do
    mkdir -p squashfs-root/"$dir"
    "./$_appimage" --appimage-extract "$dir/*"
  done

  rm -r squashfs-root/usr/share/"$_pkgname"/{java,images}  # Remove non-human resources
  gzip -9 squashfs-root/usr/share/man/man1/*  # On Arch, all pages are gzipped
}


pkgver() {
    sed 's/-/./' squashfs-root/usr/share/nixnote2/build-version.txt
}


package() {
  cd "$pkgdir"

  # User resources
  cp -pr "$srcdir"/squashfs-root/usr .

  # AppImage as /usr/bin/nixnote2 for .desktop file
  install -Dm755 -T "$srcdir/$_appimage" usr/bin/"$_pkgname"
}
