# Maintainer: NJ Verenini <nverenin@gmail.com>
#
# The AUR package, kept here so it is versioned with what it packages. The
# shape and the dependency argument are in docs/packaging.md; spec 007 is why
# each line below is the line it is.
#
# One PKGBUILD, two packages: `hotaru` is the CLI and the service, pure Go and
# installable on a headless box; `hotaru-gui` is the Fyne window, which needs
# the graphics stack. The split falls out of the architecture -- the window is
# a client -- and it keeps OpenGL off machines that only want lighting.

pkgbase=hotaru
pkgname=(hotaru hotaru-gui)
pkgver=0.1.3
pkgrel=2
pkgdesc='RGB lighting and AIO cooler control for Linux'
arch=('x86_64')
url='https://github.com/ushineko/hotaru'
license=('MIT')
makedepends=('go' 'libglvnd' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama'
             'libxi' 'libxxf86vm' 'libxkbcommon' 'wayland')

# The base's dependencies, which each package narrows. namcap wants a split
# PKGBUILD to declare at the top what its packages depend on, and it is right
# to: this is the answer to "what does installing hotaru pull in", and reading
# it should not mean reading two shell functions.
depends=('glibc' 'openrgb')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('066b0df5908be92be93ab53108f0be8fcfcfa5d5d15157d7870ba923d451e265')

_module='github.com/ushineko/hotaru'

prepare() {
  cd "$pkgbase-$pkgver"
  go mod download
}

build() {
  cd "$pkgbase-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}" CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}" CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  local _ldflags="-linkmode=external -X ${_module}/internal/version.Version=${pkgver}"

  go build -ldflags "$_ldflags" -o build/hotaru ./cmd/hotaru

  # The window, built without Fyne's per-refresh thread check. It calls
  # runtime.Stack on every canvas refresh to find out which goroutine it is
  # on, which a CPU profile put at 82% of samples during a window drag. The
  # tag is safe here because internal/gui/thread_test.go fails the build if
  # anything inside a Perform callback touches the interface unwrapped, and
  # check() runs it.
  go build -tags migrated_fynedo -ldflags "$_ldflags" -o build/hotaru-gui ./cmd/hotaru-gui
}

check() {
  cd "$pkgbase-$pkgver"
  # No hardware, no OpenRGB, no display and no root. That is a packaging
  # property as much as a testing one.
  go test ./...
}

package_hotaru() {
  # namcap reports openrgb as possibly unneeded, because nothing in the
  # binary links against it. Nothing would: it is a daemon hotaru speaks to
  # over a socket, and it is a hard dependency on purpose -- see
  # docs/packaging.md, "The rule that decides everything else".
  optdepends=('nvidia-utils: GPU temperature on the dashboard'
              'hotaru-gui: the desktop window')

  cd "$pkgbase-$pkgver"

  install -Dm755 build/hotaru "$pkgdir/usr/bin/hotaru"

  # Not enabled, per Arch policy. `systemctl --user enable --now hotaru`, and
  # `loginctl enable-linger $USER` for lighting at boot rather than at login;
  # `hotaru light health` names whichever one is missing.
  install -Dm644 packaging/hotaru.service \
    "$pkgdir/usr/lib/systemd/user/hotaru.service"

  # Without this the service sees the cooler and cannot open it. See
  # packaging/60-hotaru.rules.
  install -Dm644 packaging/60-hotaru.rules \
    "$pkgdir/usr/lib/udev/rules.d/60-hotaru.rules"

  # Examples, not configuration: hotaru ships no rules at all and drives every
  # device OpenRGB reports until it is told otherwise.
  install -Dm644 examples/hotaru.yml \
    "$pkgdir/usr/share/doc/$pkgname/hotaru.yml.example"
  install -Dm644 packaging/openrgb-enumeration.conf.example \
    "$pkgdir/usr/share/doc/$pkgname/openrgb-enumeration.conf.example"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hotaru-gui() {
  pkgdesc='RGB lighting and AIO cooler control for Linux (desktop window)'
  # The graphics stack is dlopened by GLFW rather than linked, so namcap
  # reports most of this as possibly unneeded. It is needed: a window that
  # cannot open libGL at runtime does not start. hicolor-icon-theme owns the
  # directory this package's icon goes in.
  depends=('hotaru' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11'
           'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libxxf86vm'
           'libxkbcommon' 'wayland')

  cd "$pkgbase-$pkgver"

  install -Dm755 build/hotaru-gui "$pkgdir/usr/bin/hotaru-gui"

  # The entry is named for the Fyne app ID and carries StartupWMClass,
  # because KDE on Wayland resolves the titlebar icon by matching the app_id
  # to a desktop file of that name and the task manager matches the class.
  # Two out of three silently yields a generic icon.
  install -Dm644 packaging/io.github.ushineko.hotaru.desktop \
    "$pkgdir/usr/share/applications/io.github.ushineko.hotaru.desktop"
  install -Dm644 packaging/hotaru.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/hotaru.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
