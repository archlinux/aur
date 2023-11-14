# Maintainer: Patrik Sundberg <patrik.sundberg@gmail.com>

## options
: ${_autoupdate:=true}
: ${_pkgver:=3.85.17}

: ${_test:=false}

: ${_pkgtype:=latest-bin}

# basic info
_pkgname='beeper'
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=3.85.17
pkgrel=1
pkgdesc="all your chats in one app"
arch=('x86_64')
url="https://beeper.com/"
license=('custom')

# main package
_main_package() {
  _update_version

  provides=("$_pkgname")
  conflicts=("$_pkgname")

  options=('!strip')

  source+=("$_filename"::"$_dl_url")
  sha256sums+=('SKIP')

  if [[ x"${_test::1}" == "xt" ]] ; then
    source+=("beeper.sh")
    sha256sums+=('SKIP')
  fi
}

# common functions
pkgver() {
  printf '%s' "${_pkgver:?}"
}

build() {
  cd "${srcdir:?}"

  # extract appimage
  chmod +x "$_filename"
  "${srcdir:?}/$_filename" --appimage-extract

  # fix permissions
  chmod -R u+rwX,go+rX,go-w "${srcdir:?}/squashfs-root"

  # fix apprun script
  sed -Ei \
    's@^(if \[ -z \"\$APPDIR\" ] ; then)$@APPDIR="/opt/beeper"\n\1@' \
    "${srcdir:?}/squashfs-root/AppRun"

  # fix desktop file
  sed -Ei \
    's@^Exec=AppRun (.*)$@Exec=beeper \1@' \
    "${srcdir:?}/squashfs-root/beeper.desktop"
}

_package_beeper() {
  # apprun script
  install -Dm755 "${srcdir:?}/squashfs-root/AppRun" "${pkgdir:?}/usr/bin/beeper"

  # everything else
  install -dm755 "${pkgdir:?}/opt"
  mv "${srcdir:?}/squashfs-root" "${pkgdir:?}/opt/beeper"
}

_package_test() {
  # script
  install -Dm755 "${srcdir:?}/beeper.sh" -t "${pkgdir:?}/opt/beeper/"

  # symlink
  install -dm755 "${pkgdir:?}/usr/bin"
  ln -sf "/opt/beeper/beeper.sh" "${pkgdir:?}/usr/bin/beeper"

  # app.asar
  install -dm755 "${pkgdir:?}/opt/beeper/resources"
  mv "${srcdir:?}/squashfs-root/resources"/* "${pkgdir:?}/opt/beeper/resources/"
}

package() {
  depends+=('hicolor-icon-theme')

  # desktop file
  install -Dm644 "${srcdir:?}/squashfs-root/beeper.desktop"                                  "${pkgdir:?}/usr/share/applications/beeper.desktop"

  # icons
  for s in 16 32 48 64 128 256 512 1024 ; do
    install -Dm644 \
    "${srcdir:?}/squashfs-root/usr/share/icons/hicolor/${s}x${s}/apps/beeper.png" \
    -t "${pkgdir:?}/usr/share/icons/hicolor/${s}x${s}/apps"
  done

  # license files
  install -Dm644 "${srcdir:?}/squashfs-root/LICENSE.electron.txt" -t "${pkgdir:?}/usr/share/licenses/$pkgname"
  install -Dm644 "${srcdir:?}/squashfs-root/LICENSES.chromium.html" -t "${pkgdir:?}/usr/share/licenses/$pkgname"

  if [[ x"${_test::1}" == "xt" ]] ; then
    depends+=('electron')
    _package_test
  else
    _package_beeper
  fi
}

# update version
_update_version() {
  case "${_autoupdate::1}" in
    't'|'y'|'1')
      _dl_url="https://download.beeper.com/linux/appImage/x64"

      _filename=$(
        curl -v --no-progress-meter -r 0-1 "$_dl_url" 2>&1 >/dev/null \
          | grep content-disposition \
          | sed -E 's@^.*\bcontent-disposition:.*\bfilename="([^"]+)".*$@\1@'
      )

      _pkgver_new=$(
        printf '%s' "$_filename" \
          | sed -E 's@^beeper-([0-9]+\.[0-9]+\.[0-9]+)(-.*)?.AppImage$@\1@'
      )

      # update _pkgver
      if [ x"$_pkgver" != x"${_pkgver_new:?}" ] ; then
        _pkgver="$_pkgver_new"
        sed -Ei "s@^(\s*: \\\$\{_pkgver):=.*\}\$@\1:=${_pkgver:?}}@" "$startdir/PKGBUILD"
      fi
      ;;
  esac
}

# execute
_main_package
