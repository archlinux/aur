# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd-git
_repouser=post-factum
_reponame=uksmd
pkgver=0.0.0.r15.42f4ff8
pkgrel=2
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(procps-ng)
source=(${pkgname}::git+https://gitlab.com/post-factum/uksmd.git)
sha256sums=('SKIP')
conflicts=("${_reponame}")
provides=("${_reponame}")

pkgver() {
  cd "${pkgname}"
  printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_reponame}"

	make
}

package() {
	cd "${_reponame}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "distro/${_reponame}.service" "${pkgdir}/usr/lib/systemd/system/${_reponame}.service"
}