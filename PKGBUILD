# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>
pkgname=foldingathome
pkgver=8.4.9
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
source=("git+https://github.com/cauldrondevelopmentllc/cbang#commit=443c54e909eb8d8994405a18fb328b5b05a623a5"
        "git+https://github.com/foldingathome/fah-client-bastet#commit=360fe71b1bd05bb89814bfb97b73a5bda84802d6"
)
sha256sums=('1021182019c080a810e94ef7635f8baad87d5d91609ab882c1eba20556ddc216'
            'cb871d420a47c80c0c13dc4199eca2405b54da669ce4073f775b4bd7374b6a01')

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
