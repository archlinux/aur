pkgname=errbot
pkgver=6.1.7
pkgrel=1
pkgdesc="a chatbot. It allows you to start scripts interactively from your chatrooms for any reason: random humour, chatops, starting a build, monitoring commits, triggering alerts..."
arch=(any)
url="https://github.com/errbotio/errbot"
license=('GPL')
options=('emptydirs')
backup=('etc/errbot/config.py')
depends=(python)
makedepends=(python-pip)
source=("errbot.config.py"
	"errbot.service")
sha256sums=('23ba61c4fb3ec173cd62452662c667ed0fab10cfe8ee576ce82598664f147896'
            'e7e4b811c55183580ee821b5dfab99f39917f3c0d284fa7cad9ac086ab4808ec')

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir"/usr/lib/errbot-bundle --ignore-installed errbot==$pkgver sleekxmpp slixmpp
	install -dm0755 "$pkgdir"/usr/bin
	echo "#!/bin/bash
PYTHONPATH=/usr/lib/errbot-bundle/usr/lib/python3.9/site-packages/ exec /usr/lib/errbot-bundle/usr/bin/errbot \$*" >"$pkgdir"/usr/bin/errbot
	chmod a+x "$pkgdir"/usr/bin/errbot

	install -Dm0644 "$srcdir"/errbot.service "$pkgdir"/usr/lib/systemd/system/errbot.service
	install -Dm0600 -o 17 -g 17 \
		"$srcdir"/errbot.config.py "$pkgdir"/etc/errbot/config.py
	install -dm0700 -o 17 -g 17 \
		"$pkgdir"/var/lib/errbot/{data,plugins}
}
