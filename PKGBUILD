# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=tmate-ssh-server-git
pkgver=2.3.0.r44.ge1a5e084
pkgrel=2
pkgdesc='tmate SSH server'
arch=('i686' 'x86_64')
url='https://github.com/tmate-io/tmate-ssh-server'
license=('MIT')
depends=('libevent' 'libssh' 'msgpack-c')
makedepends=('git')
provides=('tmate-ssh-server')
conflicts=('tmate-ssh-server')
license=('MIT')
backup=('etc/tmate-ssh-server/tmate-ssh-server.conf')
source=('git+https://github.com/tmate-io/tmate-ssh-server'
        'tmate-ssh-server.conf'
        'tmate-ssh-server-genkeys-ed25519.service'
        'tmate-ssh-server-genkeys-rsa.service'
        'tmate-ssh-server.service')
sha256sums=('SKIP'
            '6fe447933a96c0f187d0d7d63225b647bbb1bd53c07e1698d9f6e33814e7ee85'
            '1a0fbfd869e59273f292cbc395835b33def8d438b7ee52858109f95490b25250'
            'ad31789ba1ebffd177a4295721a11e2ae359da4cbad357323d926e47294a48b9'
            '2040850ba04c6339c6ce9d9fdb5c40f17960a4f69af5401f779eee162a6f11ef')

pkgver() {
	cd tmate-ssh-server/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

prepare() {
	cd tmate-ssh-server/

	autoreconf -fi
}

build() {
	cd tmate-ssh-server/

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc
	make
}

package() {
	install -D -m0644 tmate-ssh-server.conf "${pkgdir}"/etc/tmate-ssh-server/tmate-ssh-server.conf
	install -D -m0644 tmate-ssh-server-genkeys-ed25519.service "${pkgdir}"/usr/lib/systemd/system/tmate-ssh-server-genkeys-ed25519.service
	install -D -m0644 tmate-ssh-server-genkeys-rsa.service "${pkgdir}"/usr/lib/systemd/system/tmate-ssh-server-genkeys-rsa.service
	install -D -m0644 tmate-ssh-server.service "${pkgdir}"/usr/lib/systemd/system/tmate-ssh-server.service

	cd tmate-ssh-server/

	make DESTDIR="${pkgdir}" install
}

