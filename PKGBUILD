# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=elos
pkgver=1.27.20
pkgrel=1
pkgdesc="An event logging system"
arch=('x86_64')
url="https://github.com/Elektrobit/elos"
license=('MIT')
depends=('glibc' 'safu' 'samconf' 'libmnl' 'sqlite' 'json-c')
makedepends=('cmake' 'jq' 'git')
install='elos.install'

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
backup=('etc/elos/elosd.json')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cmake -B build \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DENABLE_GIT_VERSION=on \
	-DELOS_BUILD_DEFAULTS=off \
	-DELOS_DAEMON=on \
	-DELOS_COMMON=on \
	-DELOS_LIBRARY=on \
	-DELOS_PLUGINS=on \
	-DELOS_PLUGIN_LIBRARY=on \
	-DELOSD_EVENTLOGGING_BACKEND_SQL=on \
	-DELOS_TOOLS=on \
    -DELOSD_SYSTEMD=on \
	.
  make -C build
}

_editConfig() {
  _CONFIG=$(jq "$1" "$pkgdir/etc/elos/elosd.json")
  echo "${_CONFIG}" > "$pkgdir/etc/elos/elosd.json"
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install

  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  mv "$pkgdir/usr/etc/elos/elosd.json" "$pkgdir/etc/elos/"

  # Default log level is Debug , reduce verbosity
  _editConfig '.root.elos.LogLevel = "ERROR"'

  # Don't need a to expose events on a public interface
  _editConfig 'del(.root.elos.ClientInputs.Plugins.PublicTcpClient)'

  # Ensure elosd unix socket is in /run/
  _editConfig '.root.elos.ClientInputs.Plugins.unixClient.Config.path = "/run/elosd/elosd.socket"'

  # Don't need DLT storage backend
  _editConfig 'del(.root.elos.EventLogging.Plugins.DLT)'

  # log everything with json backend
  _editConfig '.root.elos.EventLogging.Plugins.JsonBackend.Filter = ["1 1 EQ"]'

  # Set log storage path
  _editConfig '.root.elos.EventLogging.Plugins.JsonBackend.Config.StoragePath = "/var/log/elos/elos.json"'
  _editConfig '.root.elos.EventLogging.Plugins.JsonBackend.Config.MaxSize = 1000000000'


  # set default syslog mapping rule
  _editConfig '.root.elos.Scanner.Plugins.SyslogScanner.Config.MappingRules.MessageCodes = {"1003":"1 1 EQ"}'

  # hook up with systemd's journald as syslog service
  _editConfig 'del(.root.elos.Scanner.Plugins.SyslogScanner.Config.SyslogPath)'
  _editConfig '.root.elos.Scanner.Plugins.SyslogScanner.Config.UseSystemdSocket = false'
}
sha256sums=('6063b77d55ef558638b6df7eccd593aa3f2d0aebb0ce20d4acb16959cce99019')
