# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname='buck'
pkgver='2017.05.09.01'
pkgrel=1
pkgdesc='A fast build system that encourages the creation of small, reusable modules over a variety of platforms and languages.'
arch=('i686' 'x86_64')
depends=('java-runtime-headless>=7' 'python2')
makedepends=('java-environment>=7' 'apache-ant')
optdepends=('watchman: prevent Buck from parsing all of your build files every time')
url='https://buckbuild.com'
license=('Apache')
source=(
		"https://github.com/facebook/${pkgname}/archive/v${pkgver}.tar.gz"
		'python-test-output.patch'
		'force-python2.patch'
)
sha256sums=(
		'09c4f944edad3ebb85edf1c8cd526da9033a13019597a85c87f435ef74b6a48b'
		'e65ce876291984af91fd6fadfc588c5bded4e43205f312e0b2f2a5c7cf86329e'
		'f2cfad85402cd75d2a7d809fe6aadd8dc72d592b05e74f4dbe1cf6806f26e749'
)

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	for f in python-test-output.patch force-python2.patch; do
		msg2 "Applying patch file ${f}"
		patch -p1 <"${srcdir}/${f}"
	done
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	ant
	./bin/buck build buck
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	BINPATH=$(./bin/buck targets --show_output buck | cut -d' ' -f2)
	install -Dm 755 "${BINPATH}" "${pkgdir}/usr/bin/buck"
}
