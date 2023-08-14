# Maintainer:

# options - defaults
if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=1.7.4919}

# first letter, lowercase
for i in _autoupdate ; do
  eval "${i}=\$( printf '%s' \"\${$i::1}\" | sed -e 's/^\(.*\)$/\L\1/' )"
done

# update version
case "$_autoupdate" in
  't'|'y'|'1')
    _get() {
      curl "https://api.github.com/repos/PCSX2/pcsx2/releases" -s \
        | awk -F '"' '/"'"$1"'":/{print $4}' \
        | head -1 | sed 's/^v//'
    }
    _pkgver=$(_get name)
    ;;
  'c')
    # chaotic-aur
    _regex='^pcsx2-git-([0-9]+.+)\.r[0-9]+.*-([0-9]+.*)-(.+)\.pkg\.tar\.zst$'

    _filelist=$(curl "https://builds.garudalinux.org/repos/chaotic-aur/pkgs.files.txt" -s)

    _filename=$(printf '%s' "$_filelist" | grep -E "$_regex")

    _pkgver=$(
      printf '%s' "$_filename" \
        | sed -E "s@$_regex@\1@"
    )
    ;;
esac


# normal pkgbuild stuff
_pkgname='pcsx2'
pkgname="$_pkgname-latest-bin"
pkgver=1.7.4919
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
url="https://github.com/PCSX2/pcsx2"
license=(
  'GPL3'
  'LGPL3'
)
options=(!strip !debug)

depends=()
makedepends=()

provides=("$_pkgname")
conflicts=(${provides[@]})

case "$_autoupdate" in
  'c')
    # chaotic-aur
    _url="http://builds.garudalinux.org/repos/chaotic-aur/$CARCH"
    _dl_url="$_url/$_filename"

    source+=("$_filename"::"$_dl_url")
    sha256sums+=('SKIP')

    pkgver() {
      printf '%s.%s' \
        "$_pkgver" \
        "chaotic"
    }

    package() {
      depends+=(
        alsa-lib
        ffmpeg
        hicolor-icon-theme
        libaio
        libglvnd
        libpcap
        libpng
        libxrandr
        lld
        qt6-base
        qt6-svg
        sdl2
        soundtouch
        wayland
        xcb-util-cursor
      )

      optdepend+=(
        'qt6-wayland: Wayland support'
        'libpulse: Pulseaudio support'
      )

      mv "$srcdir/opt" "$pkgdir"
      mv "$srcdir/usr" "$pkgdir"
    }
    ;;

  *)
    _url="https://github.com/PCSX2/pcsx2"
    _appimage="pcsx2-v$_pkgver-linux-appimage-x64-Qt.AppImage"

    source+=("$_url/releases/download/v$_pkgver/$_appimage")
    sha256sums+=('SKIP')

    # update _pkgver
    sed -Ei "s@^(\s*: \\\$\{_pkgver):=[0-9]+.*\}\$@\1:=$_pkgver}@" "$startdir/PKGBUILD"

    pkgver() {
      printf '%s' \
        "$_pkgver"
    }

    build() {
      # extract appimage
      chmod +x "$_appimage"
      "./$_appimage" --appimage-extract

      (
        # fix desktop file name
        cd "$srcdir/squashfs-root"
        if [ ! -e "PCSX2.desktop" ] ; then
          for i in *.desktop ; do
            mv "$i" PCSX2.desktop
            break
          done
        fi
      )

      # update script
      sed -Ei \
        's@^this_dir=".*\breadlink\b.*\bdirname\b.*"$@this_dir="/opt/pcsx2"@' \
        "$srcdir/squashfs-root/AppRun"
    }

    package() {
      install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/pcsx2-qt"

      install -Dm644 "$srcdir/squashfs-root/PCSX2.desktop" -t "$pkgdir/usr/share/applications"

      install -Dm644 "$srcdir/squashfs-root/PCSX2.png" -t "$pkgdir/usr/share/pixmaps"

      mkdir -p "$pkgdir/opt"
      mv "$srcdir/squashfs-root" "$pkgdir/opt/pcsx2"
    }
    ;;
esac
