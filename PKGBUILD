# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=default-settings
_author=elementary
pkgname=pantheon-default-settings
pkgver=5.1.1
pkgrel=3
pkgdesc="Default settings for Pantheon"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('elementary-icon-theme' 'gtk-theme-elementary'
         'elementary-wallpapers' 'ttf-droid' 'ttf-opensans' 'ttf-roboto')
provides=('pantheon-default-settings')
conflicts=('pantheon-default-settings')
provides=("${_gitname}")
conflicts=("${_gitname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
		'arch-tweaks.patch'
        'leave-bg-alone.patch')
sha256sums=('7f17ef8d1dcdaca0017cf8bcf2160543b8b00ad64456e3ff4c826f627b313790'
			'99528c7ed672a5231f4d42d90421cef18d416f2b7aea6e0381db7cea6f9391d3'
			'3732b2209d28c68bb3a11da5726f486db1fca9fcb3776bf58f83c81678b84211')

prepare() {
    cd "${srcdir}/${_gitname}-${pkgver}"

    #Remove ubuntu-specific settings
    patch -Np1 -i ../arch-tweaks.patch

    #Don't touch any background-related settings
    patch -Np2 -i ../leave-bg-alone.patch
}

package() {
    cd "${srcdir}/${_gitname}-${pkgver}"

	install -Dm 644 accountsservice/io.elementary.pantheon.AccountsService.xml -t "${pkgdir}"/usr/share/dbus-1/interfaces/
	install -Dm 644 accountsservice/io.elementary.pantheon.AccountsService.policy -t "${pkgdir}"/usr/share/polkit-1/actions/
  	cp -dr --no-preserve='ownership' plank "${pkgdir}"/etc/skel/.config/
  	cp -dr --no-preserve='ownership' profile.d sudoers.d "${pkgdir}"/etc/
  	install -Dm 644 sessioninstaller.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 settings.ini -t "${pkgdir}"/etc/gtk-3.0/
    install -m 644 debian/elementary-default-settings.gsettings-override "${pkgdir}"/usr/share/glib-2.0/schemas/25_pantheon-default-settings.gschema.override
  	install -dm 755 .inputrc "${pkgdir}"/etc/skel/
  	
  	install -Dm 644 default-testpage.pdf -t "${pkgdir}"usr/share/cups/data
}


