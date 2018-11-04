# Maintainer: Tom Hale <tom[noodle]hale[point]ee>

_pkgname=nixnote2
pkgname=${_pkgname}-release-bin
pkgver=2.1.0.beta4
pkgrel=1
pkgdesc='Evernote clone (formerly Nevernote) - latest binary release'
url="https://github.com/robert7/$_pkgname"
arch=(x86_64)
license=(GPL3)
depends=(bash hicolor-icon-theme zlib)
makedepends=(git)
conflicts=(nixnote2-git)
provides=("nixnote=${pkgver%.r*}" "$_pkgname=${pkgver%.r*}")
replaces=(nevernote nixnote nixnote-beta)
_appimage_path=$(curl -s 'https://github.com/robert7/nixnote2/releases' |
                 sed -En 's:.*(/releases/download/v[^"/]+/[^"/]+[Aa]pp[Ii]mage)".*:\1:p' |
                 head -n1)
source=("$url/$_appimage_path"
        nixnote2
        nixnote2.desktop.patch)
sha256sums=(SKIP
            5d73ed58f17b5c360a0068808cb74580f9bf2d9ce959bb6300b63f5f837ac818
            4f12cddc49e0c694f41e344acebc0d8a3bce07a3496098eb2fae258ba9044967)
OPTIONS=(!strip)  # Stripping an AppImage makes it non-functional

PKGEXT=".pkg.tar"

# All files in the directories specified are extracted
# Note that --appimage-extract currently doesn't support recursive extraction:
# https://github.com/AppImage/AppImageKit/issues/370
_extract_dirs=(usr/share/applications
               usr/share/man/man1
               usr/share/icons/hicolor/48x48/apps
               usr/share/nixnote2
               usr/share/nixnote2/help
               usr/share/nixnote2/translations)


prepare() {
  _appimage=${_appimage_path##*/}  # basename of AppImage
  chmod 755 "$_appimage"

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
  patch -d squashfs-root/usr/share/applications < nixnote2.desktop.patch
}


pkgver() {
  [[ $_appimage_path =~ /releases/download/v([^/]+).* ]]
  local version=${BASH_REMATCH[1]}
  version=${version//-/.}
  echo "$version"
}


package() {
  cd "$pkgdir"
  _appimage=${_appimage_path##*/}  # basename of AppImage

  # User resources
  cp -pr "$srcdir"/squashfs-root/usr .

  # AppImage itself
  install -Dm755 -t "opt/$_pkgname" "$SRCDEST/$_appimage"

  # Wrapper script for /usr/bin
  install -Dm755 -t usr/bin "$SRCDEST/$_pkgname"

  # Make a constant filename that the wrapper can execute
  ( cd opt/"$_pkgname" && ln -s "$_appimage" "$_pkgname" )
}
