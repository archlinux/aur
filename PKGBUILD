# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=(dosh dosh-docker-shell dosh-cqfd dosh-docker-cqfd)
pkgver=7
pkgrel=1
pkgdesc='Docker shell'
arch=(any)
url=https://github.com/gportay/dosh
license=(LGPL-2.1-or-later)
depends=(bash)
makedepends=(asciidoctor bash-completion)
checkdepends=(shellcheck)
source=("dosh-$pkgver.tar.gz::https://github.com/gportay/dosh/archive/$pkgver.tar.gz"
	"bash-completion-cqfd::https://raw.githubusercontent.com/savoirfairelinux/cqfd/v5.7.0/bash-completion")
sha256sums=('4739c3f8cf2385b867e3b9da561ca9c864447c870f0025fb8f32f0cdea5989dd'
            '4af081815df72cde10579b085133f35734221680e3118883980cefe5d853bbb3')
validpgpkeys=(8F3491E60E62695ED780AC672FA122CA0501CA71)

build() {
	cd "dosh-$pkgver"
	make dosh.1.gz
}

check() {
	cd "dosh-$pkgver"
	make -k check
}

package_dosh() {
	depends+=(docker)
	optdepends+=(dosh-docker-shell)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install install-doc install-bash-completion
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh/LICENSE"
}

package_dosh-docker-shell() {
	pkgdesc='Docker CLI plugin for dosh'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-cli-plugin
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-docker-shell/LICENSE"
}

package_dosh-cqfd() {
	pkgdesc='Wrap commands in controlled Docker containers using dosh'
	depends+=(dosh)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-cqfd
	install -D -m 644 "$startdir/bash-completion-cqfd" "$pkgdir$completionsdir/cqfd"
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-cqfd/LICENSE"
}

package_dosh-docker-cqfd() {
	pkgdesc='Docker CLI plugin for cqfd'
	depends+=(dosh-cqfd)

	cd "dosh-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install-cli-plugin-cqfd
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/dosh-docker-cqfd/LICENSE"
}
