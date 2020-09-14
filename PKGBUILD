# Maintainer: Denis Dyakov <denis.dyakov@gmail.com>

pkgname=gorsync-git
_pkgname=go-rsync
# It's not a problem that we have legacy version in pkgver,
# it will be updated in the building process to the actual.
# But better keep this value actual, since pkgver or pkgrel
# variables are used to notify all users that an upgrade is needed:
# https://wiki.archlinux.org/index.php/AUR_submission_guidelines
pkgver=0.4.0
epoch=
pkgrel=1
pkgdesc="GTK+ frontend (backup application) for RSYNC utility."
arch=('x86_64' 'i686')
url="https://github.com/d2r2/go-rsync"
license=('GPL3')
makedepends=('git' 'go')
depends=('rsync' 'glib2' 'gtk3' 'libnotify')
provides=('gorsync')
install="${pkgname}.install"
source=("${_pkgname}::git+https://github.com/d2r2/go-rsync.git")
md5sums=('SKIP')

# Get the tag of the commit to use
# Separated out to allow for `makepkg -e` not running prepare()
_get_tag() {
  _tag=$(git tag --list | grep '^v' | grep -v alpha | tail -n1)
  # echo "Selected git tag: $_tag" >&2  # To STDERR as called from pkgver()
}

# Get desktop file content to register application in
# Linux GUI environment.
_get_desktop_entry_file()
{
    local EMBEDDED
    EMBEDDED=$(cat << EndOfMsg
[Desktop Entry]
Name=Gorsync Backup
Comment=Easy-to-use backup app based on Rsync console utility
Exec=gorsync
Icon=media-tape-symbolic
Type=Application
Encoding=UTF-8
Terminal=false
Categories=GNOME;GTK;Utility;System;
Keywords=backup;rsync;
EndOfMsg
)
    echo "${EMBEDDED}"
}

# prepare() {
#   cd "${srcdir}/${_pkgname}"
#   _get_tag
#   git reset --hard "${_tag}"
# }

pkgver() {
  cd "${srcdir}/${_pkgname}"
  _get_tag
  # Example: v2.1.0-beta-3  ->  2.1.0.beta.r3
  # Version specification: https://github.com/robert7/nixnote2/issues/28
  # echo "$_tag" | sed -E 's/^v//;s/-?([0-9]+)$/.r\1/;s/-/./'
  echo "${_tag}" | sed 's/^v//;s/-/./g'
}

build() {
    rm -rf "${srcdir}/.go/src"
    mkdir -p "${srcdir}/.go/src/github.com/d2r2"
    # export GOPATH="${srcdir}/.go"
    mv "${srcdir}/${_pkgname}" "${srcdir}/.go/src/github.com/d2r2/"
    cd "${srcdir}/.go/src/github.com/d2r2/${_pkgname}/"
    _get_tag
    # echo "Tag ${_tag}"
    GOPATH="${srcdir}/.go" go get -v -u ./... && \
        git reset --hard "${_tag}" && \
        GOPATH="${srcdir}/.go" ./gorsync_build.sh --buildtype Release
}

package() {
    _binname="gorsync"
    # echo "Working dir $(pwd)"
    # echo "Srcdir dir ${srcdir}"
    cd "${srcdir}/.go/src/github.com/d2r2/${_pkgname}"
    install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
    _appsharedir="${pkgdir}/usr/share/applications"
    mkdir -p "${_appsharedir}" && \
      echo "$(_get_desktop_entry_file)" > "${_appsharedir}/gorsync.desktop" && \
      chmod 644 "${_appsharedir}/gorsync.desktop"
    install -Dm644 "ui/gtkui/gsettings/org.d2r2.gorsync.gschema.xml" "$pkgdir/gsettings/org.d2r2.gorsync.gschema.xml"
    # install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

