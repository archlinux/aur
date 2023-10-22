# Maintainer: VienC
# Forked from thorium-browser-bin
# options - defaults
if [ -z "$_pkgver" ] ; then
  : ${_autoupdate:=true}
else
  : ${_autoupdate:=false}
fi

: ${_pkgver:=117.0.5938.157}


# basic info
_pkgname="thorium-browser"
pkgname="$_pkgname-special-bin"
pkgver=117.0.5938.157
pkgrel=1
pkgdesc="Special builds of Thorium for SSE3 and different processors. "
url="https://github.com/Alex313031/Thorium-SSE3"


# update version
case "${_autoupdate::1}" in
  't'|'y'|'1')
    _response=$(curl "https://api.github.com/repos/Alex313031/Thorium-SSE3/releases" -s)
    _get() {
      printf '%s' "$_response" \
        | awk -F '"' '/"'"$1"'":/{print $4}' \
        | head -1 | sed 's/^M//' | sed 's/-1$//'
    }
    _pkgver_new=$(_get tag_name)

    # update _pkgver
    if [ x"$_pkgver" != x"$_pkgver_new" ] ; then
      _pkgver="$_pkgver_new"
      sed -Ei "s@^(\s*: \\\$\{_pkgver):=[0-9]+.*\}\$@\1:=$_pkgver}@" "$startdir/PKGBUILD"
    fi
    ;;
esac

arch=('x86_64')
license=('BSD 3-Clause')

depends=()
makedepends=()
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: for file dialogs in KDE'
  'gnome-keyring: for storing passwords in GNOME keyring'
  'kwallet: for storing passwords in KWallet'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname" "thorium-browser-bin")
fi

options=('!emptydirs' '!strip')
install="$_pkgname.install"

_dl_url="$url/releases/download/M${_pkgver}"
_dl_filename="${_pkgname}_${_pkgver}_SSE3.deb"

source=(
  "$_dl_url/$_dl_filename"
  "$_pkgname.sh"
)
sha256sums=(
  '898e71433f8f655520be9336414e2c1475a11c5b4acea33fa4c49f7c8c1e2b49'
  'SKIP'
)

pkgver() {
  printf '%s' \
    "$_pkgver"
}

package() {
  depends+=(
    'alsa-lib'
    'gtk3'
    'libcups'
    'libxss'
    'libxtst'
    'nss'
    'ttf-liberation'
    'xdg-utils'
  )

  echo "  -> Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  echo "  -> Moving stuff in place..."
  # Launcher
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  chmod 4755 "$pkgdir/opt/chromium.org/thorium/chrome-sandbox"

  # Icons
  for i in 16 24 32 48 64 128 256; do
    install -Dm644 "$pkgdir/opt/chromium.org/thorium/product_logo_${i}.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/thorium-browser.png"
  done

  install -Dm644 "$pkgdir/opt/chromium.org/thorium/thorium_shell.png" \
    -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"

  echo "  -> Removing Debian Cron job, duplicate product logos and menu directory..."
  rm -r -- \
    "$pkgdir/etc/cron.daily/" \
    "$pkgdir/opt/chromium.org/thorium/cron/" \
    "$pkgdir/opt/chromium.org/thorium"/product_logo_*.{png,xpm} \
    "$pkgdir/usr/share/menu/"
}
