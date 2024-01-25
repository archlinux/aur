# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Solomon Choina (https://aur.archlinux.org/account/SolarAquarion)
# Contributor: ksj
# Contributor: kasa
# Contributor: L42y

pkgbase=network-manager-applet-debug-git
pkgname=(network-manager-applet-debug-git nm-connection-editor-debug-git)
pkgver=1.37.0.dev+1.r4988.20240122.5da28886
pkgrel=1
pkgdesc="A system tray applet for NetworkManager. Debug build, latest git checkout."
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
makedepends=(
  meson
  libsecret
  libnotify
  gtk3
  libnm
  libnma
  libmm-glib
  gtk-doc
  libmm-glib
  gobject-introspection
  git
  libayatana-appindicator
  gcr
  iso-codes
  mobile-broadband-provider-info
)
options+=('emptydirs' 'debug' '!strip' '!lto')
source=(git+https://gitlab.gnome.org/GNOME/network-manager-applet.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/network-manager-applet/

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' -e 's|-dev|.dev|' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi

}

build() {

  meson setup --prefix /usr --libexecdir lib --sbindir bin --buildtype debug --debug --auto-features enabled --wrap-mode nodownload network-manager-applet build \
    -Db_pie=false \
    -Dpython.bytecompile=1 \
    -Dld_gc=true \
    -Dteam=true \
    -Dwwan=true \
    -Dappindicator=yes \
    -Dmore_asserts=no \
    -Dselinux=false \
    -Db_lto=false

  ninja -C build
}

check() {
  ninja -C build test
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_network-manager-applet-debug-git() {
  provides=(
    "network-manager-applet=${pkgver}"
    "network-manager-applet-debug=${pkgver}"
    "network-manager-applet-git=${pkgver}"
  )
  conflicts=(
    network-manager-applet
    network-manager-applet-debug
    network-manager-applet-git-debug
  )
  replaces=(network-manager-applet)
  depends=(
    "at-spi2-core"
    "cairo"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk3"
    "hicolor-icon-theme"
    "dconf"
    nm-connection-editor
    libnm
    "libnma"
    libmm-glib
    libnotify
    libsecret
    libayatana-appindicator
    "pango"
  )

  DESTDIR="$pkgdir" ninja -C build install

      ### Split nm-connection-editor
     _pick nm-connection-editor "$pkgdir"/usr/bin/nm-connection-editor
     _pick nm-connection-editor "$pkgdir"/usr/share/applications/nm-connection-editor.desktop
     _pick nm-connection-editor "$pkgdir"/usr/share/icons/hicolor/22x22/apps/nm-device-wwan.png
     _pick nm-connection-editor "$pkgdir"/usr/share/locale
     _pick nm-connection-editor "$pkgdir"/usr/share/man/man1/nm-connection-editor.1
     _pick nm-connection-editor "$pkgdir"/usr/share/metainfo
}

package_nm-connection-editor-debug-git() {
  pkgdesc="NetworkManager GUI connection editor and widgets"
  provides=(
    "nm-connection-editor=${pkgver}"
    "nm-connection-editor-debug=${pkgver}"
    "nm-connection-editor-git=${pkgver}"
  )
  depends=(
    "gcc-libs"
    "glib2"
    "glibc"
    "gtk3"
    "hicolor-icon-theme"
    "jansson"
    "libnm"
    "libnma"
  )
  conflicts=(
    nm-connection-editor
    nm-connection-editor-debug
    nm-connection-editor-git-debug
  )
  replaces=(nm-connection-editor)
   mv nm-connection-editor/* "$pkgdir"
}
