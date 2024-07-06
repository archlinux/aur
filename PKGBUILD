# Maintainer: shulhan <ms@kilabit.info>

pkgname=google-cloud-ops-agent-git
pkgver=2.48.0.r5.g4b3b7496c
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
	'git'
	'go'
	'gradle'
	'jdk17-openjdk'
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
	"fluent-bit-8901-fix-gcc-14.1.patch"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'ba66d01b8058644597d9b406d3b8ce7ed40aed77c7358f2b97ff0e262a4cbb98'
	'8f986cebd9e22b57445fd533389b56d73eb0006a6a292c69d8b52e9f2b6ed7d2'
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
	echo "--- Destination dir: $_destdir"

	echo "--- Applying patches ..."
	cd "${pkgname}"
	git apply "${srcdir}/0001-build-sh.patch"
	## See: https://github.com/fluent/fluent-bit/issues/8858
	git apply --directory=submodules/fluent-bit "${srcdir}/fluent-bit-8901-fix-gcc-14.1.patch"

	echo "--- Building otel ..."
	CGO_ENABLED=1 ./builds/otel.sh "$_destdir"

	echo "--- Building fluent_bit ..."
	./builds/fluent_bit.sh "$_destdir"

	echo "--- Building systemd ..."
	./builds/systemd.sh "$_destdir"

	echo "--- Building ops_agent_diagnostics ..."
	./builds/ops_agent_diagnostics.sh "$_destdir"

	echo "--- Building agent_wrapper ..."
	./builds/agent_wrapper.sh "$_destdir"

	echo "--- Building ..."
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
