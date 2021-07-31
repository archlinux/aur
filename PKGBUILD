# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=xupnpd
pkgver=1.034.r115.g2bc1e74
pkgrel=2
pkgdesc='eXtensible UPnP agent (proxy IP TV multicast to DLNA)'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://${pkgname}.org"
license=('GPL2')
depends=('lua')
makedepends=('git')
optdepends=('udpxy: custom udp to http proxy')
backup=("var/lib/${pkgname}/${pkgname}.lua")
source=("${pkgname}::git+https://github.com/clark15b/${pkgname}#commit=2bc1e741e0efe04cb3150430ff25410093618b4f"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        'makefile.patch')
sha256sums=('SKIP'
            'c5404309699c528e09ff399da1253e3ab6006040c51a1ad6c63d59f1f43c356e'
            '3f669a1034bcfb9923822fb0adf6d5a379beb7a184a89cd4d72a5b02bc072852'
            'c86de2d435c37d6b2560e844291843d159c643052f82126774ee5ff809e05adb')

prepare() {
	cd "${srcdir}/${pkgname}/src"
	patch -p2 -i "${srcdir}/makefile.patch"
	sed -e 's,/run,/lib/xupnpd,' -i xupnpd.lua
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.r%s.g%s" \
		"$(awk -F\' '/version/ {printf $2}' src/xupnpd.lua)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}/src"
	make MY_CFLAGS="${CFLAGS}"
}

package() {
	cd "${srcdir}"
	install -Dm0644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm0644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

	cd "${pkgname}/src"
	install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -dm0755 "${pkgdir}/var/lib/${pkgname}/examples"
	install -dm0755 "${pkgdir}/var/lib/${pkgname}/localmedia"
	install -dm0755 "${pkgdir}/var/lib/${pkgname}/playlists"
	install -Dm0644 *.lua -t "${pkgdir}/var/lib/${pkgname}"
	cp -ax "config" "${pkgdir}/var/lib/${pkgname}"
	cp -ax "playlists" "${pkgdir}/var/lib/${pkgname}/examples"
	cp -ax "plugins" "${pkgdir}/var/lib/${pkgname}"
	cp -ax "profiles" "${pkgdir}/var/lib/${pkgname}"
	cp -ax "ui" "${pkgdir}/var/lib/${pkgname}"
	cp -ax "www" "${pkgdir}/var/lib/${pkgname}"
	chown -R 187:187 "${pkgdir}/var/lib/${pkgname}"
}
