# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com> 
# Contributor: Jonas Heinrich <onny@project-insnaity.org>
# Contributor: Lee Watson <aur@revthefox.co.uk>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=gitlab-shell
pkgver=2.6.9
pkgrel=1
pkgdesc="Self hosted Git management software. Replacement for gitolite"
arch=('any')
url="https://gitlab.com/gitlab-org/gitlab-shell/"
license=('MIT')
depends=('ruby>=2.0' 'redis' 'git')
options=('!strip')

install=gitlab-shell.install
backup=(
	"etc/webapps/${pkgname}/config.yml"
	"etc/webapps/${pkgname}/secret"
	"usr/share/webapps/${pkgname}/.gitlab_shell_secret")
#source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gitlabhq/gitlab-shell/archive/v${pkgver}.tar.gz"
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/gitlab-org/gitlab-shell/repository/archive.tar.gz?ref=v${pkgver}"
	gitlab-shell.tmpfiles.d
	)
sha512sums=('751f2e00256f8ef3dd439f4d232f9738cb173aba7715b4e847ca9dc24d74bff3bae20df764db4a58d9fa59e8ed9e24313709301511dd66e21e68a809a6c6604a'
	'f5d82441b1bb4992dcde5b95830496a1511299de5e2e85ac434021d00d20f88af5d206da2cb43a7d264a5c3d922559f205749bfa76d945ce9eae420de392c5b9')
_homedir='/var/lib/gitlab'
_datadir="/usr/share/webapps/${pkgname}"
_srcdir="gitlab-shell-${pkgver}"
_logdir='/var/log/gitlab'
_etcdir="/etc/webapps/${pkgname}"

prepare() {
	ln -sf $(ls ${srcdir} | grep ${pkgname}-v${pkgver}-* | grep -v .tgz) ${pkgname}-${pkgver}
	cd "${srcdir}/${_srcdir}"

	sed -e 's|user: git|user: gitlab|' \
		-e "s|/home/git|${_homedir}|" \
		-e 's|# host: |host: |' \
		-e 's|# port: |port: |' \
		-e 's|socket: |# socket: |' \
		-e "s|# log_file: .*|log_file: \"${_logdir}/gitlab-shell.log\"|" \
		config.yml.example > config.yml
	sed -i "s|<HOMEDIR>|${_homedir}|g" "${srcdir}/gitlab-shell.tmpfiles.d"
	sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/gitlab-shell.tmpfiles.d"
}

package() {
	install -d \
		"${pkgdir}${_datadir}" \
		"${pkgdir}${_homedir}" \
		"${pkgdir}${_etcdir}"
	install -dm0750 "${pkgdir}${_logdir}"

	cd "${srcdir}/${_srcdir}"

	touch "${pkgdir}${_etcdir}/secret"
	chmod 640 "${pkgdir}${_etcdir}/secret"
	ln -fs "${_etcdir}/secret" "${pkgdir}${_datadir}/.gitlab_shell_secret"

	mv config.yml "${pkgdir}${_etcdir}"
	ln -fs "${_etcdir}/config.yml" "${pkgdir}${_datadir}/config.yml"

	cp -a VERSION bin hooks lib spec support "${pkgdir}${_datadir}"
	ln -fs "${_datadir}" "${pkgdir}/${_homedir}/"

	install -dm0700 "${pkgdir}${_homedir}/.ssh"
	install -dm2770 "${pkgdir}${_homedir}/repositories"
	install -dm0750 "${pkgdir}${_homedir}/satellites"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/gitlab-shell.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab-shell.conf"
}

# vim:set ts=4 sw=4 et:
