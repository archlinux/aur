pkgname=statsite
pkgdesc='A C implementation of StatsD'
pkgver=0.8.0
pkgrel=2
url=https://statsite.github.io/statsite
license=('custom:BSD')
makedepends=('scons')
depends=('glibc')
optdepends=('python: InfluxDB, Graphite, Ganglia, and Librato sinks'
            'ruby: JSON/YAML sink'
            'nodejs: OpenTSDB sink'
            'bash: Cloudwatch sink'
			'aws-cli: Cloudwatch sink')
arch=('x86_64' 'arm' 'i686')
source=("https://github.com/statsite/statsite/archive/v${pkgver}.tar.gz"
        statsite.conf.example
        statsite.service)
sha512sums=('d1544df2741b82e389c3886115f5d2f2d06e4979d44ef0ac8efbd2637be2a9d56e27c4f44a83d23c20303c119493a2ed06c9e56b21b931925eaa4f545eb4c45a'
            '78d01b634ac1d1831a9ee08318bee078e729ba3c725b80a6189830e7bedc57e06300c35843aa41106cbfb1290ad6fe30d24139563627399b83cd2cba479caf14'
            '5c5d3735ff6acab17d6ff9a5b0ab473e868a84d00dd19a1171322fc0b1ffdba789e56ae387b41aed455ab4db3c19c9b0527ad552f68a9827318f004e6bcdeafe')

build () {
	cd "${pkgname}-${pkgver}"
	scons statsite
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm755 statsite \
	               "${pkgdir}/usr/bin/statsite"
	install -Dm644 LICENSE \
	               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -dm755 "${pkgdir}/usr/libexec/statsite"
	cp -a ./sinks  "${pkgdir}/usr/libexec/statsite/"
	install -Dm644 "${srcdir}/statsite.conf.example" \
	               "${pkgdir}/etc/statsite.conf.example"
	install -Dm644 "${srcdir}/statsite.service" \
	               "${pkgdir}/usr/lib/systemd/system/statsite.service"
}
