# Maintainer: shulhan <ms@kilabit.info>

pkgname=google-cloud-ops-agent-git
pkgver=2.62.0.r8.g2289474b0b
pkgrel=1

pkgdesc="Ops Agents that are part of the Google Cloud Operations product suite (specifically Cloud Logging and Cloud Monitoring)"
arch=('x86_64' 'aarch64')
url='https://github.com/GoogleCloudPlatform/ops-agent'
license=('Apache-2.0')

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
optdepends=(
	'jre-openjdk-headless: Collects JVM metrics exposed through JMX'
)

provides=('google-cloud-ops-agent')
conflicts=('stackdriver-collectd')

backup=(
	'etc/google-cloud-ops-agent/config.yaml'
)

source=(
	"$pkgname::git+https://github.com/GoogleCloudPlatform/ops-agent.git"
	"fluent-bit::git+https://github.com/fluent/fluent-bit.git"
	"opentelemetry-operations-collector::git+https://github.com/GoogleCloudPlatform/opentelemetry-operations-collector.git"
	"opentelemetry-java-contrib::git+https://github.com/open-telemetry/opentelemetry-java-contrib.git"
	'0001-build-sh.patch'
	'config.yaml'
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'ba66d01b8058644597d9b406d3b8ce7ed40aed77c7358f2b97ff0e262a4cbb98'
	'64d22051bc853097dd9c57396788275ce62b0ee58be79e6cfd7ff0261b1466aa'
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

	## Fix building otel with error
	## "mkdir: cannot create directory ‘./META-INF’: File exist"
	rm -rf ${srcdir}/google-cloud-ops-agent-git/submodules/opentelemetry-java-contrib/META-INF
}

build() {
	_destdir="$srcdir/../staging"
	mkdir -p "$_destdir"
	echo "--- Destination dir: $_destdir"

	echo "--- Applying patches ..."
	cd "${pkgname}"
	git apply "${srcdir}/0001-build-sh.patch"

	echo "--- Building otel ..."
	export JAVA_HOME='/usr/lib/jvm/java-17-openjdk'
	export PATH="${JAVA_HOME}/bin:${PATH}"
	java --version
	GO_BIN=/usr/bin/go CGO_ENABLED=1 \
		./builds/otel.sh "$_destdir"

	echo "--- Building fluent_bit ..."
	./builds/fluent_bit.sh "$_destdir"

	echo "--- Building systemd ..."
	./builds/systemd.sh "$_destdir"

	echo "--- Building agent_wrapper ..."
	./builds/agent_wrapper.sh "$_destdir"

	echo "--- Building ops-agent ..."
	BUILD_DISTRO=arch CODE_VERSION="${pkgver}" DESTDIR="$_destdir" \
		./build.sh
}

package() {
	_destdir="$srcdir/../staging"

	cd "${pkgname}"
	rsync -ar "${_destdir}/" "${pkgdir}/"
	chown -R root:root ${pkgdir}/

	install -d ${pkgdir}/etc/google-cloud-ops-agent/
	install -p -m=0644 "${srcdir}/config.yaml" ${pkgdir}/etc/google-cloud-ops-agent/
}
