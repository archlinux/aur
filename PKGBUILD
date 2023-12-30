# Maintainer: Kimiblock Moe

pkgname=cloudreve-git
_tag=88409cc1f0a0a55b7ea8f0aee15e82876260b2d8
arch=('x86_64')
conflicts=("cloudreve")
backup=("etc/cloudreve/config.ini")
pkgver=3.8.3
pkgrel=1
pkgdesc="Self-hosted file management and sharing system, supports multiple storage providers"
url=https://github.com/cloudreve/Cloudreve
license=("GPL-3.0-only")
#depends=("")
source=("git+https://github.com/cloudreve/Cloudreve.git#tag=${_tag}" "cloudreve.service" "config.ini")
makedepends=("go" "git" "goreleaser" "yarn" "zip")
sha256sums=('SKIP'
            'fa15c67beb6a9c47c11062f8bd168d5a078dea5944e72a0234eb7568eddcd91e'
            '28e397ff097c4abd38d9d23dcdf963df8401c31040b56d076ed3f3f2e83c155a')
provides=("cloudreve")

function pkgver() {
	cd "${srcdir}/cloudreve"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function prepare(){
	cd "${srcdir}/Cloudreve"
	git submodule init
	git submodule update --depth=1
}

function build(){
	echo "Starting build"
	cd "${srcdir}/Cloudreve"
	goreleaser build --clean --single-target
}

function package(){
	install -Dm644 "${srcdir}/config.ini" "${pkgdir}/etc/cloudreve/config.ini"
	cd "${srcdir}/Cloudreve"
	install -Dm755 "${srcdir}/Cloudreve/dist/Cloudreve_linux_amd64_v1/cloudreve" "${pkgdir}/usr/lib/cloudreve/cloudreve"
	install -Dm644 "${srcdir}/cloudreve.service" "${pkgdir}/usr/lib/systemd/system/cloudreve.service"
	mkdir -p "${pkgdir}/usr/lib/sysusers.d"
	echo 'u	cloudreve	-	"Cloudreve User"	/var/lib/cloudreve' >"${pkgdir}/usr/lib/sysusers.d/cloudreve.conf"
	mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
	mkdir -p "${pkgdir}/usr/lib/cloudreve"
	echo 'd	/var/lib/cloudreve	0700	cloudreve	cloudreve	-' >"${pkgdir}/usr/lib/tmpfiles.d/cloudreve.conf"
}

