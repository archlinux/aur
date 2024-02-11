# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=elos
pkgver=0.53.11
pkgrel=1
pkgdesc="An event logging system"
arch=('x86_64')
url="https://github.com/Elektrobit/elos"
license=('MIT')
depends=('glibc' 'safu' 'samconf' 'libmnl' 'sqlite' 'json-c' 'log4c' 'libesmtp')
makedepends=('cmake' 'jq')
install='elos.install'

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
backup=('etc/elos/elosd.json')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  cmake -B build \
	-DCMAKE_BUILD_TYPE=Release \
	-DUNIT_TESTS=off \
	-DINSTALL_UNIT_TESTS=off \
	-DCMAKE_INSTALL_PREFIX=/usr \
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
  install -Dm644 'src/components/config/elosd.json' "$pkgdir/etc/elos/elosd.json"

  # No need to override plugin search path, use compile default /usr/lib/elos/
  _editConfig 'del(.root.elos.ClientInputs.PluginSearchPath)'
  _editConfig 'del(.root.elos.EventLogging.PluginSearchPath)'
  _editConfig 'del(.root.elos.Scanner.Path)'

  # Don't need demo dummy storage backend
  _editConfig 'del(.root.elos.EventLogging.Plugins.Dummy)'

  # log everything with json backend
  _editConfig '.root.elos.EventLogging.Plugins.JsonBackend.Filter = ["1 1 EQ"]'

  # Set log storage path
  _editConfig '.root.elos.EventLogging.Plugins.JsonBackend.Config.StoragePath = "/var/log/elos/elos.json"'

  # Default log level is Debug , reduce verbosity
  _editConfig '.root.elos.LogLevel = "ERROR"'

  # set default syslog mapping rule
  _editConfig '.root.elos.Scanner.SyslogScanner.MappingRules.MessageCodes = {"1003":"1 1 EQ"}'

  # elos currently can't forward syslog messages on the syslog socket, thus
  # don't acquire /dev/log to not conflict with other syslog daemons
  _editConfig '.root.elos.Scanner.SyslogScanner.SyslogPath = "/run/elos/dev-log"'

}
md5sums=('33b0f457b956c24a58fea3ba0bfde392')
