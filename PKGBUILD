# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Tim Waugh <tim at cyberelk dot net>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=journal-brief
pkgver=1.1.8
pkgrel=1
pkgdesc='Show interesting new systemd journal entries since last run'
arch=('any')
url="https://github.com/twaugh/${pkgname}"
license=('GPL-2.0-only')
depends=('python' 'python-pyaml' 'python-systemd')
makedepends=('git' 'python-setuptools')
checkdepends=('python-flexmock' 'python-pytest' 'python-pytest-mock')
optdepends=('smtp-forwarder: send the report via sendmail')
source=(
	"git+${url}.git#tag=v${pkgver}?signed"
	'journal-brief.service'
	'journal-brief.timer'
	'journal-brief.yaml'
)
b2sums=(
	'1ba88ddf4e23c5d685e65acacfaf1901f2af9177283b01514a1090adaf0b732534b17a9bba127193b85c0d57e092ddb174df2cdf5a2c54a6e96ad690473652b5'
	'27f302b96c3aef7deb76f2fd3620b3a9f50182b05a363466389114f8308bff5e6efae7e673ceeea92385c5a84f3d6008e01fbfe1f6fbdb8d6603c222b1ec2c18'
	'4bddaedf79d4027a17f6a180a296df21b9cc94bd0635a917e3fe9a0e0fb11fc1b5e1653727d5bfa71adb5ebf9d72f5df4cfbfc19748b4184310fa25eec484ac9'
	'4e5d89952bb7093bcafb5980a85e1bea3326cc263f95d893e3d48be8ddeddb58f4696407738561a875df8587039b1600a78ec9dc9583020ba528f9a5987f6b38'
)
validpgpkeys=(
	'4629AFE960EC20BEC12E3104B7C20D079491EA63' # Tim Waugh <tim@cyberelk.net>
)
backup=('etc/journal-brief/journal-brief.yaml')

build() {
	cd "${pkgname}"
	python setup.py build
}

check() {
	cd "${pkgname}"
	pytest
}

package() {
	cd "${pkgname}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1

	install -Dm0644 -t "${pkgdir}/etc/journal-brief" "${srcdir}/journal-brief.yaml"
	install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/journal-brief."{service,timer}
	install -Dm0644 -t "${pkgdir}/usr/share/doc/journal-brief" README.md
}
