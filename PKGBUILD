# Maintainer:

# options - defaults
if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_reduce_size:=false}
: ${_pkgver:=1.7.4747}

# first letter, lowercase
for i in _autoupdate _reduce_size ; do
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
pkgver=1.7.4747
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
    _url="https://cdn-mirror.chaotic.cx/chaotic-aur/$CARCH"
    _dl_url="$_url/$_filename"

    source+=("$_filename"::"$_dl_url")
    sha256sums+=('SKIP')

    pkgver() {
      printf "%s.%s" \
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
    _appimage="pcsx2-v$_pkgver-linux-AppImage-64bit-Qt.AppImage"

    _pkgver_test="${_pkgver##*.}"
    case "$_pkgver_test" in
      4712|4713)
        _appimage="pcsx2-v$_pkgver-linux-appimage-x64.AppImage"
        ;;
      *)
        if [ "$_pkgver_test" -ge 4714 ] ; then
          _appimage="pcsx2-v$_pkgver-linux-appimage-x64-Qt.AppImage"
        fi
        ;;
    esac

    source+=("$_url/releases/download/v$_pkgver/$_appimage")
    sha256sums+=('SKIP')

    # update _pkgver
    sed -Ei "s@^(\s*: \\\$\{_pkgver):=[0-9]+.*\}\$@\1:=$_pkgver}@" "$startdir/PKGBUILD"

    case "$_reduce_size" in
      't'|'y'|'1')
        source+=('rm_libs')
        sha256sums+=('cd188fa79052d175d17fa3ae2d02e34676f949aca8a3cdc253ac46947e45f624')
      ;;
    esac

    pkgver() {
      case "$_reduce_size" in
        't'|'y'|'1')
          printf "%s.%s" \
            "$_pkgver" \
            "small"
          ;;
        *)
          printf "%s" \
            "$_pkgver"
          ;;
      esac
    }

    build() {
      # extract appimage
      chmod +x "$_appimage"
      "./$_appimage" --appimage-extract

      # update script
      sed -Ei 's@APPDIR=\$\(dirname "\$0"\)@APPDIR=/opt/pcsx2@' "$srcdir/squashfs-root/AppRun"
    }

    package() {
      install -Dm755 "$srcdir/squashfs-root/AppRun" "$pkgdir/usr/bin/pcsx2-qt"

      install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/squashfs-root/PCSX2.desktop"

      install -Dm644 -t "$pkgdir/usr/share/pixmaps" "$srcdir/squashfs-root/PCSX2.png"

      mkdir -p "$pkgdir/opt"
      mv "$srcdir/squashfs-root" "$pkgdir/opt/pcsx2"

      # reduce size
      case "$_reduce_size" in
        't'|'y'|'1')
          xargs -i rm -rf "$pkgdir/opt/pcsx2/usr/lib/{}" < rm_libs
          hardlink -fmp "$pkgdir"
          ;;
      esac
    }
    ;;
esac
