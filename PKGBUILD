# Maintainer: shulhan <ms@kilabit.info>

pkgname=google-cloud-ops-agent-git
pkgver=2.34.0.r34.gfdcfea1a4
pkgrel=1

pkgdesc="Ops Agents that are part of the Google Cloud Operations product suite (specifically Cloud Logging and Cloud Monitoring)"
arch=('x86_64' 'aarch64')
url='https://github.com/GoogleCloudPlatform/ops-agent'
license=('Apache License 2.0')
groups=()

depends=(
	'libyaml'
)
makedepends=(
	'cmake'
	'go'
	'git'
	'java-environment'
	'pkg-config'
	'rsync'
	'unzip'
	'zip'
)
optdepends=()

provides=('google-cloud-ops-agent')
conflicts=('stackdriver-collectd')

backup=()

source=(
	"$pkgname::git+https://github.com/GoogleCloudPlatform/ops-agent.git"
	"fluent-bit::git+https://github.com/fluent/fluent-bit.git"
	"opentelemetry-operations-collector::git+https://github.com/GoogleCloudPlatform/opentelemetry-operations-collector.git"
	"opentelemetry-java-contrib::git+https://github.com/open-telemetry/opentelemetry-java-contrib.git"
	"0001-build-sh.patch"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'ba66d01b8058644597d9b406d3b8ce7ed40aed77c7358f2b97ff0e262a4cbb98'
)

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	git -c protocol.file.allow=always submodule init
	git config submodule."submodules/fluent-bit".url \
		"${srcdir}/fluent-bit"
	git config submodule."submodules/opentelemetry-operations-collector".url \
		"${srcdir}/opentelemetry-operations-collector"
	git config submodule."submodules/opentelemetry-java-contrib".url \
		"${srcdir}/opentelemetry-java-contrib"
	git -c protocol.file.allow=always submodule update

	rm -rf ${srcdir}/google-cloud-ops-agent-git/submodules/opentelemetry-java-contrib/META-INF
}

build() {
	_destdir="$srcdir/../staging"
	mkdir -p "$_destdir"
	echo "destdir: $_destdir"

	cd "${pkgname}"
	git apply "${srcdir}/0001-build-sh.patch"

	CGO_ENABLED=1 ./builds/otel.sh "$_destdir"
	./builds/fluent_bit.sh "$_destdir"
	./builds/systemd.sh "$_destdir"
	./builds/ops_agent_diagnostics.sh "$_destdir"
	./builds/agent_wrapper.sh "$_destdir"

	BUILD_DISTRO=arch CODE_VERSION="${pkgver}" DESTDIR="$_destdir" \
		./build.sh
}

package() {
	_destdir="$srcdir/../staging"

	cd "${pkgname}"
	rsync -ar "${_destdir}/" "${pkgdir}/"
	rm -rf ${pkgdir}/lib
	chown -R root:root ${pkgdir}/
}
