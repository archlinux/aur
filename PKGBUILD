# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
pkgname='parsedmarc'
pkgver='8.18.7'
_pkgver='6.18.7'
pkgrel='1'
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=('any')
url="https://github.com/domainaware/$pkgname"
license=('Apache-2.0')
depends=('python' 'python-azure-core' 'python-azure-identity>=1.8.0' 'python-azure-monitor-ingestion>=1.0.0' 'python-boto3>=1.16.63' 'python-dateutil' 'python-dnspython>=2.0.0' 'python-elasticsearch7.13' 'python-elasticsearch-dsl7>=7.4.0' 'python-expiringdict>=1.1.4' 'python-geoip2>=3.0.0' 'python-google-api-python-client>=2.35.0' 'python-google-auth-oauthlib>=0.4.6' 'python-google-auth>=2.3.3' 'python-imapclient>=2.1.0' 'python-kafka-ng>=2.2.2' 'python-lxml>=4.4.0' 'mailparser' 'python-mailsuite' 'python-msgraph-core0.2>=0.2.2' 'python-opensearch>=2.4.2' 'python-publicsuffixlist>=0.10.0' 'python-pygelf>=0.4.2' 'python-requests>=2.22.0' 'python-tqdm>=4.31.1' 'python-urllib3>=1.25.7' 'python-xmltodict>=0.12.0')
makedepends=('python-build' 'python-hatchling>=1.27.0' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=(
	'perl-email-outlook-message: Microsoft Outlook email parsing'
	'perl-email-address: Microsoft Outlook email parsing'
	'geoip2-database: for using an up-to-date IP to Country database'
)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz"
	'run-tests-offline.diff'
)
b2sums=('8fb14ba267fd1518e074a9984996a0e81cfb6446dc0015a30f3a3e75943c9cd032c60bc3af7a7586d82b197a38b61baf202d815344cd8de04cb537097cbeec64'
        '72b3826cb1a61eb4004e4763aefd9996a0c28bee387a36ecd8d4837f1b33a265c1691ff0e11478d10ce30adeb49c277f24eb737067d6ca090bb9967e0895429d')

_sourcedirectory="$pkgname-$_pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Force tests to run offline
	patch --forward -p1 < '../run-tests-offline.diff'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run unit tests
	pytest 'tests.py' --full-trace

	# Create a config file for testing
	cat << EOF > 'test.ini'
[general]
save_aggregate = True
save_forensic = True
save_smtp_tls = True
debug = True
offline = True
EOF

	# Test sample reports
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_aggregate/' 'samples/aggregate/'*
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_extract_report/' 'samples/extract_report/'*
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_forensic/' 'samples/forensic/'*
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_smtp_tls/' 'samples/smtp_tls/'*
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
