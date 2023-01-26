# Maintainer: Silvio Fricke <silvio fricke@gmail.com>
# Contributor: Michel Wohlert <michel.wohlert@gmail.com>

pkgname=networkmanager-fortisslvpn-git
pkgver=1.4.1.dev.r22.g2cfbc60
pkgrel=1
pkgdesc='NetworkManager VPN plugin for fortisslvpn - git checkout'
arch=('i686' 'x86_64')
license=('GPL')
url='https://git.gnome.org/browse/network-manager-fortisslvpn'
depends=('networkmanager' 'nm-connection-editor' 'openfortivpn' 'libsecret')
makedepends=('git' 'intltool' 'python' 'xorgproto' 'pkg-config' 'appstream-glib')
provides=('networkmanager-fortisslvpn')
conflicts=('networkmanager-fortisslvpn')
source=('network-manager-fortisslvpn::git+https://gitlab.gnome.org/GNOME/NetworkManager-fortisslvpn.git#branch=main')
sha256sums=('SKIP')

pkgver() {
        cd network-manager-fortisslvpn/

        if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
                printf '%s.r%s.g%s' \
                        "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
                        "$(git rev-list --count ${GITTAG}..)" \
                        "$(git log -1 --format='%h')"
        else
                printf '0.r%s.g%s' \
                        "$(git rev-list --count master)" \
                        "$(git log -1 --format='%h')"
        fi
}
build() {
        cd network-manager-fortisslvpn/

        ./autogen.sh
        ./configure --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --libexecdir=/usr/lib/networkmanager \
                --enable-more-warnings=yes \
                --disable-static
        make
}

package() {
        cd network-manager-fortisslvpn/

        make DESTDIR="${pkgdir}" install

        chmod a+rx "${pkgdir}"/var/lib/NetworkManager-fortisslvpn
}

