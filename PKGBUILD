# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd-git
_repouser=post-factum
_reponame=uksmd
_product="${_reponame}"
pkgver=0.0.0.r19.b6af35c
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN procps-ng libcap-ng)
makedepends=(git)
source=(${_product}::git+https://gitlab.com/${_repouser}/${_reponame}.git)
sha256sums=('SKIP')
conflicts=("${_product}")
provides=("${_product}")

pkgver() {
  cd "${_reponame}"
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
	install -Dt "${pkgdir}"/usr/lib/systemd/system -m0644 distro/${_product}.service
}
