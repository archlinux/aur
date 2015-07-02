# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

pkgname=gitlab-ci
pkgver=7.12.1
pkgrel=1
pkgdesc="Continuous integration server for gitlabhq | Coordinator"
arch=('i686' 'x86_64')
url="http://www.gitlab.com/gitlab-ci"
license=('MIT')
depends=('ruby>=2.0' 'ruby-bundler>=1.5.2' 'openssh' 'redis' 'libxslt' 'icu' 'nodejs')
optdepends=(
	'mariadb: database backend'
	'postgresql: database backend'
	)
backup=(
	"etc/webapps/${pkgname}/application.yml"
	"etc/webapps/${pkgname}/database.yml"
	"etc/webapps/${pkgname}/resque.yml"
	"etc/webapps/${pkgname}/unicorn.rb"
	"etc/logrotate.d/${pkgname}"
	)
source=("$pkgname-$pkgver.tar.gz::https://github.com/gitlabhq/gitlab-ci/archive/v${pkgver}.tar.gz"
	gitlab-ci.target
	gitlab-ci-unicorn.service
	gitlab-ci-sidekiq.service
	gitlab-ci.tmpfiles.d
	gitlab-ci.logrotate
	apache2.4.conf.example
	apache2.4-ssl.conf.example
	apache.conf.example
	apache-ssl.conf.example
	nginx-ssl.conf.example
	lighttpd.conf.example
	)
install='gitlab-ci.install'
sha512sums=('13d2b50c9cdc43bfe57f8771bfd1bafab26330b9ff94f62b5596a617777613002df8b92570231836d426950fdc738664222a475abfdbf68479751c2a26ff0c6a'
	'30cf8ad2a26f0f6d87cb230c69668f8d7b15329af21985349bbc2c8eb3560ccbc82dd173e65be41aa71246b2426fc123f43d45b103371ce47a56d9ba7bda46bc'
	'3f202f6c21f380f8fd98b34bc7e6d48a94dcb5339e67e71284ef9589b0381dba73ecccdb4f0c3cefd5786e5326e8220c6650ed350c2ba6ea214be9b1232bf253'
	'b1585c29e3b17f3ba9ad237a1a612749bbc9bc25ed06f0c5862213440b0608ed34b8fdf8e0dbf0b198dc16593120edf9a467c218bb9aac8ab51cfd2867215873'
	'83642ba8433e1e59ecd2f603098ccebe45a0109bddf1b060a9d95fd958c02f99f86beaf5f26d3c6acadd830f9a579bb2312af534658998fc5a4c56c78244e67d'
	'cdc948304eed5cfc62de2a953295129a9d9d61ee0be6165397bca6678108052e314d4c0ed4b7211df5a65ebdc39b4738900e7f71b58146b1b3b120bf1cdd4271'
	'1323dc3bae4f4c9d4a42062abc83f4330014519df78a00a263ac20f9cc489af4d781f1b32a77756ed96b53c44de2bd2bd19c36c193b04f01f40be8c2f5369f7a'
	'd6a7a53455c5209e1b07a29b8a32f7409edb2b0da2342c024c5aacec91a01d95f8ff4be7e9e9b8886262ec4269291d6f698b94b5316eac925b097e3f62343d2d'
	'59e6625134c0dca27cb801fc3d44a01320ada4d5b99000800ad4a1bc7378d5f7f7212103a256940e97a1fe865d9772b68339c393950cceda88e37a0d104e992d'
	'55c5c994780c18e088dc4206be392f4591aedab324fecb22dca6cd81eb87988ebab61bf6612481e8aac000b304f33a82ef257118c657ff165440ba5acb28f0a0'
	'a60c61bd312b4726802f5072f49033c6f09fdd291e6a8d95e198279945faeed41ecd5e7cc0ea185c59142ca5d7c8a75278b956922941dee0462c65bc24a23e49'
	'c90b0986503c20150a114b3bbea762f9c7d82069c90509d8b3cc6ac388e519ccc9a82cf4baa0c3218c797a36e3240cd04053224eca5c7f6bd535bd21c5435cb7'
	)
options=('!strip')

_datadir="/usr/share/webapps/${pkgname}"
_logdir="/var/log/${pkgname}"
_srcdir="${pkgname}-${pkgver}"
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
if [[ ${#_wo[@]} == 0 ]]; then
	backup+=("etc/webapps/${pkgname}/database.yml.mysql"
		"etc/webapps/${pkgname}/database.yml.postgresql")
fi

prepare() {
	cd "${srcdir}/${_srcdir}"

	case ${#_wo[@]} in
		2)
			error "Usable DB libs not found"
			msg2 "Install at least libmariadbclient or postgresql-libs"
			return 1
			;;
		1)
			case ${_wo[0]} in
				mysql)
					cp config/database.yml.postgresql config/database.yml
					;;
				postgres)
					cp config/database.yml.mysql config/database.yml
					;;
			esac
			;;
		0)
			ln -fs database.yml.mysql config/database.yml
			;;
	esac

	# Patching config files:
	sed -e "s|/home/gitlab_ci/gitlab-ci/tmp/.*/|/run/gitlab-ci/|g" \
		-e "s|/var/run/|/run/|g" \
		-e "s|/home/gitlab_ci/gitlab-ci|${_datadir}|g" \
		-e "s|${_datadir}/log/|${_logdir}/|g" \
		-e "s|8080|8081|g" \
		config/unicorn.rb.example > config/unicorn.rb
	sed -e "s|production: redis://redis.example.com:6379|production: redis://localhost:6379|" \
		config/resque.yml.example > config/resque.yml
	for __srv in gitlab-ci-sidekiq.service gitlab-ci-unicorn.service gitlab-ci.logrotate gitlab-ci.tmpfiles.d; do
		sed -i "s|<DATADIR>|${_datadir}|g" "${srcdir}/${__srv}"
		sed -i "s|<LOGDIR>|${_logdir}|g" "${srcdir}/${__srv}"
		sed -i "s|<ETCDIR>|${_etcdir}|g" "${srcdir}/${__srv}"
	done
}

build() {
	cd "${srcdir}/${_srcdir}"

	cpus=$(nproc)
	if [[ $cpus -ge 3 ]]; then
		bundle install -j$(( cpus - 1 )) --no-cache --no-prune --deployment --without development test ${_wo[@]}
	else
		bundle install --no-cache --no-prune --deployment --without development test ${_wo[@]}
	fi
}

package() {
	install -d "${pkgdir}/usr/share/webapps"
	cp -r "${srcdir}/${_srcdir}" "${pkgdir}${_datadir}"

	# Creating directories
	install -d \
		"${pkgdir}${_etcdir}" \
		"${pkgdir}/usr/share/doc/${pkgname}" \
		"${pkgdir}${_datadir}/tmp" \
		"${pkgdir}/run/gitlab-ci"

	cd "${srcdir}/${_srcdir}"

	# Install config files
	cp config/application.yml.example "${pkgdir}${_etcdir}/application.yml"
	ln -fs "${_etcdir}/application.yml" "${pkgdir}${_datadir}/config/"
	for _file in unicorn.rb database.yml resque.yml; do
		mv "config/${_file}" "${pkgdir}${_etcdir}/"
		ln -fs "${_etcdir}/${_file}" "${pkgdir}${_datadir}/config/"
	done
	if [[ ${#_wo[@]} == 0 ]]; then
		for _file in database.yml.mysql database.yml.postgresql; do
			cp "config/${_file}" "${pkgdir}${_etcdir}/"
		done
	fi

	# Install license and help files
	mv "${pkgdir}${_datadir}/"{README.md,CONTRIBUTING.md,CHANGELOG,config/*.example} "${pkgdir}/usr/share/doc/${pkgname}"
	if [[ ${#_wo[@]} == 0 ]]; then
		cp config/*.{mysql,postgresql} "${pkgdir}/usr/share/doc/${pkgname}"
	else
		mv config/*.{mysql,postgresql} "${pkgdir}/usr/share/doc/${pkgname}"
	fi
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm "${pkgdir}${_datadir}/"{LICENSE,.gitignore,.travis.yml}

	# Install systemd service files
	for _file in gitlab-ci.target gitlab-ci-unicorn.service gitlab-ci-sidekiq.service; do
		install -Dm0644 "${srcdir}/${_file}" "${pkgdir}/usr/lib/systemd/system/${_file}"
	done

	install -Dm644 "${srcdir}/gitlab-ci.tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/gitlab-ci.conf"
	install -Dm644 "${srcdir}/gitlab-ci.logrotate" "${pkgdir}/etc/logrotate.d/gitlab-ci"

	# Install webserver config temmplates
	for __cfg in apache2.4 apache2.4-ssl apache apache-ssl nginx-ssl lighttpd; do
		install -m644 "${srcdir}/${__cfg}.conf.example" "${pkgdir}${_etcdir}"
	done
}

# vim:set ts=4 sw=4 et:
