# Maintainer: 3ED <krzysztof1987@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgbase=gdm-old
pkgname=(gdm-old gdm-old-faces)
_pkgname=gdm
pkgver=2.20.11
pkgrel=9.2
pkgdesc="Gnome Display Manager (a reimplementation of xdm)"
arch=(i686 x86_64)
license=('GPL')
depends=('pam' 'libdmx' 'libgnomecanvas' 'librsvg' 'dbus-glib' 'zenity' 'polkit' 'systemd')
makedepends=('intltool' 'gnome-doc-utils' 'pkgconfig' 'xorg-server')
url="http://www.gnome.org"
groups=('gnome-extra')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/2.20/${_pkgname}-${pkgver}.tar.bz2
        defaults.conf
        gdm.pam
        gdm-autologin.pam
        gdm.service
        org.gnome2.pkexec.gdmsetup.policy
        01_gdmchooser-ipv6_bindv6only-workaround.patch
        02_xdmcp-ipv6_bindv6only.patch
        03_arch-sysres-paths.patch)
sha256sums=('2e21c9a44941cd0033aaa6b381b563488bbdd0ad1a28ef05f7e0178891f1eaa2'
            '9f654e761407079012c669021f935414d031699955c123fca92366a6ba096f64'
            'fb3aa7e7b5cf5403581d5912ac79361e8b70481c1170d3a4d1f51aea315b9e92'
            'b50136199204911205cb67b6325b23f4b155c66ed14569465a9ffc1d992be97f'
            '4bb13f97448351ae80a0caf8ed0e13360ae37956ed8ec16369649bcb75e062a0'
            '9079378fb3b0a60224bbbe91a518c11fc2e3e7b2df4747fe6045dc13d1e35815'
            '790eaa15a0a2f069325d5e875745dc834a866b7a4c4c5dbaf03580447d1ae94d'
            'e1036348765b6329dcf80eed22b5b61cf5c0c838efbd9cb5616966e941dbdfc0'
            'f19a3a23afb1d7124df2020e670efdb9588150740dfc40e1af5313061fdf0d09')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # probably better idea to do it inside makepkg instead in pkgbuilds
  local i
  for i in "${source[@]}"; do
    if [ "${i##*.}" = "patch" ]; then
      msg2 "Patching: ${i}..."
      patch -Np1 -i "$srcdir/$i"
    fi
  done
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --disable-dependency-tracking \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/gdm \
    --localstatedir=/var/lib \
    --disable-static \
    --with-xevie=yes \
    --disable-scrollkeeper \
    --enable-secureremote=yes \
    --enable-ipv6=yes \
    LDFLAGS="-lXau -lm"

  sed -i -e 's|${prefix}|/usr|' config.h
  make
}

package_gdm-old() {
  provides=('gdm')
  conflicts=('gdm')
  optdepends=("polkit-gnome: PolicyKit authentication agent for users without gnome-shell")
  backup=('etc/gdm/custom.conf' 'etc/pam.d/gdm' 'etc/pam.d/gdm-autologin')
  install=gdm-old.install
  changelog=gdm-old.changelog

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  #PAM
  install -m644 "${srcdir}/gdm-autologin.pam" "${pkgdir}/etc/pam.d/gdm-autologin"
  install -m644 "${srcdir}/gdm.pam" "${pkgdir}/etc/pam.d/gdm"

  #systemd service
  install -m755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m644 "${srcdir}/gdm.service" "${pkgdir}/usr/lib/systemd/system/gdm.service"
  install -m644 "${srcdir}/gdm.service" "${pkgdir}/usr/lib/systemd/system/gdm-old.service"

  #configuration
  install -m444 "${srcdir}/defaults.conf" "${pkgdir}/usr/share/gdm/" 
  rm -f ${pkgdir}/usr/share/xsessions/gnome.desktop || true

  #PolicyKit execution scheme
  install -m755 -d "${pkgdir}/usr/share/polkit-1/actions/"
  install -m644 "${srcdir}/org.gnome2.pkexec.gdmsetup.policy" "${pkgdir}/usr/share/polkit-1/actions/"

  #fix gdmsetup.desktop
  sed -e 's|^Exec=|Exec=pkexec |; s|/usr/sbin/gdmsetup|/usr/bin/gdmsetup|g' \
      -i "${pkgdir}/usr/share/gdm/applications/gdmsetup.desktop"

  #fix gdm files conflict with gnome-control-center (usr/share/pixmaps/faces/*)
  rm -f "${pkgdir}/usr/share/pixmaps/faces/"*

  #fix "warning: directory permissions differ on var/log/gdm/"
  test -d "${pkgdir}/var/log/gdm/" && chmod 1770 "${pkgdir}/var/log/gdm/"
}

package_gdm-old-faces() {
  pkgrel=8.1
  depends=('gdm-old')
  conflicts=('gnome-control-center')
  pkgdesc="Default faces for GDM (you may install gnome-control-center instead)"
  changelog=gdm-old-faces.changelog

  cd "${srcdir}/${_pkgname}-${pkgver}"

  #fix gdm files conflict with gnome-control-center (usr/share/pixmaps/faces/*)
  install -m755 -d "${pkgdir}/usr/share/pixmaps/faces/"

  make DESTDIR="${pkgdir}" install -C gui/faces
}
