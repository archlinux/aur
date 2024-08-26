# Maintainer: Wolfgang Gehrhardt <gehwolf at freenet dot de>

pkgname=elos
pkgver=0.61.4
pkgrel=2
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
	-DINSTALL_UNIT_TESTS=off \
	-DELOS_DAEMON=on \
	-DELOS_TOOLS=on \
	-DELOS_PLUGINS=on \
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
  _editConfig 'del(.root.elos.Scanner.PluginSearchPath)'
  _editConfig 'del(.root.elos.Scanner.Path)'

  # Don't need demo dummy storage backend
  _editConfig 'del(.root.elos.EventLogging.Plugins.Dummy)'

  # Don't need DLT storage backend
  _editConfig 'del(.root.elos.EventLogging.Plugins.DLT)'

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

  # install smoke tests
  _ELOS_TEST_DIR="/usr/lib/elos/tests"
  install -d "$pkgdir/${_ELOS_TEST_DIR}"
  install -Dm755 'test/smoketest/smoketest.sh' "$pkgdir/${_ELOS_TEST_DIR}/"
  install -Dm644 'test/smoketest/smoketest_log.sh' "$pkgdir/${_ELOS_TEST_DIR}/"

  # configure tests
  echo "
export SMOKETEST_DIR=\"${_ELOS_TEST_DIR}\"
export SMOKETEST_RESULT_DIR=\"/tmp/elos_tests\"
export SMOKETEST_TMP_DIR=\"/tmp/elos\"

export SMOKETEST_ENABLE_COMPILE_TEST=\"true\"
export ENABLED_TESTS=\"publish_poll, find_event\"

export ELOS_SYSLOG_PATH=\"/run/elos/dev-log\"
export ELOS_CONFIG_PATH=\"/etc/elos/elosd.json\"
  " > "$pkgdir/${_ELOS_TEST_DIR}/smoketest_env.sh"

  # fix elosd port in smoke test as the port is partially hard coded
  sed -i 's,54323,54321,g' "$pkgdir/${_ELOS_TEST_DIR}/smoketest.sh"
}
sha256sums=('b64fe7d241e3358c85ca0a3d968292d667327874fddc9b36bffa623b13aa9124')
