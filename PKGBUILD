pkgname='statsite'
pkgdesc='A C implementation of StatsD'
pkgver='0.7.1'
pkgrel='1'
url='http://armon.github.io/statsite'
license='custom:BSD'
makedepends=('scons')
depends=('glibc')
optdepends=('python: InfluxDB, Graphite, Ganglia, and Librato sinks'
            'ruby: JSON/YAML sink'
            'nodejs: OpenTSDB sink'
            'bash: Cloudwatch sink'
			'aws-cli: Cloudwatch sink')
arch=('x86_64' 'arm' 'i686')
source=("https://github.com/armon/statsite/archive/v${pkgver}.tar.gz"
        statsite.conf.example
        statsite.service)
sha512sums=('c51db23002bfdcebea4a3a7276cb4012b881b5efc2b79e39b571cee9bcdcc3f5f76edb42c28971cd6f0534ca02ce216c4eadd06df3d25e23543ff1759a4fbd29'
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
