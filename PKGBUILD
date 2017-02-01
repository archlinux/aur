# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=firestarter
pkgver=1.0.3
pkgrel=16
pkgdesc="GUI front-end for iptables"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('net-tools' 'iptables' 'gtk2' 'libgnome' 'libgnomeui' 'libglade'
         'pango' 'gksu' 'perl-xml-parser' 'gnome-vfs')
makedepends=('patch')
url="http://www.fs-security.com/"
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/firestarter/$pkgname-$pkgver.tar.gz"
        '12-firestarter_transparent_icon.patch'
        '18-fix_memleak.patch'
        '20-net-tools-ifconfig-format-change.patch'
        '30-conntrack-proc-path.patch'
        'events-log-fix.patch'
        'menu-toolbar-icons-fix.patch'
        'firestarter.service')
md5sums=('f46860a9e16dac4b693bd05f16370b03'
         'b657c53280b30f1b4976ec01eff085e8'
         'b31efd1caf430d979e26abb2618a3659'
         '7bcd40b3690e3833078ea31a8a9935f1'
         '56d77ceb2a6b249c01922ccc46b12eb6'
         'acd91fefe00edb41dd38fcc91567707f'
         'ea9cd9b92939c554b26ccdfe735a2d90'
         '3ad02ca9c95f7b897e1b57b040148a2a')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  # Apply patches to fix things
  # Transparent tray icon (from Ubuntu launchpad)
  patch -Np1 -i "$srcdir"/12-firestarter_transparent_icon.patch
  # fix GUI crashes on newer Gnome libs (from Ubuntu launchpad)
  patch -Np1 -i "$srcdir"/18-fix_memleak.patch
  # patch to use the new 'ifconfig' from net-tools (thanks to Joeny Ang)
  patch -Np1 -i "$srcdir"/20-net-tools-ifconfig-format-change.patch
  # Replace kernel.log with iptables.log
  patch -Np1 -i "$srcdir"/events-log-fix.patch
  # menu-toolbar-icons-fix.patch: fixed a couple menu and toolbar icons to follow GTK theme
  patch -Np1 -i "$srcdir"/menu-toolbar-icons-fix.patch
  # path to the conn track table in /proc has changed
  patch -Np1 -i "$srcdir"/30-conntrack-proc-path.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # Configure, Build and Install to $pkgdir
  export LDFLAGS='-lX11'
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  # Create default empty ruleset and fix permissions
  install -dm755 "$pkgdir"/etc/firestarter/outbound/
  touch "$pkgdir"/etc/firestarter/outbound/allow-service
  chown -R root:root "$pkgdir"/etc/firestarter/

  # Fix the desktop launcher to run with root permission using gksudo.
  sed -e "s|Exec=|TryExec=gksu\n\0gksu |" \
      -i "$pkgdir"/usr/share/gnome/apps/Internet/firestarter.desktop

  # Move the .desktop file to a standard location
  install -Dm644 "$pkgdir"/usr/share/gnome/apps/Internet/${pkgname}.desktop \
    "$pkgdir"/usr/share/applications/${pkgname}.desktop
  rm -rf "$pkgdir"/usr/share/gnome

  # Merge Schema files to /usr/share/gconf so the .install file can update the database at install time.
  install -dm755 "$pkgdir"/usr/share/gconf/schemas
  gconf-merge-schema "${pkgdir}"/usr/share/gconf/schemas/${pkgname}.schemas \
    "$srcdir"/${pkgname}-${pkgver}/*.schemas
  rm -Rf "$pkgdir"/etc/gconf

  # install systemd "unit file"
  install -D -m755 "$srcdir"/firestarter.service "$pkgdir"/usr/lib/systemd/system/firestarter.service
}

# vim:set ts=2 sw=2 et:
