# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>
pkgname=foldingathome
pkgver=8.5.2
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
source=("git+https://github.com/cauldrondevelopmentllc/cbang#commit=02f0b2af6bab50b3436dfbad1514ab109b8be5ea"
        "git+https://github.com/foldingathome/fah-client-bastet#commit=edacade24b316a70d4efe933f4965c85ba0b6dba"
)
sha256sums=('b2fa8d21271582d668f48fc08741a63143556c204ddd7ef8a149d0b8cf2c368a'
            '03b647aa32df32539c782241d640b1aa7bab33c9c1528e8971667d36bc033169')

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
