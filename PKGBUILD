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
    ;;
  *)
    # build a specific version
    _regex='([0-9]+)\.([0-9]+)\.([0-9]+)'
    _ver_maj=$(printf '%s' "$_pkgver" | sed -E "s@$_regex@\1@")
    _ver_min=$(printf '%s' "$_pkgver" | sed -E "s@$_regex@\2@")
    _ver_pat=$(printf '%s' "$_pkgver" | sed -E "s@$_regex@\3@")

    # tested with versions 6.6.x and 6.7.x
    _build=$((_ver_maj *63 + _ver_min *16 + _ver_pat))

    _filename="motivewave_${_ver_maj}.${_ver_min}.${_ver_pat}_amd64.deb"
    _dl_url="https://downloads.motivewave.com/builds/$_build/$_filename"
    ;;
esac

# upstream md5sum
_etag=$(
  curl -v --no-progress-meter -r 0-1 "$_dl_url" 2>&1 >/dev/null \
    | grep 'etag:' \
    | sed -E 's@^.*\betag:.*"([^"]+)".*$@\1@'
)

_pkgname="motivewave"
pkgname="$_pkgname-latest-bin"
pkgver=6.7.10
pkgrel=3
epoch=1
pkgdesc="Advanced trading and charting application"
arch=('x86_64')
url="https://www.motivewave.com"
license=('custom')

depends=(
  'ffmpeg4.4'
  'gtk2'
  'gtk3'
  'java-runtime'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")
fi

source=("$_filename"::"$_dl_url")
md5sums=("$_etag")

pkgver() {
  printf '%s' "$_pkgver"
}

package() {
  bsdtar --no-same-owner -xf data.tar.xz -C "$pkgdir/"

  # symlink script
  mkdir -pv "$pkgdir/usr/bin"
  ln -sv "/usr/share/motivewave/run.sh" "$pkgdir/usr/bin/motivewave"

  # install license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share/motivewave/license.html"
}
