# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=systemd_mon
pkgver=0.1.0+9+gbec6981
_pkgver="${pkgver%%+*}"
pkgrel=2
pkgdesc='Monitor systemd units and trigger alerts for failed states.'
arch=('any')
url='https://github.com/joonty/systemd_mon'
license=('MIT')
depends=('ruby' 'ruby-dbus')
optdepends=('ruby-mail: email notifier support'
            'ruby-slack-notifier: slack notifier support'
            'ruby-hipchat: hipchat notifier support')
makedepends=('git' 'ruby-bundler' 'ruby-rake')
options=(!emptydirs)
source=("git+https://github.com/joonty/${pkgname}#commit=bec6981"
        "ruby-dbus-version.patch"
        "${pkgname}.service"
        "sample-config.yml")
sha256sums=('SKIP'
            'ef4530ff57194f4738a2ddf90433c4ecc4566649c04f2df110487594304b0933'
            'c23f5a4fb346e4294e5764ae8544b3f00fe40c5f8adbba0ffc5accfb3e5171b6'
            '402b42e7b76385137541cdf397b32886116c6a975568556c87de7dd25fe670ed')

pkgver() {
	cd "${pkgname}"

	git describe --long | cut -c 2- | sed 's/-/+/g'
}

prepare() {
	cd "${pkgname}"

	patch < "${srcdir}/ruby-dbus-version.patch"
}

build() {
	cd "${pkgname}"

	rake build
}

package() {
	local _gemdir="$(ruby -e'puts Gem.default_dir')"
	gem install --ignore-dependencies --no-user-install -i "${pkgdir}/${_gemdir}" -n "${pkgdir}/usr/bin" "${pkgname}/pkg/${pkgname}-${_pkgver}.gem"
	rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${_pkgver}.gem"

	install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "sample-config.yml" "${pkgdir}/etc/${pkgname}/sample-config.yml"
}
