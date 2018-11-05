# Maintainer: Tom Hale <tom[noodle]hale[point]ee>

OPTIONS=(!strip)  # Stripping an AppImage renders it non-functional

_pkgname=nixnote2
pkgname=${_pkgname}-release-bin
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
source=("$pkgname:desktop.patch")
sha256sums=(4f12cddc49e0c694f41e344acebc0d8a3bce07a3496098eb2fae258ba9044967)
noextract=("${source[@]%%::*}")  # Don't extract anything

# All files in the directories specified are extracted
# Note that --appimage-extract currently doesn't support recursive extraction:
# https://github.com/AppImage/AppImageKit/issues/370
_extract_dirs=(usr/share/applications
               usr/share/man/man1
               usr/share/icons/hicolor/48x48/apps
               usr/share/nixnote2
               usr/share/nixnote2/help
               usr/share/nixnote2/translations)

_version_file=$pkgname-PKGBUILD-version  # For version from the download URL

_appimage_path=$(curl -s 'https://github.com/robert7/nixnote2/releases' |
                 sed -En 's:.*(/releases/download/v[^"/]+/[^"/]+[Aa]pp[Ii]mage)".*:\1:p' |
                 head -n1)

_appimage=${_appimage_path##*/}  # basename of AppImage

prepare() {
  wget -N "$url/$_appimage_path"  # Only download again if server version is newer

  # Make download executable
  chmod 755 "$_appimage"

  # Save version from download URL for pkgver() in `makepkg -e`
  [[ $_appimage_path =~ /releases/download/v([^/]+).* ]]
  local version=${BASH_REMATCH[1]}
  echo ${version//-/.} >| "$_version_file"

  # Due to this issue, all --appimage-extract target directories must already exist
  # https://github.com/AppImage/AppImageKit/issues/363
  local dir
  for dir in "${_extract_dirs[@]}"; do
    mkdir -p squashfs-root/"$dir"
    "./$_appimage" --appimage-extract "$dir/*"
  done

  rm -r squashfs-root/usr/share/"$_pkgname"/{java,images}  # Remove non-human resources

  # Directories are extracted with no permissions for group and other. Fix:
  find squashfs-root -type d -exec chmod go+rx -- {} +

  # Have the .desktop point explicitly at the icon
  patch -d squashfs-root/usr/share/applications < "$pkgname:desktop.patch"
}


pkgver() {
    cat "$_version_file"
}


package() {
  cd "$pkgdir"

  # User resources
  cp -pr "$srcdir"/squashfs-root/usr .

  # AppImage as /usr/bin/nixnote2 for .desktop file
  install -Dm755 -T "$srcdir/$_appimage" usr/bin/"$_pkgname"
}
