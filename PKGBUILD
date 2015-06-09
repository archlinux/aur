# Maintainer: Phillipe Smith <phillipe@archlinux.com.br>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=lxdm-git
_gitname=lxdm
pkgver=0.5.1.r1.g6d5b573
pkgrel=1
pkgdesc='Lightweight Display Manager (part of LXDE) - git checkout'
arch=('i686' 'x86_64')
url="http://blog.lxde.org/?p=531"
license=('GPL')
groups=('lxde')
provides=('lxdm')
conflicts=('lxdm' 'lxdm-svn')
install=lxdm.install
backup=('etc/lxdm/lxdm.conf' 'etc/pam.d/lxdm' 'etc/lxdm/Xsession'
    'etc/lxdm/PreLogin' 'etc/lxdm/LoginReady' 'etc/lxdm/PostLogin'
    'etc/lxdm/PostLogout' 'etc/lxdm/PreReboot' 'etc/lxdm/PreShutdown')
depends=('cairo' 'dbus-core' 'gdk-pixbuf2' 'glib2' 'gtk2' 'libx11' 'libxcb' 'pango')
makedepends=('intltool' 'git')
source=('lxdm::git+http://git.lxde.org/git/lxde/lxdm.git'
    'http://dl.dropbox.com/u/4813005/lxdm/lxdm-themes.tar.gz'
    'Xsession.patch' 'lxdm.patch' 'lxdm.conf.patch' 'xconn.patch'
    'lxdm-pam' 'PostLogout')
md5sums=('SKIP'
         '1cc5163253149952329671db34ce7907'
         '9bdf95adb74d81d4b6b6176fb1142090'
         'baed9055e8825a5511712bc095197519'
         'e0653feadbcf9c8fcea1600008b32850'
         'a3bdde937a4ec72416f23bd7e644b620'
         '2897b4f8bf09bdfa060e1be52868873f'
         '5d585acc332056b8d5be3a15d2f20d84')

pkgver() {
    cd $_gitname

    if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
            echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[_-]\+/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
    else
            echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
    fi
}

build() {
    cd $_gitname
    
    ./autogen.sh    
    
    sed -i '/es_VE/d;/frp/d' po/LINGUAS # Fix language compile errors
    
    ./configure --prefix=/usr --bindir=/usr/bin --sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib/lxdm --localstatedir=/var --with-pam
    make

    sed -i 's/getty@tty1/getty@tty7/g' systemd/lxdm.service
    sed -i 's/sbin/bin/' systemd/lxdm.service
    sed -i 's/sbin/bin/' data/lxdm

    patch -Np0 < ${srcdir}/lxdm.patch
    patch -Np0 < ${srcdir}/lxdm.conf.patch
    patch -Np0 < ${srcdir}/Xsession.patch
    patch -Np1 < ${srcdir}/xconn.patch
}

package() {
    cd $_gitname

    make DESTDIR=${pkgdir} sbindir=/usr/bin install
    chmod 644 "$pkgdir/etc/lxdm/lxdm.conf"
    install -m644 ${srcdir}/lxdm-pam ${pkgdir}/etc/pam.d/lxdm
    install -m755 ${srcdir}/PostLogout ${pkgdir}/etc/lxdm/PostLogout

    # Home directory
    install -d ${pkgdir}/var/{lib,run}/lxdm    
    chown -R 121:121 "$pkgdir/var/lib/lxdm"
    echo 'GDK_CORE_DEVICE_EVENTS=true' > "$pkgdir"/var/lib/lxdm/.pam_environment

    # Custom themes
    cp -r ${srcdir}/lxdm-themes/* ${pkgdir}/usr/share/lxdm/themes

    # GNOME Shell extension
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
    cp -r gnome-shell/LXDM_User_Switch@dgod "$pkgdir/usr/share/gnome-shell/extensions"

    # avoid conflict with filesystem>=2012.06
    rm -r ${pkgdir}/var/run
}

