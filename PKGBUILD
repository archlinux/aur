# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tobias Hunger <tobias DOT hunger AT gmail DOT com>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=gitlab
pkgver=7.13.4
pkgrel=1
pkgdesc="Project management and code hosting application"
arch=('i686' 'x86_64')
url="http://gitlab.org/gitlab-ce"
license=('MIT')
depends=('ruby>=2.0' 'git>=1.7.10' 'ruby-bundler>=1.5.2' 'gitlab-shell=2.6.3' 'openssh' 'redis>=2.0' 'libxslt' 'icu' 'nodejs')
makedepends=('cmake')
optdepends=(
	'mariadb: database backend'
	'postgresql>=9.1: database backend'
	'python2-docutils: reStructuredText markup language support'
	'postfix: mail server in order to receive mail notifications'
	)
backup=(
	"etc/webapps/${pkgname}/application.rb"
	"etc/webapps/${pkgname}/gitlab.yml"
	"etc/webapps/${pkgname}/database.yml"
	"etc/webapps/${pkgname}/resque.yml"
	"etc/webapps/${pkgname}/unicorn.rb"
	"etc/logrotate.d/${pkgname}"
	)
#source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/gitlab-org/gitlab-ce/repository/archive.tar.gz?ref=v${pkgver}"
source=("$pkgname-$pkgver.tar.gz::https://github.com/gitlabhq/gitlabhq/archive/v${pkgver}.tar.gz"
	gitlab-unicorn.service
	gitlab-sidekiq.service
	gitlab-backup.service
	gitlab-backup.timer
	gitlab.target
	gitlab.tmpfiles.d
	gitlab.logrotate
	apache2.4.conf.example
	apache2.4-ssl.conf.example
	apache.conf.example
	apache-ssl.conf.example
	nginx.conf.example
	nginx-ssl.conf.example
	lighttpd.conf.example)
install='gitlab.install'
sha512sums=('ec4fa8ab4e8e853d515253ac2482756e4ecc8d5727a64f1644c427153e7cba78ef8cdc2d9214329207976c6d62c76993938cf8d114754c93e609f435768c6f99'
	'a16e762b0ff807e6e32ebf45562cf78b6b9b64babbfe4e42856a13f6e190c09553b74eb4d353d6213121c415cc08cc6cc82ffce56916208ebfd67b08cf012680'
	'88132c32fddd067862b8d6973d3bfbb4fbd66aefc317ef8e030983709c939442a74de0d2ef80e55123837806531667ff5664e4b8d764d6bc1bc3a78a3fede249'
	'a38c9c55ad77d857b521769442db95706d9aaf238682f9aa17150f1b5f682ac68eaabfb116e49841e7fce628dd3589685b654d770ac067dac718b5f9e0ee6124'
	'c11d2c59da8325551a465227096e8d39b0e4bcd5b1db21565cf3439e431838c04bc00aa6f07f4d493f3f47fd6b4e25aeb0fe0fc1a05756064706bf5708c960ec'
	'c519a51d31300074ea12594fbcc8e9610d991ef04b1dac94d93a2b201df3465999cc7c6ac7f3896e02b117c2366d61dea1ef2f6b9cd7b18998385a7f26e5700f'
	'e5b8a659b9f0452c38f49a24579f1eac426b62a8ca66fe26b46134dcb0a6976e9597adb723c23728108da33e8e7f2cf80c9397d1fc15b6f71d60bc7aa9a7bc45'
	'a1f52d6ca36b32580062dede23ccdde5633238310b28c6c47deb2ce4496f4e5ffea0de2a49bcb1e0e38fc82b66b0cc91a5e86854716c7e848127769b43eb5067'
	'cd6b9cae3206dbaa3cd893ea0ead43ffbc70eb6a2ad4bacd3abab1150c751aa4ea64c9931409ac97ee36a2ae83fc019c8eb82b2fe11d5f5b4803a81fa5e79152'
	'cd563238011696ba4a7fa1eff2c6604bda8d75c3e6bf9ecb6f0f22e68c9d782e49be3ce2eaad0c1b142116e2c7c59c9242936ba5797f02d5d0880f7e3004aa99'
	'2388bfd485bb2abaf08e28ed09848ba5dec7eac058836506d2f9f0954cfc75c71da062cc9b503f8f571cdda97c8a696f8aca20cca129ab5146c21b14e1e3ac61'
	'db768f60192f6adb466021776c3cdacc263954bc63dc0fb30d13ef20d4db2816d4d1875637984672373eb71c47e65bcdeac52ab5964796b6285519e9aa19c91b'
	'5445f2d386ab18277772f42e175a4bf465dfcb448c0fa3d867302a5e018277438e295d238a62077c842b2c2225555b5b2f17a9194ab87e5d5c7e21e4e9c92366'
	'78c90dc1a7ef969f6c94a004fa1038b6fb76b50c6f3de077b39d40e2a07550e274338d81e83e2280fbd8c2d66ece1706e44c78c785bbc029f9a8a79d3f1eb063'
	'c78b6f46abcf603d8db6e38cf50868e14145928422ddfe17c88e2f006b5b910dddf456ec5d6d724b250994530643963809688a98f7e12ebd5b5dabf7f96f0e06')

_homedir="/var/lib/${pkgname}"
_datadir="/usr/share/webapps/${pkgname}"
_logdir="/var/log/${pkgname}"
_srcdir="gitlabhq-${pkgver}"
_etcdir="/etc/webapps/${pkgname}"
_wo=()

if [[ `pacman -T libmariadbclient` != '' ]]; then
	_wo+=('mysql')
else
    warning "detected libmariadbclient"
fi
if [[ `pacman -T postgresql-libs` != '' ]]; then
	_wo+=('postgres')
else
    warning "detected postgresql-libs"
fi

prepare() {
	if [[ ${#_wo[@]} == 2 ]]; then
		error "Usable DB libs not found"
		msg2 "Install at least libmariadbclient or postgresql-libs"
		return 1
	fi

	cd "${srcdir}/${_srcdir}"

	# Patching config files:
	msg2 "Patching paths and username in gitlab.yml..."
	sed -e "s|# user: git|user: gitlab|" \
		-e "s|/home/git/repositories|${_homedir}/repositories|" \
		-e "s|/home/git/gitlab-satellites|${_homedir}/satellites|" \
		-e "s|/home/git/gitlab-shell|/usr/share/webapps/gitlab-shell|" \
		-e "s|tmp/backups|${_homedir}/backups|" \
		config/gitlab.yml.example > config/gitlab.yml
	msg2 "Patching paths in unicorn.rb..."
	sed -e "s|/home/git/gitlab/tmp/.*/|/run/gitlab/|g" \
		-e "s|/var/run/|/run/|g" \
		-e "s|/home/git/gitlab|${_datadir}|g" \
		-e "s|timeout 30|timeout 300|" \
		-e "s|${_datadir}/log/|${_logdir}/|g" \
		config/unicorn.rb.example > config/unicorn.rb
	msg2 "Patching username in database.yml..."
	sed -e "s|username: git|username: gitlab|" \
		config/database.yml.mysql > config/database.yml
	sed -e "s|production: unix:/var/run/redis/redis.sock|production: redis://localhost:6379|" \
		config/resque.yml.example > config/resque.yml
	msg2 "setting up systemd service files ..."
	for __srv in gitlab-sidekiq.service gitlab-unicorn.service gitlab.logrotate gitlab.tmpfiles.d gitlab-backup.service; do
		sed -i "s|<HOMEDIR>|${_homedir}|g" "${srcdir}/${__srv}"
		sed -i "s|<DATADIR>|${_datadir}|g" "${srcdir}/${__srv}"
		sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/${__srv}"
	done
}

build() {
	cd "${srcdir}/${_srcdir}"

	msg "Fetching bundled gems..."
	# Gems will be installed into vendor/bundle

	bundle config build.nokogiri --use-system-libraries
	cpus=$(nproc)
	if [[ $cpus -ge 3 ]]; then
		bundle install -j$(( $cpus - 1 )) --no-cache --deployment --without development test aws ${_wo[@]}
	else
		bundle install --no-cache --deployment --without development test aws ${_wo[@]}
	fi
}

package() {
	cd "${srcdir}/${_srcdir}"
	install -d "${pkgdir}/usr/share/webapps"
	cp -r "${srcdir}/${_srcdir}" "${pkgdir}${_datadir}"

	# Creating directories
	install -d \
		"${pkgdir}${_etcdir}" \
		"${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgdir}${_homedir}/www" \
		"${pkgdir}${_homedir}/satellites" \
		"${pkgdir}${_datadir}/www" \
		"${pkgdir}${_datadir}/public/uploads"
	ln -fs /run/gitlab "${pkgdir}${_homedir}/pids"
	ln -fs /run/gitlab "${pkgdir}${_homedir}/sockets"
	ln -fs ${_datadir}/log "${pkgdir}${_homedir}/log"

	ln -fs "${_etcdir}/secret" "${pkgdir}${_datadir}/.secret"

	rm -rf "${pkgdir}${_datadir}/public/uploads" && ln -fs "${_homedir}/uploads" "${pkgdir}${_datadir}/public/uploads"
	rm -rf "${pkgdir}${_datadir}/public/assets" && ln -fs "${_homedir}/assets" "${pkgdir}${_datadir}/public/assets"
	# We are using PrivateTmp=true to start unicorn, so this is safe:
	rm -rf "${pkgdir}${_datadir}/tmp" && ln -fs /var/tmp "${pkgdir}${_datadir}/tmp"
	rm -rf "${pkgdir}${_datadir}/log" && ln -fs "${_logdir}" "${pkgdir}${_datadir}/log"

	ln -fs /etc/webapps/gitlab-shell/secret "${pkgdir}${_datadir}/.gitlab_shell_secret"

	# Install config files
	for _file in application.rb gitlab.yml unicorn.rb database.yml resque.yml; do
		mv "config/${_file}" "${pkgdir}${_etcdir}/"
		[[ -f "${pkgdir}${_datadir}/config/${_file}" ]] && rm "${pkgdir}${_datadir}/config/${_file}"
		ln -fs "${_etcdir}/${_file}" "${pkgdir}${_datadir}/config/"
	done

	# Install license and help files
	mv README.md MAINTENANCE.md CONTRIBUTING.md CHANGELOG config/*.{example,mysql,postgresql} "${pkgdir}/usr/share/doc/${pkgname}"
	install -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${pkgdir}${_datadir}/LICENSE"

	# https://gitlab.com/gitlab-org/gitlab-ce/issues/765
	cp -r "${pkgdir}${_datadir}/doc" "${pkgdir}${_datadir}/public/help"
	find "${pkgdir}${_datadir}/public/help" -name "*.md" -exec rm {} \;
	find "${pkgdir}${_datadir}/public/help/" -depth -type d -empty -exec rmdir {} \;

	# Install systemd service files
	for _file in gitlab-unicorn.service gitlab-sidekiq.service gitlab-backup.service gitlab-backup.timer gitlab.target; do
		install -Dm0644 "${srcdir}/${_file}" "${pkgdir}/usr/lib/systemd/system/${_file}"
	done

	install -Dm644 "${srcdir}/gitlab.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab.conf"
	install -Dm644 "${srcdir}/gitlab.logrotate" "${pkgdir}/etc/logrotate.d/gitlab"

	# Install webserver config templates
	for __cfg in apache2.4 apache2.4-ssl apache apache-ssl nginx nginx-ssl lighttpd; do
		install -m644 "${srcdir}/${__cfg}.conf.example" "${pkgdir}${_etcdir}"
	done
}

# vim:set ts=4 sw=4 et:
