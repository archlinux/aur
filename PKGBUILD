# Maintainer: Justin Dray <justin@dray.be>

_gitname=graphite-api
pkgname=${_gitname}-git
pkgver=1.0.1.r121.gb3f3cee
pkgrel=2
pkgdesc="Graphite-web, without the interface. Just the rendering HTTP API."
url="https://github.com/Dieterbe/graphite-api"
license=('Apache')
depends=('python' 'python-pytz' 'python-six' 'python-flask' 'python-structlog'
         'python-yaml' 'python-tzlocal' 'python-cairocffi' 'python-pyparsing'
	 'gunicorn')
makedepends=('python-setuptools' 'python-mock')
optdepends=('python-flask-cache: For caching'
            'python-raven: For sentry support'
	    'python-statsd: For statsd support')
install='graphite-api.install'
backup=('etc/graphite-api.yaml' 'etc/conf.d/graphite-api.conf')
arch=('any')
source=("$_gitname::git+https://github.com/Dieterbe/graphite-api"
        "graphite-api.sh"
	"graphite-api.conf"
	"graphite-api.service"
	"graphite-api.install"
	"logging.patch")
options=(!strip)
md5sums=('SKIP'
         '812a1b255084315b95ef9196a77a292b'
         '73adabf7ca9d942a63195876c2d7ba10'
         'f4c29b725ab6b2b8f137198631650a41'
         '5f510962f5183354f211167c7e0c811e'
         'fb68114944b86eab0afbc713e6a92615')

pkgver() {
	cd "$_gitname"
	git checkout support-templates2 &>/dev/null
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitname"
	patch -Np1 -i "$srcdir/logging.patch"
}

build() {
	cd "$srcdir/$_gitname"
	python setup.py build
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --root="${pkgdir}/" --optimize=1
	mkdir -p "$pkgdir/var/lib/graphite"
	install -Dm0755 "$srcdir/graphite-api.sh" "$pkgdir/usr/bin/graphite-api"
	install -Dm0644 "$srcdir/graphite-api.service" "$pkgdir/usr/lib/systemd/system/graphite-api.service"
	install -Dm0644 "$srcdir/graphite-api.conf" "$pkgdir/etc/conf.d/graphite-api.conf"
	install -Dm0644 "$srcdir/$_gitname/fpm/conf/etc/graphite-api.yaml" "$pkgdir/etc/graphite-api.yaml"
	sed -i 's|/srv/|/var/lib/|g' "$pkgdir/etc/graphite-api.yaml"
}
