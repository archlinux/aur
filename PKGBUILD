# Maintainer: Yamashiro <dev@cosmicheron.com>

pkgname='udev-joystick-blacklist-git'
pkgdesc="Fix for keyboards/mice/tablets being detected as joysticks in Linux"
pkgver=r123.d7c2370
pkgrel=2
url='https://github.com/denilsonsa/udev-joystick-blacklist'
arch=('x86_64' 'aarch64')
license=('Public Domain')
makedepends=('git')
provides=("${pkgname%'-git'}")
conflicts=("${pkgname%'-git'}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	# Upstream recommended method of setting the permissions of erroneously detected gamepads to 0000
	install -Dm644 "${srcdir}/${pkgname}/after_kernel_4_9/51-these-are-not-joysticks.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks.rules"

	# Alternative methods (ONLY EVER USE ONE, COMMENT THE OTHER ONES OUT):
	# 1. If you would instead prefer to remove the the false gamepads instead uncomment the line below
	#install -Dm644 "${srcdir}/${pkgname}/after_kernel_4_9/51-these-are-not-joysticks-rm.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks-rm.rules"

	# 2. Permission rules but with added legacy rules that include Microsoft devices (there were patched in kernel 4.9)
	#install -Dm644 "${srcdir}/${pkgname}/51-these-are-not-joysticks.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks.rules"

	# 3. Removal rules but with added legacy rules that include Microsoft devices (these were patched in kernel 4.9)
	#install -Dm644 "${srcdir}/${pkgname}/51-these-are-not-joysticks-rm.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks-rm.rules"
}
