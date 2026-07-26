# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>
pkgname=foldingathome
pkgver=8.5.6
pkgrel=1
epoch=1
pkgdesc='A distributed computing project for simulating protein dynamics'
arch=(x86_64)
url=https://foldingathome.org/
license=(GPL-3.0-or-later)
depends=('bzip2'
         'expat'
         'gcc-libs'
         'glibc'
         'lz4'
         'openssl'
         're2'
         'sqlite'
         'systemd-libs'
         'zlib')
optdepends=('opencl-driver: GPU support')
makedepends=('git'
             'leveldb'
             'libyaml'
             'scons'
             'snappy')
backup=("etc/fah-client/config.xml")
install="fah.install"
source=("git+https://github.com/cauldrondevelopmentllc/cbang#commit=20224041bbf5e5f1ed6a3e4cd1a9e10dd08b1f1d"
        "git+https://github.com/foldingathome/fah-client-bastet#commit=93b96817a82ade9769fba3571ac697788f13357a")
sha256sums=('7f683cdf6e7b4710ddb00d3a8709b2e548ff71e85df98ad9ec1e4105914cefcf'
            '2c8f9cfaea57b268c5576cb08f539a5d3ef1daaddff6bd2786b9e8aba243e6cd')

build() {
	export CBANG_HOME=$PWD/cbang
	scons -C cbang
	scons -C fah-client-bastet
}

package() {
	cd "fah-client-bastet"
	install -Dm755 -t "${pkgdir}/usr/bin/" fah-client
	install -Dm644 -t "${pkgdir}/usr/share/doc/foldingathome/" README.md
	install -Dm644 -t "${pkgdir}/usr/share/doc/foldingathome/" CHANGELOG.md
	install -Dm644 -t "${pkgdir}/usr/share/licenses/foldingathome/" CODE_TAG
	install -Dm644 -t "${pkgdir}/usr/share/polkit-1/rules.d/" install/lin/10-fah-client.rules
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" install/lin/fah-client.service
	install -dm755    "${pkgdir}/var/log/fah-client/"
	touch             "${pkgdir}/var/log/fah-client/log.txt"
	install -dm755    "${pkgdir}/var/lib/fah-client/"
	install -dm755    "${pkgdir}/etc/fah-client/"
	echo "<config/>" > config.xml
	install -Dm644 -t "${pkgdir}/etc/fah-client/" config.xml
}
