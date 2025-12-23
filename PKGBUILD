# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>
pkgname=foldingathome
pkgver=8.5.5
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
source=("git+https://github.com/cauldrondevelopmentllc/cbang#commit=83a4be55c1b21d5383650f51a7887fd9c25b836c"
        "git+https://github.com/foldingathome/fah-client-bastet#commit=2c6fbaa45e4ee4854195a9f0d4b86300975b6543"
        "as_string_fix.patch")
sha256sums=('cc7768e72599e8e7285e981702fb96fbb0fcad22660722dbc425c16677e0ddf0'
            '2415b1ca05c1dc34bfbe01b6d8566bb5106c0f59d2382addeba05ff75ee4df99'
            '21ce7c732dc289e6eda5f4236d1f613c93228c49ce9aef0c2eb1d9d31ce1fc38')

prepare() {
	cd cbang
	patch -p1 -i ../as_string_fix.patch
}

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
