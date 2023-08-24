# Maintainer:

# options - defaults
if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=6.7.10}

# update version
case "${_autoupdate::1}" in
  't'|'y'|'1')
    _dl_url=$(
      curl -v --no-progress-meter -r 0-1 "https://www.motivewave.com/update/download.do?file_type=LINUX" 2>&1 >/dev/null \
        | grep location \
        | sed -E 's@^.*\blocation:.*\b(https:.*\.deb).*$@\1@'
    )

    _regex='motivewave_([0-9]+\.[0-9]+\.[0-9]+)_amd64\.deb'

    _filename=$(
      printf '%s' "$_dl_url" \
        | sed -E 's@^.*/('"$_regex"')$@\1@'
    )

    _pkgver_new=$(
      printf '%s' "$_filename" \
        | sed -E 's@^'"$_regex"'$@\1@'
    )

    # update _pkgver
    if [ x"$_pkgver" != x"$_pkgver_new" ] ; then
      _pkgver="$_pkgver_new"
      sed -Ei "s@^(\s*: \\\$\{_pkgver):=[0-9]+.*\}\$@\1:=$_pkgver}@" "$startdir/PKGBUILD"
    fi

    pkgver() {
      printf '%s' "$_pkgver"
    }
    ;;
esac

_pkgname=motivewave
pkgname="$_pkgname-latest-bin"
pkgver=6.7.10
pkgrel=1
pkgdesc="Advanced trading and charting application."
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')

depends=('bc' 'ffmpeg' 'gtk2' 'gtk3' 'java-runtime' 'xorg-xrandr')

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
  "$_filename"::"$_dl_url"
)
sha256sums=(
  'SKIP'
)

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  # fix permissions
  find "$pkgdir" -exec chmod g-w {} +
  chown -R root:root "$pkgdir"

  # symlink script
  mkdir -pv "$pkgdir/usr/bin"
  ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"

  # install license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/motivewave/license.html"
}
