_pkgname=cros-container-guest-tools
pkgname=${_pkgname}-git
pkgver=r44.45e9b92
pkgrel=7
pkgdesc="Guest tools for the Crostini containers on ChromeOS"
arch=('any')
license=('custom')
depends=()
optdepends=(
	'xdg-utils: for setting default-web-browser to ChromeOS host via garcon bridge'
	'xorg-apps: for XWayland functionality'
	'wayland: for Wayland functionality'
)
install=cros-container-guest-tools.install
url="https://chromium.googlesource.com/chromiumos/containers/cros-container-guest-tools"
source=("git+${url}" 'cros-sftp-conditions.conf' 'cros-garcon-conditions.conf' 'cros-locale.sh')
sha1sums=('SKIP'
          '0b0a9dceee7973e5680f0612c7721b5f13a624f7'
          'd326cd35dcf150f9f9c8c7d6336425ec08ad2433'
          'b5a315f5b8f474a31dc3576efa3ef19881ec80d6')

pkgver() {
	cd ${srcdir}/${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

	# License
	install -m644 -D ${srcdir}/${_pkgname}/LICENSE \
					 ${pkgdir}/usr/share/licenses/cros-container-guest-tools/LICENSE

	# install locale fix (to override C.UTF-8 locale, set to container by termina)
	install -m755 -D ${srcdir}/cros-locale.sh \
					 ${pkgdir}/etc/profile.d/cros-locale.sh

	# Create required folder structure for systemd units
	mkdir -p ${pkgdir}/usr/lib/systemd/user/default.target.wants
	mkdir -p ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants

	### cros-adapta -> included into cros-container-guest-tools.install

#   Uncomment after https://bugs.archlinux.org/task/58701 is fixed
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
	install -m644 -D ${srcdir}/cros-garcon-conditions.conf \
					 ${pkgdir}/usr/lib/systemd/user/cros-garcon.service.d/cros-garcon-conditions.conf
	ln -sf ../cros-garcon.service \
		   ${pkgdir}/usr/lib/systemd/user/default.target.wants/cros-garcon.service

	### cros-guest-tools -> not applicable

	### cros-sftp

	install -m644 -D ${srcdir}/${_pkgname}/cros-sftp/cros-sftp.service \
					 ${pkgdir}/usr/lib/systemd/system/cros-sftp.service
	ln -sf ../cros-sftp.service \
		   ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/cros-sftp.service

	# add drop-in for cros-sftp to check if required ssh artifacts were bind-mounted before starting
	install -m644 -D ${srcdir}/cros-sftp-conditions.conf \
					 ${pkgdir}/usr/lib/systemd/system/cros-sftp.service.d/cros-sftp-conditions.conf

	### cros-sommelier

#   Uncomment after https://bugs.archlinux.org/task/58701 is fixed

#	ln -sf /opt/google/cros-containers/bin/sommelier \
#		   ${pkgdir}/usr/bin/sommelier

	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelierrc \
					 ${pkgdir}/etc/sommelierrc
	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelier.sh \
					 ${pkgdir}/etc/profile.d/sommelier.sh
	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelier@.service \
					 ${pkgdir}/usr/lib/systemd/user/sommelier@.service
	install -m644 -D ${srcdir}/${_pkgname}/cros-sommelier/sommelier-x@.service \
					 ${pkgdir}/usr/lib/systemd/user/sommelier-x@.service
	ln -sf ../sommelier@.service \
		   ${pkgdir}/usr/lib/systemd/user/default.target.wants/sommelier@0.service
	ln -sf ../sommelier-x@.service \
		   ${pkgdir}/usr/lib/systemd/user/default.target.wants/sommelier-x@0.service

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
