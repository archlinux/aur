pkgname=distribution
pkgver=3.0.0
pkgrel=1
pkgdesc="the Open Source Registry implementation for storing and distributing container images using the OCI Distribution Specification"
arch=(x86_64)
url="https://github.com/distribution/distribution/"
license=('GPL')
depends=()
makedepends=('go' 'git')
source=("git+https://github.com/distribution/distribution.git#tag=v${pkgver/rc/-rc.}"
	registry.sysuser
	registry.service
	registry.tmpfiles
	config.yml.example)
sha256sums=('beb09ad83c02506e39f2b806a0acf9bbba63ff165ca078518efa633197c66a84'
            '8f967e91e3a952628378ff71aeeace48f5d29883a7a0eec26d0ab1485c354b07'
            '24793414a56feca9c9d908018652da1ddf19e91d6ed10ac9a0900daf2a5688cf'
            '6dea38e5e572c54c8474670c69bcc61c70d8213d063a0767083b82ccec4d7064'
            'c8755adfcc2ae168947b1e60a404dee725a84185b5363d505303fb289c9d16fa')

prepare() {
	cd "$pkgname"
#	go mod init "github.com/distribution/distribution"
#	go mod vendor
}

build() {
	cd "$pkgname"
	make binaries
}

package() {
	cd "$pkgname"
	install -Dm0755 bin/digest "$pkgdir"/usr/bin/digest
	install -Dm0755 bin/registry "$pkgdir"/usr/bin/registry
	install -Dm0755 bin/registry-api-descriptor-template "$pkgdir"/usr/bin/registry-api-descriptor-template
	
	install -Dm0644 "$srcdir"/registry.service "$pkgdir"/usr/lib/systemd/system/registry.service
	install -Dm0644 "$srcdir"/registry.sysuser "$pkgdir"/usr/lib/sysusers.d/registry.conf
	install -Dm0644 "$srcdir"/registry.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/registry.conf
	install -Dm0644 "$srcdir"/config.yml.example "$pkgdir"/etc/docker/registry/config.yml.example
}
