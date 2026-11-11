# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Richard Kettlewell <rjk at greenend dot org dot uk>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgbase=rsbackup
pkgname=('rsbackup' 'rsbackup-graph')
pkgver=11.0
pkgrel=1
pkgdesc="rsync-based backup utility"
arch=('x86_64' 'aarch64')
url="https://www.greenend.org.uk/rjk/rsbackup"
license=('GPL-3.0-or-later')
depends=('rsync' 'sqlite')
makedepends=('boost' 'cairomm' 'pango' 'pangomm')
checkdepends=('acl' 'python-xattr')
source=(
	"${url}/${pkgbase}-${pkgver}.tar.gz"
	"${url}/${pkgbase}-${pkgver}.tar.gz.asc"
	'rsbackup.conf'
	'rsbackup.cron.target'
	'rsbackup.cron@.service'
	'rsbackup.cron@.timer'
	# https://github.com/ewxrjk/rsbackup/pull/121.patch?full_index=1
	'fix_119.patch'
	# Replace boost::filesystem with std::filesystem to drop the boost-libs runtime dependency
	'std-filesystem.patch'
)
b2sums=(
	'9ab9ac8bd909bf9e2b04f81f801166f00f8ef1b3efde9f81fc7860a987d2a498668242a0e3c479538e5579783fec8edd4ccec9bd81bc54ce8696f2a88d51a33b'
	'SKIP'
	'd5636c0880c657f2e14f70b20fc36340006fe22c0f18c903906d7334ae54e6b09381f77994c6f550bf6043d4ac941c8eeee904318f68a0d5179afc2647622b23'
	'fb906e693181f4eaffaad1972228fe0720ede3d35292d4605027dbc43b35d9abf49d367ee312b7025eda7c29a86435a25beecca3d5259b01f054b358a981c56d'
	'04a41b59831dc7a040380483a721af59e99d6f12229909287404e9781c3e4a8d94a9a06538e1d09ede8b68f049c1414f5fb84acaaeaf0f10d6e4d2371b8080e3'
	'54a4a2b3b750b97efad8ee01d6d31cf4d8844cabf88460fa61bc228093d7c1c1568403ddabb09d4e0419aac1363e2f161fdf2aa6ec25ada56a2c7c2c2079dd05'
	'41b8c2f374f940cd4076d8dbdcd235fb4a437c6dc656ad96d39715b0e191595c2a34b410b9343cd6b8d276b90f6d42945a42f6a3b2603437238a9b481c582d3c'
	'c7ef2479bba5e7f7d640cd244feb49cba86678bc275b0175ebc3b71c20e77083fee9cdaaee506f0c0b54cca2dec4a56587103c0102e681296bb609ebc366ccd8'
)

# https://www.greenend.org.uk/rjk/misc/me.html
validpgpkeys=(
	'9006B0ED710DB81B76D368D9D3388BA18A741BEF'
	'A4C9A8F8C1FE5C3C2FA3CA8686ADFD1A5A9560F1'
)

prepare() {
	patch --verbose --directory "${pkgbase}-${pkgver}" --strip 1 --ignore-whitespace --input "${srcdir}/fix_119.patch" --unified
	patch --verbose --directory "${pkgbase}-${pkgver}" --strip 1 --ignore-whitespace --input "${srcdir}/std-filesystem.patch" --unified
}

build() {
	cd "${pkgbase}-${pkgver}"

	export LC_ALL=C.UTF-8
	autoreconf --symlink --install
	./configure --prefix=/usr --mandir=/usr/share/man --disable-silent-rules
	make
}

check() {
	cd "${pkgbase}-${pkgver}"

	export LC_ALL=C.UTF-8
	make -k check
}

package_rsbackup() {
	install=rsbackup.install
	optdepends=(
		'lvm2: Use LVM snapshots with the rsbackup-snapshot-hook'
		'openssh: Backup a remote host'
		'rsbackup-graph: Graphical representation of rsbackup state'
		'smtp-forwarder: Mail HTML report via sendmail')
	backup=(
		'etc/rsbackup/config'
		'etc/rsbackup/defaults'
		'etc/rsbackup/devices')

	cd "${pkgbase}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm0644 tools/rsbackup.config "${pkgdir}/etc/rsbackup/config"
	install -Dm0644 tools/rsbackup.defaults "${pkgdir}/etc/rsbackup/defaults"
	install -Dm0644 tools/rsbackup.devices "${pkgdir}/etc/rsbackup/devices"

	install -Dm0644 README.md "${pkgdir}/usr/share/doc/rsbackup/README.md"
	install -Dm0644 doc/CHANGES.md "${pkgdir}/usr/share/doc/rsbackup/CHANGES.md"

	# Split package rsbackup-graph
	rm "${pkgdir}/usr/bin/rsbackup-graph"
	rm "${pkgdir}/usr/share/man/man1/rsbackup-graph.1"

	# Create empty files and folders via tmpfiles.d
	install -Dm0644 "${srcdir}/rsbackup.conf" "${pkgdir}/usr/lib/tmpfiles.d/rsbackup.conf"

	# Provide the rsbackup.cron timers via systemd
	# Enable via `systemctl enable --now rsbackup.cron.target`
	install -Dm0644 "${srcdir}/rsbackup.cron.target" "${pkgdir}/usr/lib/systemd/system/rsbackup.cron.target"
	install -Dm0644 "${srcdir}/rsbackup.cron@.service" "${pkgdir}/usr/lib/systemd/system/rsbackup.cron@.service"
	install -Dm0644 "${srcdir}/rsbackup.cron@.timer" "${pkgdir}/usr/lib/systemd/system/rsbackup.cron@.timer"
}

package_rsbackup-graph() {
	depends=('rsbackup' 'cairomm' 'pango' 'pangomm')
	pkgdesc='graphical representation of rsbackup state'

	cd "${pkgbase}-${pkgver}"
	install -Dm0755 src/rsbackup-graph "${pkgdir}/usr/bin/rsbackup-graph"
	install -Dm0644 doc/rsbackup-graph.1 "${pkgdir}/usr/share/man/man1/rsbackup-graph.1"

	install -d "${pkgdir}/usr/share/doc"
	ln --symbolic --relative "${pkgdir}/usr/share/doc/rsbackup" "${pkgdir}/usr/share/doc/rsbackup-graph"
}
