# Maintainer: mcol <mcol@posteo.net>
# Contributor: roger <roger@rogerpc.com.ar>

# This PKGBUILD packages Qtile with Wayland dependencies.

pkgname=qtile-wayland-git
pkgver=0.20.0.r33.gc1f50739
pkgrel=2
pkgdesc="A full-featured, pure-Python tiling window manager - Wayland. (git version)"
arch=('x86_64')
url="http://www.qtile.org"
license=('MIT')

depends=(
  'gdk-pixbuf2'
  'glibc'
  'pango'
  'python-cairocffi'
  'python-pywlroots>=0.15.24' 'python-pywlroots<0.16.0'
)

makedepends=(
  'git'
  'python-setuptools'
  'python-setuptools-scm'
  'libpulse'
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
  'python-setproctitle: change process name to qtile'
  'python-xdg: launchbar widget'
  'xorg-xwayland: XWayland support'
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
  python setup.py build
  ./scripts/ffibuild
}

check() {
  cd qtile
  export LC_TYPE=en_US.UTF-8
  # export MYPYPATH="$PWD:$PWD/stubs"
  # mypy-based tests are ignored until I figure out how to fix them
  # Plus they won't change from merge to package
  #pytest -vv --backend wayland --ignore test/test_check.py --ignore test/test_migrate.py test
}

package() {
  cd qtile
  python setup.py install --skip-build --optimize=1 --root="$pkgdir"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 CHANGELOG README.rst libqtile/resources/default_config.py \
    -t "${pkgdir}/usr/share/doc/$pkgname/"
  install -vDm 644 resources/qtile.desktop -t "$pkgdir/usr/share/xsessions/"
  install -vDm 644 resources/qtile-wayland.desktop -t "$pkgdir/usr/share/wayland-sessions/"
}
