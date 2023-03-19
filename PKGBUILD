# Maintainer: Reto Brunner <reto@labrat.space>
pkgname=thelounge-git
_realname=thelounge
pkgver=v4.4.0.pre.1.r0.g30a3ba48
pkgrel=1
pkgdesc='Modern self-hosted web IRC client'
url='https://thelounge.chat/'
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('yarn' 'git' 'python' 'npm')
options=('!lto' '!strip')
conflicts=('thelounge')
backup=('etc/thelounge/config.js')
source=(
	'git+https://github.com/thelounge/thelounge.git'
	'system.service'
	'user.service'
	'sysusers.d'
	'tmpfiles.d'
)
sha256sums=('SKIP'
            'c92210f6ac8f01c1cd01b6b26793094cd2feea583ed21fab3564d6bcafdc7a20'
            'c609f3309f54bd6285e99ff29ca2464828bec7bbbca67243ee688bd2d605dbf0'
            '30fab63b8a4ffcfdda4c5b8d7c66822a323c4f1de6ca62b77fe9500f4befc0a5'
            'c07fc7aaa91f6d2407d9ea2d15bfa780bfc06e3487efa138a9385307dcf9f41d')

pkgver() {
	cd $_realname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	echo /etc/thelounge > "$_realname/.thelounge_home"
	cd $_realname
	yarn install --frozen-lockfile --non-interactive --ignore-scripts --cache-folder "$srcdir/yarn-cache"
}

build() {
	cd $_realname
	export NODE_ENV=production
	yarn build
	mkdir _build
	local tarball=$(npm pack --pack-destination _build)

	# ensure we get the lockfile that we expect and fetch the deps
	cp package.json yarn.lock _build
	cd _build

	# Install the package itself
	# we on purpose don't use yarn global add, because --ignore-scripts
	# is ignored: https://github.com/yarnpkg/yarn/issues/8291 but we tried
	yarn add --no-default-rc --frozen-lockfile \
		--prod --non-interactive --ignore-scripts \
		--cache-folder "$srcdir/yarn-cache" --offline \
		file:"$(readlink -e ./$tarball)"

	# build sqlite3 from source, avoids the binary blob (kinda)
	cd node_modules/sqlite3
	./node_modules/.bin/node-pre-gyp rebuild
}


package() {
	install -dm755 "$pkgdir/usr/lib/thelounge"
	cp -r "$srcdir/$_realname/_build/node_modules" "$pkgdir/usr/lib/thelounge"

	install -dm755 "$pkgdir/usr/bin/"
	ln -s "/usr/lib/thelounge/node_modules/thelounge/index.js" "$pkgdir/usr/bin/thelounge"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	# yarn is probably not much better
	find "${pkgdir}"/usr/lib/thelounge -type d -exec chmod 755 {} +
	chown -R root:root "${pkgdir}"

	# add default config
	install -Dm 644 "$srcdir/$_realname/defaults/config.js" "$pkgdir/etc/thelounge/config.js"

	# services
	install -Dm644 "$srcdir/system.service" "$pkgdir/usr/lib/systemd/system/$_realname.service"
	install -Dm644 "$srcdir/user.service" "$pkgdir/usr/lib/systemd/user/$_realname.service"

	# setting up system user
	install -Dm644 "${srcdir}/sysusers.d" "${pkgdir}/usr/lib/sysusers.d/thelounge.conf"
	install -Dm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/thelounge.conf"
}
