pkgname=newrelic-infra
pkgver=1.36.0
pkgrel=1
license=('Apache')
arch=('x86_64')
url=https://github.com/newrelic/infrastructure-agent
source=(
	"https://download.newrelic.com/infrastructure_agent/linux/apt/pool/main/n/newrelic-infra/newrelic-infra_systemd_${pkgver}_amd64.deb"
	"https://raw.githubusercontent.com/newrelic/infrastructure-agent/${pkgver}/assets/examples/infrastructure/newrelic-infra-template.yml.example"
)

sha256sums=('990fcf1b0ff391396aff66661a9f1179aa0fc3b6403c4703d8053854363ebe5c'
            '60f2a31b2d461f029c786a18f1feb393c1a5e43beac520b1c7d5e12b45590ae0')

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
