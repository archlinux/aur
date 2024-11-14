# Maintainer: Till Dieminger <aur@dieminger.ch>
# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=authentik
pkgver=2024.8.4
pkgrel=1
pkgdesc="Open-source Identity Provider focused on flexibility and versatility."
arch=('x86_64')
url="https://goauthentik.io/"
license=('MIT')
depends=('python'
	'python-virtualenv'
	'python-pip'
	'nodejs'
	'python-poetry'
)

makedepends=('git'
	'go'
	'libffi'
	'tk'
	'python-xmlsec'
	'codespell'
	'bandit'
	'golangci-lint'
	'postgresql'
	'npm'
	'unzip'
	)

source=("git+https://github.com/goauthentik/authentik.git#tag=version/${pkgver}"
	"authentik-server.service"
	"authentik-worker.service"
	"authentik.target"
	"authentik.sysusers"
	"authentik.tmpfiles"
)
sha256sums=(SKIP
            afb6fb26b6c362be7704b7fe4091c66f56fdaf3e9348196e59b920ec4850286c
            22aca8423bb7004e0b14959d1de3e550643ce45f0b99e49a5139b892715e57a3
            b16bfe5589bee2b95a0bd73cf1fac855fe3919e756e6ef59eaf0876a7e6d086f
            0025fbbf135defe2727233e51b0c54d1bd8f8008a674c15130a268068ca139ff
            82eb0146249d579ff9da9cb5e815628c878333abf0c36898192f188c0f428c13)
backup=('etc/authentik/config.yml')

prepare(){

	cd "$srcdir/authentik"
    	# Set up Python virtual environment
    	python -m virtualenv "$srcdir/venv"
    	source "$srcdir/venv/bin/activate"

	# Install poetry
	printf "Setting up virtual environment...\n"
	python -m pip install poetry-plugin-export

    	poetry export -f requirements.txt --output requirements.txt --without-hashes --dev

	# Add extra dependencies
    	echo "structlog" >> requirements.txt
	echo "xmlsec" >> requirements.txt
	echo "django-redis" >> requirements.txt
	echo "docker" >> requirements.txt
	echo "ldap3" >> requirements.txt
	echo "django-filter" >> requirements.txt
	echo "psycopg" >> requirements.txt

	printf " Installing Authentik python dependencies which are not available in the default repos or the AUR in a Virtual env...\n "
    	python -m pip install --trusted-host pypi.org --trusted-host github.com -r requirements.txt --no-warn-conflicts
	deactivate

	printf " Fetching node modules... \n"
	cd web
	export NODE_ENV=production
	npm ci --include=dev
}
build() {
    	cd "$srcdir/authentik"
    	source "$srcdir/venv/bin/activate"

	printf " Building Authentik frontend...\n"
	cd web
	export NODE_ENV=production
	npm run build
	cd ..


	printf " Building Authentik go proxy...\n"
	CGO_ENABLED=1 GOFLAGS="-tags=requirefips" \
    	go build -ldflags '-s' -o authentik-server ./cmd/server

	printf " Building Authentik Python module...\n"
	poetry build
	deactivate
}

package() {
	install -dm755 "$pkgdir/opt/authentik" "$pkgdir/etc/authentik" "$pkgdir/opt/authentik/certs" "$pkgdir/opt/authentik/blueprints"
    	install -dm755 "$pkgdir/etc/systemd/system"
    	install -Dm755 "$srcdir/authentik/authentik-server" "$pkgdir/opt/authentik/src/authentik-server"

	install -dm755 "$pkgdir/opt/authentik/src/lifecycle"
	cp -r "$srcdir/authentik/lifecycle/"* "$pkgdir/opt/authentik/src/lifecycle/"

	rm -rf "$srcdir/authentik/web/node_modules"
	install -dm755 "$pkgdir/opt/authentik/src/web"
	cp -r "$srcdir/authentik/web/"* "$pkgdir/opt/authentik/src/web/"

	 # venv
 	install -d "$pkgdir/opt/authentik/lib"
 	cp -R "$srcdir/venv"/* "$pkgdir/opt/authentik/lib"

 	find "$pkgdir/opt/authentik/lib" -type f -exec sed -i "s|$srcdir/venv|/opt/authentik/lib|g" {} +
 	find "$pkgdir/opt/authentik/lib" -type d -name "__pycache__" | xargs rm -rf

	# installing python wheels
	cd "$srcdir/authentik/dist"
    	unzip  *.whl -d "$pkgdir/opt/authentik/lib/lib/python3.12/site-packages"

    	install -Dm644 "$srcdir/authentik/authentik/lib/default.yml" "$pkgdir/etc/authentik/config.yml"
    	cp -r "$srcdir/authentik/blueprints" "$pkgdir/opt/authentik/blueprints"
	cp -r "$srcdir/authentik/lifecycle" "$pkgdir/opt/authentik/lib/lib/python3.12/site-packages"

    	# Generate secret key and update config
    	secret_key=$(openssl rand -hex 32)

	echo "secret_key: '${secret_key}'" >> "$pkgdir/etc/authentik/config.yml"
	echo "avatars: \"none\"" >> "$pkgdir/etc/authentik/config.yml"

    	# system users and files to create
    	install -D -m644 "$srcdir/authentik.sysusers" "${pkgdir}/usr/lib/sysusers.d/authentik.conf"
    	install -D -m644 "$srcdir/authentik.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/authentik.conf"
    	# Service files
    	install -D -m644 "$srcdir/authentik-server.service" "$pkgdir/etc/systemd/system/authentik-server.service"
    	install -D -m644 "$srcdir/authentik-worker.service" "$pkgdir/etc/systemd/system/authentik-worker.service"
    	install -D -m644 "$srcdir/authentik.target" "$pkgdir/etc/systemd/system/auhtentik.target"
}
post_install() {
	printf "Authentik has been installed.\n"
	printf "You need to setup the corresponding database in postgres and set the configuration values in the /etc/authentik/config.yml.\n"
	printf "Same for the redis database. Don't forget to enable and start authentik-server and authentik-worker services.\n"
	printf "Run: systemctl enable authentik-server.service authentik-worker.service && systemctl start authentik-server.service authentik-worker.service\n"
}
