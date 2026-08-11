_pkgname=singularity-desktop
pkgname="$_pkgname-git"
pkgver=0.1.0.r205.gf407e8d
pkgrel=1
pkgdesc='The Singularity Desktop Environment'
arch=('x86_64' 'aarch64')
url='https://github.com/singularityos-lab/singularity-desktop'
license=('GPL-3.0-or-later')

depends=(
  at-spi2-core
  cairo
  fontconfig
  gdk-pixbuf2
  glib2
  gnome-online-accounts
  gstreamer
  gst-plugins-base-libs
  gtk4
  gtk4-layer-shell
  gtksourceview5
  json-glib
  libdrm
  libadwaita
  libdbusmenu-glib
  libgcrypt
  libgee
  libgudev
  libinput
  libnm
  libpeas-2
  libpng
  libpulse
  libsecret
  libsodium
  libsoup3
  librsvg
  libxcrypt
  libxml2
  libxcb
  libxkbcommon
  pango
  pam
  polkit
  poppler-glib
  tinysparql
  upower
  vte4
  wayland
  webkitgtk-6.0
)

makedepends=(
  gettext
  git
  go
  gobject-introspection
  meson
  ninja
  python
  sassc
  scdoc
  vala
  wayland-protocols
)

provides=("$_pkgname=$pkgver")
conflicts=(
  "$_pkgname"
  gnome-keyring
  labwc
)
replaces=(gnome-keyring)

source=(
  "$_pkgname::git+https://github.com/singularityos-lab/singularity-desktop.git"
  'vetro::git+https://github.com/singularityos-lab/vetro.git#commit=0a7bd367676f67e1c15a304ba135fe6fecdbc604'
)

sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 |
      sed 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  else
    printf "0.1.0.r%s.g%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
}

build() {
  mkdir -p "$srcdir/bin" "$srcdir/gopath"

  cd "$srcdir/vetro"
  GOPATH="$srcdir/gopath" go build -trimpath -o "$srcdir/bin/vetro" .

  cd "$srcdir/$_pkgname"

  export PATH="$srcdir/bin:$PATH"

  meson setup build \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nodownload \
    -Dinstaller=false

  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname"

  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/wayland-sessions/singularity.desktop" <<'EOF'
[Desktop Entry]
Name=Singularity
Comment=The Singularity Desktop Environment
Exec=/usr/bin/singularity-labwc-session
TryExec=/usr/bin/singularity-labwc-session
Type=Application
DesktopNames=Singularity
EOF

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
