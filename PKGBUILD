# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=asciinema-server-git
pkgver=0.0.0
pkgrel=1
pkgdesc='asciinema.org web app'
arch=('i386' 'x86_64')
url='https://asciinema.org/'
license=('AGPL3')
depends=('ruby' 'ruby-bundler' 'phantomjs' 'postgresql-libs' 'libtsm-asciinema' 'redis' 'smtp-server')
makepdepends=('libxslt' 'nodejs')
optdepends=('postgresql: database backend')
provides=('asciinema-server')
conflicts=('asciinema-server')
backup=('etc/webapps/asciinema/database.yml'
        'etc/webapps/asciinema/asciinema.yml'
        'etc/logrotate.d/asciinema'
        'etc/conf.d/asciinema')
install="${pkgname}.install"
source=('git://github.com/asciinema/asciinema.org'
        'asciinema.logrotate'
        'asciinema-unicorn.service'
        'asciinema-sidekiq.service'
        'asciinema.conf'
        'database.yml'
        'asciinema.yml')
sha512sums=('SKIP'
            'feac61a6458072fdef9e19b5e636484e31e6cc77daefd650403852f48bf0773d7ca7eb0af343066c2d733af1c32e164043bc78cf1a2dfb4ec271d4488a53b3da'
            '0b3be0a6326741f82924160d39002a8780f8f90521e8203fe595cc6b8243867eec6a00319d00fa62a46c99de12beb38c14ceae1e4ffa4f86a55d063e63250847'
            '801313fda2eab446fa569e11e33f0ab9b84f2fe0678bbf0b74e19eea1250eb7457ed7cf3163fc10b713767962283896b8360df9964013f644012d1c8705a4b81'
            '804add7ea903c746309577450ea6fe3eaecab57a9beb79be1953dee34ce0957daac43fa7a053be7daf1ab32178944dcb9a861b4d6da494f0d559d9f265b88446'
            '70c547f62829707f8f7340c10b6e83fb91874cd8fa535b8a318b4fc3019f3deddb820a6522278a41bc09f28295a0427b4361bbb726260afe4626bf1a8582da69'
            'b3f6225faabb2632e961489e399204392d532d197517de41b16e633257040ec0f0aa49434ffba672943cf65670041a94c8aec876ca93ba95b0dbfbc55225b314')

_srcdir='asciinema.org'
_datadir='/usr/share/webapps/asciinema'
_etcdir='/etc/webapps/asciinema'

prepare() {
	cd "${srcdir}/${_srcdir}"

	# Patch gem versions as arch has a pretty new ruby
	sed -i \
		-e 's/eventmachine (1.0.3)/eventmachine (1.2.0)/g' \
		-e 's/kgio .*$/kgio (2.10.0)/g' \
		-e 's/raindrops .*$/raindrops (0.17.0)/g' \
		Gemfile.lock

	# Configure sidekiq
	echo ':pidfile: /run/asciinema/sidekiq.pid' >> config/sidekiq.yml
	echo ':logfile: /var/log/asciinema/sidekiq_production.log' >> config/sidekiq.yml
}

build() {
	cd "${srcdir}/${_srcdir}"

	msg "Fetching bundled gems..."
	bundle install -j$(nproc) --no-cache --deployment --without development test

	msg "Precompiling assets..."
	# We'll temporarily stick this in here so we can build the assets
	cp config/database.yml.example config/database.yml
	bundle exec rake assets:precompile RAILS_ENV=production
	# After building assets, clean this up again
	rm config/database.yml

	# Build terminal executable
	cd src
	make all
	cd ..
}

package() {
	cd "${srcdir}/${_srcdir}"

	install -d "${pkgdir}/usr/share/webapps"

	# Main installation
	cp -r "${srcdir}/${_srcdir}" "${pkgdir}/${_datadir}"
	chmod 755 "${pkgdir}/${_datadir}"
	rm -r "${pkgdir}/${_datadir}/tmp"
	ln -s "/run/asciinema/tmp" "${pkgdir}/${_datadir}/tmp"

	# Uploads directory
	install -dm600 "${pkgdir}/var/lib/asciinema/uploads"
	rm -r "${pkgdir}/${_datadir}/uploads"
	ln -s /var/lib/asciinema/uploads "${pkgdir}/${_datadir}/uploads"

	# Config
	install -dm755 "${pkgdir}${_etcdir}"
	install -Dm644 "${srcdir}/database.yml" "${pkgdir}/${_etcdir}/database.yml"
	install -Dm644 "${srcdir}/asciinema.yml" "${pkgdir}/${_etcdir}/asciinema.yml"
	ln -s "${_etcdir}/database.yml" "${pkgdir}/${_datadir}/config/database.yml"
	ln -s "${_etcdir}/asciinema.yml" "${pkgdir}/${_datadir}/config/asciinema.yml"

	# Log
	mkdir -p "${pkgdir}/var/log/asciinema"
	rm -r "${pkgdir}/${_datadir}/log"
	ln -s '/var/log/asciinema' "${pkgdir}/${_datadir}/log"
	install -Dm644 "${srcdir}/asciinema.logrotate" "${pkgdir}/etc/logrotate.d/asciinema"

	# systemd services
	for unit in unicorn sidekiq; do
		install -Dm644 "${srcdir}/asciinema-${unit}.service" "${pkgdir}/usr/lib/systemd/system/asciinema-${unit}.service"
	done

	# conf.d
	install -Dm644 "${srcdir}/asciinema.conf" "${pkgdir}/etc/conf.d/asciinema"
}
