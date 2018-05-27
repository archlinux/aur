_pkgname=cros-container-guest-tools
pkgname=${_pkgname}-git
pkgver=r40.1d1a032
pkgrel=1
pkgdesc="Guest tools for the Crostini containers on ChromeOS"
arch=('any')
license=('custom')
depends=('')
optdepends=(
	'xdg-utils: for setting default-web-browser to ChromeOS host via garcon bridge'
	'xorg-apps: for XWayland functionality'
	'wayland: for Wayland functionality'
)
install=cros-container-guest-tools.install
url="https://chromium.googlesource.com/chromiumos/containers/cros-container-guest-tools"
source=("git+${url}")
sha1sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

	# License
	install -m644 -D ${srcdir}/${_pkgname}/LICENSE \
					 ${pkgdir}/usr/share/licenses/cros-container-guest-tools/LICENSE

	### cros-adapta -> included into cros-container-guest-tools.install

#   After https://bugs.archlinux.org/task/58701 is fixed, will be done in PKGBUILD
#
#	mkdir -p ${pkgdir}/usr/share/themes
#	ln -sf /opt/google/cros-containers/cros-adapta \
#		   ${pkgdir}/usr/share/themes/CrosAdapta

	### cros-apt-config -> not applicable

	### cros-garcon

	install -m755 -D ${srcdir}/${_pkgname}/cros-garcon/garcon-url-handler \
					 ${pkgdir}/usr/bin/garcon-url-handler
	install -m644 -D ${srcdir}/${_pkgname}/cros-garcon/garcon_host_browser.desktop \
					 ${pkgdir}/usr/share/applications/garcon_host_browser.desktop
	install -m644 -D ${srcdir}/${_pkgname}/cros-garcon/cros-garcon.service \
					 ${pkgdir}/usr/lib/systemd/user/cros-garcon.service
	install -m644 -D ${srcdir}/${_pkgname}/cros-garcon/cros-garcon-override.conf \
					 ${pkgdir}/usr/lib/systemd/user/cros-garcon.service.d/cros-garcon-override.conf

	### cros-guest-tools -> not applicable

	### cros-sftp

	install -m644 -D ${srcdir}/${_pkgname}/cros-sftp/cros-sftp.service \
					 ${pkgdir}/usr/lib/systemd/system/cros-sftp.service

	### cros-sommelier

	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelierrc \
					 ${pkgdir}/etc/sommelierrc
	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelier.sh \
					 ${pkgdir}/etc/profile.d/sommelier.sh
	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelier@.service \
					 ${pkgdir}/usr/lib/systemd/user/sommelier@.service
	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelier-x@.service \
					 ${pkgdir}/usr/lib/systemd/user/sommelier-x@.service

	### cros-sommelier-config

	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier-config/cros-sommelier-override.conf \
					 ${pkgdir}/usr/lib/systemd/user/sommelier@0.service.d/cros-sommelier-override.conf
	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier-config/cros-sommelier-x-override.conf \
					 ${pkgdir}/usr/lib/systemd/user/sommelier-x@0.service.d/cros-sommelier-x-override.conf

	### cros-sudo-config

	install -m440 -D ${srcdir}/${_pkgname}/cros-sudo-config/10-cros-nopasswd \
					 ${pkgdir}/etc/sudoers.d/10-cros-nopasswd
	# replace sudo group with wheel group for no password sudo access
	sed -i 's/%sudo/%wheel/1' ${pkgdir}/etc/sudoers.d/10-cros-nopasswd

	### cros-systemd-overrides -> included into cros-container-guest-tools.install

	### cross-ui-config

	install -m644 -D ${srcdir}/${_pkgname}/cros-ui-config/gtkrc \
				     ${pkgdir}/etc/gtk-2.0/gtkrc
	install -m644 -D ${srcdir}/${_pkgname}/cros-ui-config/settings.ini \
				     ${pkgdir}/etc/gtk-3.0/settings.ini
	install -m644 -D ${srcdir}/${_pkgname}/cros-ui-config/01-cros-ui \
				     ${pkgdir}/etc/dconf/db/local.d/01-cros-ui
	install -m644 -D ${srcdir}/${_pkgname}/cros-ui-config/user \
				     ${pkgdir}/etc/dconf/profile/user
	install -m644 -D ${srcdir}/${_pkgname}/cros-ui-config/Trolltech.conf \
				     ${pkgdir}/etc/xdg/Trolltech.conf

	### cros-unattended-upgrades -> not applicable

	### cros-wayland

	install -m644 -D ${srcdir}/${_pkgname}/cros-wayland/10-cros-virtwl.rules \
					 ${pkgdir}/usr/lib/udev/rules.d/10-cros-virtwl.rules
	install -m644 -D ${srcdir}/${_pkgname}/cros-wayland/skel.weston.ini \
					 ${pkgdir}/etc/skel/.config/weston.ini
}
