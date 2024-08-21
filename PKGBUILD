# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>
pkgname=foldingathome
pkgver=8.4.3
pkgrel=1
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
         'sqlite'
         'systemd-libs'
         'zlib')
optdepends=('opencl-driver: GPU support')
makedepends=('git'
             'leveldb'
             'libyaml'
             're2'
             'scons'
             'snappy')
backup=("etc/fah-client/config.xml")
install="fah.install"
source=("git+https://github.com/cauldrondevelopmentllc/cbang#commit=f7709f903788bfcf74c54b3d923434cd49e2f61f"
        "git+https://github.com/foldingathome/fah-client-bastet#commit=881ebd700a62dd46df9ddd8ccb8b5320227891d3"
)
sha256sums=('ae7ff310f47d97124042873652f27409c5070d47f5c0ec7b7fccedb2efa99e62'
            '688bfc3d440bf25bf79095c16c9649f28f039def044b4c1bb5bd64163e0f68b5')

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
	install -Dm644 -t "${pkgdir}/usr/share/polkit-1/rules.d/" install/lin/fah-client.rules
	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" install/lin/fah-client.service
	install -dm755    "${pkgdir}/var/log/fah-client/"
	touch             "${pkgdir}/var/log/fah-client/log.txt"
	install -dm755    "${pkgdir}/var/lib/fah-client/"
	install -dm755    "${pkgdir}/etc/fah-client/"
	echo "<config/>" > config.xml
	install -Dm644 -t "${pkgdir}/etc/fah-client/" config.xml
}
