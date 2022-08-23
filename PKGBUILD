pkgname=newrelic-infra
pkgver=1.28.2
pkgrel=1
license=('Apache')
arch=('x86_64')
url=https://github.com/newrelic/infrastructure-agent
source=(
	"https://download.newrelic.com/infrastructure_agent/linux/apt/pool/main/n/newrelic-infra/newrelic-infra_systemd_${pkgver}_amd64.deb"
	"https://raw.githubusercontent.com/newrelic/infrastructure-agent/${pkgver}/assets/examples/infrastructure/newrelic-infra-template.yml.example"
)

sha256sums=('788122a1c151c886b85599f9417de161dd21b2086b92273f258383b232b656f7'
            'ac610105c621168903e4aa73d8eb53b5c9a6c0c88734bd4c922dc8f5d42d08e0')

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
