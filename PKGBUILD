# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

_pkgname=sickgear
pkgname=${_pkgname}-git
pkgver=0.11.12.r0.g9198eb6
pkgrel=1
pkgdesc="Provides management of TV shows and/or Anime, detects new episodes, links to downloader apps, and more."
arch=('any')
url="https://github.com/SickGear/SickGear"
license=('GPL3')
makedepends=('git')
depends=('python2-cheetah')
optdepends=('python2-notify: desktop notifications'
            'python2-pyopenssl: enable SSL'
            'unrar: RAR archives')
provides=(${_pkgname})
conflicts=(${_pkgname})
options=('!strip')
install=${_pkgname}.install

source=(
	"sickgear.service"
	"sickgear.tmpfiles"
	"sickgear.sysusers"
	"fix-signal-handling.patch"
	"${_pkgname}::git+https://github.com/SickGear/SickGear.git"
)

sha256sums=('1b80f3f749e357e1509dd4524eecb3f044ec0a266cf96c31f665dabb7fe07f8f'
            '5c7a327168f2b2d361eeaa9e9f82e79a87381908d8ba6b1d1eb90ac64ad38ac2'
            '54873ee12aa334a0c0830dbe48251f994d8ae851ae0b55250c098ff9f7f9ea60'
            'fae4616bf9dbf19d5bb2fcc89abd49b27db9f1f0181589a60bbcde07b840ae99'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^release_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkname}"
	patch -Np1 -i "${srcdir}/fix-signal-handling.patch"
}

package() {
	install -dm 755 "${pkgdir}"/{opt/sickgear/app,usr/lib/{tmpfiles.d,sysusers.d,systemd/system}}

	cp -dr --no-preserve=ownership "${_pkgname}"/* "${pkgdir}/opt/sickgear/app/"

	install -m 644 sickgear.service "${pkgdir}/usr/lib/systemd/system/"
	install -m 644 sickgear.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/sickgear.conf"
	install -m 644 sickgear.sysusers "${pkgdir}/usr/lib/sysusers.d/sickgear.conf"
}
