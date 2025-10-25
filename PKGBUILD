# Maintainer:
# Contributor: mcol <mcol@posteo.net>
# Contributor: roger <roger@rogerpc.com.ar>

## links
# http://www.qtile.org
# https://github.com/qtile/qtile

## options
: ${_wlrver=0.19}

_pkgname="qtile"
pkgname="$_pkgname-git"
pkgver=0.33.0.r282.gc3d4510
pkgrel=1
pkgdesc="A full-featured, pure-Python tiling window manager"
url="https://github.com/qtile/qtile"
license=('MIT')
arch=('x86_64')

depends=(
  gdk-pixbuf2
  libnotify
  librsvg
  pango
  python
  python-cairocffi
  python-cffi
  python-gobject
  python-isort
  python-xcffib
)
makedepends=(
  git
  libpulse
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
  "wlroots${_wlrver:?}"
  wayland
  wayland-protocols
  xorg-xwayland
)
checkdepends=(
  graphviz
  gtk3
  imagemagick
  lm_sensors
  procps-ng
  python-anyio
  python-bowler
  python-dbus-fast
  python-gobject
  python-isort
  python-libcst
  python-pytest
  python-pytest-xdist
  python-xdg
  xorg-server-xephyr
  xorg-server-xvfb
  xorg-xrandr
  xorg-xwayland
  xterm
)
optdepends=(
  'alsa-utils: for volume widget'
  'canto-daemon: for canto widget'
  'cmus: for cmus widget'
  'jupyter_console: for interaction with qtile via Jupyter'
  'khal: for khal_calendar widget'
  'libinput: for Wayland backend'
  'libpulse: for pulse_volume and pulseaudio_ffi widget'
  'lm_sensors: for sensors widget'
  'moc: for moc widget'
  'python-bowler: for migrating configuration files'
  'python-dbus-fast: for utils, notifications and several widgets'
  'python-iwlib: for wlan widget'
  'python-keyring: for imapwidget widget'
  'python-libcst: for migrations'
  'python-mpd2: mpd2widget widget'
  'python-psutil: graph, net and memory widget'
  'python-setproctitle: change process name to qtile'
  'python-xdg: launchbar widget'
  'xorg-xwayland: for XWayland support'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() (
  export CFLAGS="$CFLAGS -I/usr/include/wlroots-${_wlrver}"
  export LDFLAGS="$LDFLAGS -L/usr/lib/wlroots-${_wlrver}"

  cd "$_pkgsrc"
  PYTHONPATH="$PWD" python "./libqtile/backend/wayland/cffi/build.py"
  python -m build --no-isolation --wheel
)

check() (
  local pytest_options=(
    -vv
    --backend x11
    --backend wayland
    ## disable failing tests
    #--deselect "test/backend/x11/test_window.py::test_urgent_hook_fire[wayland-2]"
    #--deselect "test/widgets/test_clock.py::test_clock_datetime_timezone"
    #--deselect "test/widgets/test_clock.py::test_clock_pytz_timezone"
    #--deselect "test/widgets/test_clock.py::test_clock_dateutil_timezone"
    #--deselect "test/widgets/test_clock.py::test_clock_change_timezones"
  )

  cd "$_pkgsrc"

  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export LC_TYPE=en_US.UTF-8
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"

  python -m installer --destdir=test_dir dist/*.whl
  pytest -n $(nproc) "${pytest_options[@]}" || true
)

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 CHANGELOG README.rst libqtile/resources/default_config.py \
    -t "${pkgdir}/usr/share/doc/$pkgname/"
  install -Dm644 resources/qtile.desktop -t "$pkgdir/usr/share/xsessions/"
  install -Dm644 resources/qtile-wayland.desktop -t "$pkgdir/usr/share/wayland-sessions/"
}
