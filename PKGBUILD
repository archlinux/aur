# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@nipha.de>
# Contributor: Jean Lucas < jean at 4ray dot co>
pkgname='parsedmarc'
pkgver='10.2.1'
pkgrel='1'
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=('any')
url="https://github.com/domainaware/$pkgname"
license=('Apache-2.0')
depends=(
	'python>=3.10.0' 'python-azure-core' 'python-azure-identity>=1.8.0' 'python-azure-monitor-ingestion>=1.0.0' 'python-boto3>=1.16.63'
	'python-dateutil' 'python-dnspython>=2.0.0' 'python-elasticsearch-dsl7>=7.4.0' 'python-elasticsearch7.13' 'python-expiringdict>=1.1.4'
	'python-kafka>=2.3.2' 'python-lxml>=4.4.0' 'python-mailsuite>=2.2.2' 'python-maxminddb>=2.0.0' 'python-opensearch>=2.4.2'
	'python-psycopg>=3.1.0' 'python-publicsuffixlist>=0.10.0' 'python-pygelf>=0.4.2' 'python-requests>=2.22.0' 'python-tqdm>=4.31.1'
	'python-urllib3>=1.25.7' 'python-xmltodict>=0.12.0' 'python-yaml>=6.0.3' 'mailparser'
)
makedepends=('python-build' 'python-hatchling>=1.27.0' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=(
	'perl-email-outlook-message: Microsoft Outlook email parsing'
	'perl-email-address: Microsoft Outlook email parsing'
	'geoipupdate: for using an up-to-date IP to Country database with the ip_db_path option'
)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	'remove-requires-python.diff'
)
b2sums=('719a48057cbe2b54b31c4c84ce94e90a920e7eaa1370309d091adb3dba1c4c15b5dad7d588ab830c2be79b440ecd246a83c45324f3bf2746452ab44eb2287760'
        '811ce80732a7f2c0f840bc0dea08cf849508068bbe1d5767a0685b1b656416e5b28fe180d34d52fef244939b55afd2500a0af1c8edcde4552671e32cfc0e6fff')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix pyproject.toml
	patch --forward -p1 < "$srcdir/remove-requires-python.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run unit tests (with GITHUB_ACTIONS set to true to skip DNS lookups)
	TZ='UTC' GITHUB_ACTIONS='true' python -m pytest 'tests/'

	# Create a config file for testing
	cat << EOF > 'test.ini'
[general]
save_aggregate = True
save_failure = True
save_smtp_tls = True
debug = True
offline = True
EOF

	# Test sample reports
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_aggregate/' 'samples/aggregate/'*
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_extract_report/' 'samples/extract_report/'*
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_smtp_tls/' 'samples/smtp_tls/'*
	python -B -m 'parsedmarc.cli' --config-file 'test.ini' --output 'test_failure/' 'samples/failure/'*
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
