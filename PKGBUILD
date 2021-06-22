pkgname=gaeul-git
_pkgname='gaeul'
pkgver=r225.dcff238
pkgrel=1
pkgdesc='Gaeul agents are a set of services that constitue a Hwangsaeul (H8L) deployment'
arch=('x86_64')
url='https://github.com/hwangsaeul/gaeul'
license=('APACHE-2.0')
conflicts=('gaeul')
provides=('gaeul')
source=("${_pkgname}.sysusers"
        "git+https://github.com/hwangsaeul/gaeul.git")
sha256sums=('8d690553c6787bc8bfa2c21adca41e073065ff151d75b260e5e856b53ad0cce5'
            'SKIP')

makedepends=(git meson ninja)
depends=(gaeguli)

pkgver() {
    cd gaeul
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd gaeul

    meson --prefix /usr build
    ninja -C build
}

package() {
    cd gaeul
    DESTDIR="$pkgdir" ninja -C build install
    install -Dm644 "debian/gaeul2-source-agent.default" "${pkgdir}/etc/default/gaeul2-source-agent"
    install -Dm644 "debian/gaeul2-source-agent.service" "${pkgdir}/usr/lib/systemd/system/gaeul2-source-agent.service"
    install -Dm0644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
