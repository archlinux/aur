# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Amanoel Dawod <amoka at amanoel dot com>
# Contributor: Elliott Saille <me+aur@esaille.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: unikum <unikum.pm@gmail.com>
# Contributor: speed145a <jonathan@tagchapter.com>

pkgbase=firewalld-git
_pkgbase="${pkgbase%-git}"
pkgname=('firewalld-git' 'firewalld-test-git')
pkgver=r4006.d99076a5
pkgrel=1
epoch=1
url="https://firewalld.org"
arch=('any')
license=('GPL-2.0-or-later')
makedepends=('docbook-xsl' 'git' 'intltool' 'podman')
source=("git+https://github.com/firewalld/firewalld.git"
        'firewalld-sysconfigdir.patch'
        'fix_gettext_macros_path.patch')
sha256sums=('SKIP'
            '3b2e00f67680c2e620804eb28620d7370b4096851bcb5f6fec22460a21941ad9'
            '49f793aeaf2e87c834c734b37dc926c9579cc2ec0782e5fe297ee286df6c7ef6')

pkgver() {
	cd "${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgbase}"

	# Use '/etc/conf.d' rather than '/etc/sysconfig'
	patch -Np1 -i "${srcdir}/firewalld-sysconfigdir.patch"
	# Fix gettext's macros path
	patch -Np1 -i "${srcdir}/fix_gettext_macros_path.patch"

	NOCONFIGURE=true ./autogen.sh
}

build() {
	cd "${_pkgbase}"
	./configure \
		--prefix=/usr \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--disable-schemas-compile \
		--disable-sysconfig
	make
}

package_firewalld-git() {
	pkgdesc="Firewall daemon with D-Bus interface (git version)"
	depends=('python-dbus' 'glib2' 'hicolor-icon-theme'
		 'nftables' 'python-capng' 'python-gobject')
	optdepends=('bash-completion: bash completion'
	            'gtk3: firewall-config'
		    'libnotify: firewall-applet'
		    'networkmanager: NetworkManager support'
		    'polkit: privileged actions'
		    'python-pyqt6: firewall-applet')
	provides=('firewalld')
	conflicts=('firewalld')
	backup=('etc/conf.d/firewalld'
	        'etc/firewalld/firewalld.conf')

	make DESTDIR="${pkgdir}" -C "${_pkgbase}" install
	python -m compileall -d /usr/lib "${pkgdir}/usr/lib"
	python -O -m compileall -d /usr/lib "${pkgdir}/usr/lib"

	# Remove test suite
	rm -rvf "${pkgdir}/usr/share/firewalld/testsuite/"
}

package_firewalld-test-git() {
	pkgdesc="FirewallD test suite (git version)"
	provides=('firewalld-test')
	conflicts=('firewalld-test')

	make DESTDIR="${pkgdir}" -C "${_pkgbase}/src/tests" install
}
