# Maintainer: Kimiblock Moe

pkgname=cloudreve
_tag=88409cc1f0a0a55b7ea8f0aee15e82876260b2d8
arch=('x86_64')
backup=("etc/cloudreve/config.ini")
pkgver=3.8.3
pkgrel=1
pkgdesc="Self-hosted file management and sharing system, supports multiple storage providers"
url=https://github.com/cloudreve/Cloudreve
license=("GPL-3.0-only")
#depends=("")
source=("git+https://github.com/cloudreve/Cloudreve.git#tag=${_tag}" "cloudreve.service" "config.ini")
makedepends=("go" "git" "goreleaser" "yarn")
sha256sums=("SKIP" "SKIP" "SKIP")
provides=("cloudreve")

function prepare(){
	cd "${srcdir}/Cloudreve"
	git submodule init
	git submodule update --depth=1
}

function build(){
	echo "Starting build"
	cd "${srcdir}/Cloudreve"
	#goreleaser build --clean --single-target
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

