# Maintainer: Olaf Wriggers <olaf@olwig.xyz>

pkgname=tuxedo-power-profiles-adapter-git
_pkgname=${pkgname%-git}
pkgver=r1.9d184f2
pkgrel=1
pkgdesc='DBus adapter enabling desktop environments to control TUXEDO power profiles via the freedesktop power-profiles dbus interface'
arch=('x86_64')
url="https://github.com/olwig/tuxedo-power-profiles-adapter"
license=('MIT')

depends=(
  python-dbus-next
  python-toml
  tuxedo-control-center
)

makedepends=('git')

provides=("$_pkgname" 'power-profiles-daemon')
conflicts=("$_pkgname" 'power-profiles-daemon')

backup=("etc/$_pkgname/config.toml")
install=pkg.install

# TODO: add polkit support for passwordless profile switching

_ppd_name=power-profiles-daemon
_ppd_ver=0.30
_ppd="${_ppd_name}-${_ppd_ver}"

_dbus_name=org.freedesktop.UPower.PowerProfiles
_dbus_iface="$_dbus_name"

source=(
  "git+https://github.com/olwig/tuxedo-power-profiles-adapter.git#branch=main"
  "https://gitlab.freedesktop.org/upower/power-profiles-daemon/-/archive/${_ppd_ver}/${_ppd}.tar.bz2"
)

sha256sums=(
  'SKIP'
  '528ee5b8ca0a27d8d66128ebf850e23be9571dc130cf2a82dd2463dac7d3a92f'
)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir"

  # used templates from power-profiles-daemon
  # https://gitlab.freedesktop.org/upower/power-profiles-daemon

  cp "$_ppd/data/power-profiles-daemon.dbus.conf.in" dbus.conf
  sed -i "s/@dbus_name@/${_dbus_name}/g" dbus.conf
  sed -i "s/@dbus_iface@/${_dbus_iface}/g" dbus.conf

  cp "$_ppd/data/power-profiles-daemon.dbus.service.in" dbus.service
  sed -i "s/@dbus_name@/${_dbus_name}/g" dbus.service
  sed -i "s/power-profiles-daemon\.service/${_pkgname}.service/g" dbus.service

  # TODO: remove unused actions once upstream actually uses polkit
  cp "$_ppd/data/power-profiles-daemon.policy" polkit.policy
  sed -i \
    -e "s|<vendor>power-profiles-daemon</vendor>|<vendor>${_pkgname}</vendor>|" \
    -e "s|<vendor_url>https://gitlab.freedesktop.org/hadess/power-profiles-daemon</vendor_url>|<vendor_url>${url}</vendor_url>|" \
    "$srcdir/polkit.policy"

  _conflicts_line="$(grep -m1 '^Conflicts=' "$_ppd/data/power-profiles-daemon.service.in" || true)"

  cat > "$srcdir/systemd.service" <<EOF
[Unit]
Description=Tuxedo power profiles dbus adapter
${_conflicts_line} ${_ppd_name}.service

[Service]
Type=dbus
BusName=$_dbus_name
ExecStart=/usr/bin/$_pkgname
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
}

package() {
  install -Dm755 "$_pkgname/adapter.py" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname/config.toml" "$pkgdir/etc/$_pkgname/config.toml"

  install -Dm644 systemd.service "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 polkit.policy "$pkgdir/usr/share/polkit-1/actions/${_pkgname}.policy"
  install -Dm644 dbus.conf "$pkgdir/usr/share/dbus-1/system.d/${_dbus_name}.conf"
  install -Dm644 dbus.service "$pkgdir/usr/share/dbus-1/system-services/${_dbus_name}.service"
}
