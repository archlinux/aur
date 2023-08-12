# Maintainer: mcol <mcol@posteo.net>
# Contributor: roger <roger@rogerpc.com.ar>

# This PKGBUILD packages Qtile with X11 dependencies.

pkgname=qtile-git
pkgver=0.22.1.r215.g142dc80a
pkgrel=1
pkgdesc="A full-featured, pure-Python tiling window manager - X11. (git version)"
arch=('x86_64')
url="http://www.qtile.org"
license=('MIT')

depends=(
  'gdk-pixbuf2'
  'glibc'
  'pango'
  'python-cairocffi'
  'python-cffi'
  'python-xcffib'
)

makedepends=(
  'git'
  'python-setuptools'
  'python-setuptools-scm'
  'libpulse'
  'python-installer'
  'python-build'
  'python-wheel'
)
checkdepends=(
  'dbus'
  'graphviz'
  'gtk3'
  'imagemagick'
  'libnotify'
  'librsvg'
  'mypy'
  'python-bowler'
  'python-dbus-next'
  'python-gobject'
  'python-pytest'
  'python-xdg'
  'python-xvfbwrapper'
  'xorg-server-xephyr'
  'xorg-xrandr'
)
optdepends=(
  'alsa-utils: volume widget'
  'canto-daemon: canto widget'
  'cmus: cmus widget'
  'jupyter_console: interaction with qtile via Jupyter'
  'khal: khal_calendar widget'
  'libpulse: for pulse_volume and pulseaudio_ffi widget'
  'librsvg: for SVG support in some widgets widgets or wallpapers'
  'lm_sensors: sensors widget'
  'moc: moc widget'
  'python-dbus-next: for utils, notifications and several widgets'
  'python-iwlib: wlan widget'
  'python-keyring: imapwidget widget'
  'python-mpd2: mpd2widget widget'
  'python-psutil: graph, net and memory widget'
  'python-pywlroots: Wayland backend'
  'xorg-xwayland: Wayland backend'
  'python-setproctitle: change process name to qtile'
  'python-xdg: launchbar widget'
)
provides=('qtile')
conflicts=('qtile')
install=${pkgname}.install
source=('git+https://github.com/qtile/qtile')
md5sums=('SKIP')

pkgver() {
  cd qtile
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd qtile
  python -m build --no-isolation --wheel
  ./scripts/ffibuild
}

check() {
  cd qtile
  # export LC_TYPE=en_US.UTF-8
  # export MYPYPATH="$PWD:$PWD/stubs"
  # mypy-based tests are ignored until I figure out how to fix them
  # Plus they won't change from merge to package
  #pytest -vv --backend x11 --ignore test/test_check.py --ignore test/test_migrate.py test
}

package() {
  cd qtile
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 CHANGELOG README.rst libqtile/resources/default_config.py \
    -t "${pkgdir}/usr/share/doc/$pkgname/"
  install -vDm 644 resources/qtile.desktop -t "$pkgdir/usr/share/xsessions/"
  install -vDm 644 resources/qtile-wayland.desktop -t "$pkgdir/usr/share/wayland-sessions/"
}
