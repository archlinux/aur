# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>

pkgbase='packagekit-git'
pkgname=('packagekit-git' 'libpackagekit-glib-git')
pkgver=1.2.5
pkgrel=2
pkgdesc='A system designed to make installation and updates of packages easier'
arch=('x86_64')
url='https://www.freedesktop.org/software/PackageKit/'
license=('GPL')
makedepends=('polkit' 'sqlite' 'gobject-introspection' 'intltool'
             'bash-completion' 'vala' 'meson')
options=('!emptydirs')
validpgpkeys=('163EB50119225DB3DF8F49EA17ACBA8DFA970E17'        # Richard Hughes <richard@hughsie.com>
              'EC60AABDF42AAE8FB062640480858FA38F62AF74')       # Kalev Lember <klember@redhat.com>
source=('0001-build-fix-overall-sysconfdir-handling-so-it-can-work.patch'
        "git+https://github.com/PackageKit/PackageKit.git#branch=main")
replaces=(packagekit)
sha256sums=('f4dd7ce7dc2ef4a1b3d39a789d108c6e7f7791534b946b34a23b6553a9df3797'
            SKIP)

prepare() {
  for _patch in *.patch; do
    patch -d PackageKit -p1 < $_patch
  done
}

build() {
        local _meson_options=(
                -Dcron=false
                -Ddbus_sys=/usr/share/dbus-1/system.d
                -Dgstreamer_plugin=false
                -Dgtk_doc=false
                -Dgtk_module=false
                -Dpackaging_backend=alpm
                -Dsystemd=true
        )

        arch-meson "PackageKit" build "${_meson_options[@]}"

        ninja -C build
}

package_packagekit-git() {
        depends=('libpackagekit-glib' 'pacman>=6.0.0' 'polkit' 'sqlite')
        optdepends=('bash-completion: command completion in bash')
        backup=('var/lib/PackageKit/transactions.db'
                'etc/PackageKit/alpm.d/pacman.conf'
                'etc/PackageKit/alpm.d/repos.list')

        # install directory with root owner, polkit group and
        # correct permission
        install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"

        DESTDIR="$pkgdir" meson install -C build

        # move away for libpackagekit-glib
        mkdir -p libpackagekit/usr/{lib,share}
        mv "$pkgdir"/usr/include/ libpackagekit/usr/
        mv "$pkgdir"/usr/lib/{girepository-1.0,libpackagekit-glib2.so*,pkgconfig} libpackagekit/usr/lib/
        mv "$pkgdir"/usr/share/{gir-1.0,vala}/ libpackagekit/usr/share/
}

package_libpackagekit-glib-git() {
        pkgdesc='GLib library for accessing PackageKit'
        depends=('glib2')

        mv libpackagekit/usr/ "$pkgdir"/
}
