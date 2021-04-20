
pkgname=newrelic-infra
pkgver=1.16.3
pkgrel=1
license=('Apache')
arch=('x86_64')
url=https://github.com/newrelic/infrastructure-agent
source=(
	"https://download.newrelic.com/infrastructure_agent/linux/apt/pool/main/n/newrelic-infra/newrelic-infra_systemd_${pkgver}_amd64.deb"
	"https://raw.githubusercontent.com/newrelic/infrastructure-agent/${pkgver}/assets/examples/infrastructure/newrelic-infra-template.yml.example"
)
sha256sums=(
	'f627cb88746a6cf8034729b57b9418cd721d7e84c40d7d1538592247637b94f7'
	'f4f5614c45e1afb9fbf11a5d948d5a80f1793ebfc2b0a073bfdd4264e396daa5'
)

package() {
	for dir in usr/bin var/db etc/newrelic-infra var/log/newrelic-infra usr/lib/systemd/system; do
		mkdir -p "${pkgdir}/${dir}"
	done

	# Extract debian data
	tar -xzf data.tar.gz

	# Sample config
	cp newrelic-infra-template.yml.example "${pkgdir}/etc/newrelic-infra/newrelic-infra.yml.example"

	# Integration configs
	cp -Ra "${srcdir}/etc/newrelic-infra" "${pkgdir}/etc/"

	# Systemd unit file, without the broken PIDFile directive
	grep -ve '^PIDFile' \
		"${srcdir}/etc/systemd/system/newrelic-infra.service" \
		> "${pkgdir}/usr/lib/systemd/system/newrelic-infra.service"

	# Infra-agent binaries
	cp -Ra ${srcdir}/usr/bin/* "${pkgdir}/usr/bin/"

	# Integration binaries and definitions
	# TODO: Move this to /var/lib and add corresponding env overrides
	cp -Ra "${srcdir}/var/db/newrelic-infra" "${pkgdir}/var/db"
}
