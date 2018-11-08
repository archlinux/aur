# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=lxdm-git
_gitname=lxdm
pkgver=0.5.3.r22.gcee37e0
pkgrel=1
pkgdesc='Lightweight Display Manager (part of LXDE) - git checkout'
arch=('i686' 'x86_64')
url="http://blog.lxde.org/?p=531"
license=('GPL')
groups=('lxde')
provides=('lxdm')
conflicts=('lxdm' 'lxdm-svn')
install=lxdm.install
backup=('etc/lxdm/lxdm.conf'
        'etc/pam.d/lxdm'
        'etc/lxdm/Xsession'
        'etc/lxdm/PreLogin'
        'etc/lxdm/LoginReady'
        'etc/lxdm/PostLogin'
        'etc/lxdm/PostLogout'
        'etc/lxdm/PreReboot'
        'etc/lxdm/PreShutdown')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libx11' 'libxcb' 'pango' 'xorg-server')
makedepends=('intltool' 'git' 'iso-codes')
optdepends=('gtk-engines: default GTK+ theme'
            'iso-codes: show language names in language chooser'
            'librsvg: display the default background')
source=('lxdm::git+http://git.lxde.org/git/lxde/lxdm.git'
        'https://www.dropbox.com/s/ml14ufozdx8sunb/lxde-themes.tar.gz?dl=1'
        'Xsession'
        'lxdm.in.patch'
        'lxdm.conf.in.patch'
        'lxdm.pam')
md5sums=('SKIP'
         '4f9e02b15db17f51126941035a192008'
         'de8be632e7daef6787628ebb0dc94ad1'
         'b40a5e90b95b07c7fc1120da574c3149'
         '1062f248ce6e7b3868fdc60da0645458'
         'c941ef896248bc7c03901b513490425c')

pkgver() {
    cd $_gitname

    if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
        echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-]\+/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
    else
        echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
    fi
}

prepare() {
    cd $_gitname
    
    patch -Np1 < ../lxdm.in.patch
    patch -Np1 < ../lxdm.conf.in.patch

    cp ../Xsession data/Xsession
    cp ../lxdm.pam pam/lxdm
}

build() {
    cd $_gitname
    
    ./autogen.sh        
    ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin --sysconfdir=/etc \
    	    --libexecdir=/usr/lib/lxdm --localstatedir=/var
    make
}

package() {
    cd $_gitname

    make DESTDIR=${pkgdir} install
    chmod 644 "$pkgdir/etc/lxdm/lxdm.conf"

    # Home directory
    install -dm 755 ${pkgdir}/var/lib/lxdm    
    echo 'GDK_CORE_DEVICE_EVENTS=true' > "$pkgdir"/var/lib/lxdm/.pam_environment

    # Custom themes
    cp -r ${srcdir}/{AwOken*,Orta} ${pkgdir}/usr/share/lxdm/themes

    # GNOME Shell extension
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
    cp -r gnome-shell/LXDM_User_Switch@dgod "$pkgdir/usr/share/gnome-shell/extensions"
}

